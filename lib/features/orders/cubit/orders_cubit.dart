import 'package:bloc/bloc.dart';
import 'package:csv/csv.dart';
import 'package:file_saver/file_saver.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:paddle_trac_admin_dashboard/models/sticker_order/sticker_order.model.dart';
import 'package:paddle_trac_admin_dashboard/services/order_service.dart';

part 'orders_state.dart';
part 'orders_cubit.freezed.dart';

@injectable
class OrdersPageCubit extends Cubit<OrderPageState> {
  OrdersPageCubit(
    @Named.from(OrderService) this._orderService,
  ) : super(const OrderPageState.initial()) {
    init(null, null);
  }
  final IOrderService _orderService;

  Future<void> init(
    OrderPageStatus? orderPageStatus,
    List<StickerOrder>? currentShownOrders,
  ) async {
    final stickerOrdersResult = await _orderService.list();
    stickerOrdersResult.fold((l) => null, (stickerOrdersUnorderedList) {
      final stickerOrders = stickerOrdersUnorderedList.reversed.toList();
      final status = orderPageStatus ?? OrderPageStatus.inProgress;

      late List<StickerOrder> ordersToShow;

      switch (status) {
        case OrderPageStatus.all:
          ordersToShow = stickerOrders;
          break;
        case OrderPageStatus.completed:
          ordersToShow = stickerOrders
              .where((order) => order.orderStatus == 'Completed')
              .toList();
          break;
        case OrderPageStatus.inProgress:
          ordersToShow = stickerOrders
              .where((order) => order.orderStatus == 'In Progress')
              .toList();
      }

      emit(
        OrderPageState.loaded(
          stickerOrders: stickerOrders,
          inProgressOrders: stickerOrders
              .where((order) => order.orderStatus == 'In Progress')
              .toList(),
          completedOrders: stickerOrders
              .where((order) => order.orderStatus == 'Completed')
              .toList(),
          orderPageStatus: status,
          currentShownOrders: ordersToShow,
        ),
      );
    });
  }

  void print() {
    state.mapOrNull(
      loaded: (loaded) async {
        final rowsAsListOfValues = <List<dynamic>>[
          [
            'Name',
            'Street Address',
            'City',
            'State',
            'ZipCode',
            'Sticker Pack',
          ],
        ];
        for (final o in loaded.selectedOrders) {
          rowsAsListOfValues.add([
            o.customerName,
            o.shippingAddress!.line1,
            o.shippingAddress!.city,
            o.shippingAddress!.state,
            o.shippingAddress!.postalCode,
            o.productName,
          ]);

          // ignore: unused_local_variable
          final emailResult = await _orderService.sendOrderShippedEmail(
            orderDate: o.orderDate,
            orderNumber: o.orderNumber!,
            orderPack: o.productName!,
            orderPrice: o.total.toString(),
            addressLine1: o.shippingAddress!.line1,
            addressLine2: o.shippingAddress?.line2 ?? '',
            addressCity: o.shippingAddress!.city,
            addressState: o.shippingAddress!.state,
            addressZip: o.shippingAddress!.postalCode,
            orderName: o.customerName!,
            orderEmail: o.customerEmail!,
          );
        }

        final csvFile = const ListToCsvConverter().convert(rowsAsListOfValues);

        final bytes = Uint8List.fromList(utf8.encode(csvFile));

        // This will download the file on the device.
        await FileSaver.instance.saveFile(
          name:
              'paddletrac-${DateTime.now()}-${loaded.selectedOrders.length}orders}', // you can give the CSV file name here.
          bytes: bytes,
          ext: 'csv',
          mimeType: MimeType.csv,
        );
        _orderService.updateInProgressOrders(
          stickerOrders: loaded.selectedOrders,
        );
        emit(loaded.copyWith(isLoading: true));
        await Future.delayed(const Duration(seconds: 4));
        await init(
          loaded.orderPageStatus,
          loaded.currentShownOrders,
        );
      },
    );
  }

  void updateScreen({
    required OrderPageStatus orderPageStatus,
    required List<StickerOrder> currentShownStickerOrders,
  }) {
    state.mapOrNull(
      loaded: (loaded) {
        emit(
          loaded.copyWith(
            orderPageStatus: orderPageStatus,
            currentShownOrders: currentShownStickerOrders,
          ),
        );
      },
    );
  }

  void toggleSelectOrder(StickerOrder stickerOrder) {
    state.mapOrNull(
      loaded: (loaded) {
        if (loaded.selectedOrders.contains(stickerOrder)) {
          final orderist = loaded.selectedOrders.toList()
            ..removeWhere(
              (element) => element.paymentId == stickerOrder.paymentId,
            );

          emit(
            loaded.copyWith(
              selectedOrders: orderist,
            ),
          );
        } else {
          final stickerOrders = loaded.selectedOrders.toList()
            ..add(stickerOrder);
          emit(
            loaded.copyWith(
              selectedOrders: stickerOrders,
            ),
          );
        }
      },
    );
  }

  void updateOrderStatusCompleted({
    required int index,
  }) {
    state.mapOrNull(
      loaded: (loaded) {
        final stickerOrder = loaded.currentShownOrders[index];

        if (stickerOrder.orderStatus == 'Completed') {
          return;
        }

        final isAll = loaded.orderPageStatus == OrderPageStatus.all;

        final updatedInProgressOrderList = loaded.inProgressOrders.toList()
          ..removeWhere((element) => element == stickerOrder);
        final updatedCompletedOrders = loaded.completedOrders.toList()
          ..add(stickerOrder.copyWith(orderStatus: 'Completed'));
        final updatedOrders = loaded.stickerOrders.toList()
          ..removeWhere((element) => element == stickerOrder)
          ..add(stickerOrder.copyWith(orderStatus: 'Completed'));
        final updatedCurrentShownOrders = loaded.currentShownOrders.toList()
          ..removeWhere((element) => element == stickerOrder)
          ..insert(index, stickerOrder.copyWith(orderStatus: 'Completed'));

        emit(
          loaded.copyWith(
            completedOrders: updatedCompletedOrders,
            stickerOrders: updatedOrders,
            inProgressOrders: updatedInProgressOrderList,
            currentShownOrders: isAll
                ? updatedCurrentShownOrders
                : loaded.currentShownOrders.toList()
              ..removeWhere((element) => element == stickerOrder),
          ),
        );
      },
    );
  }

  void updateOrderStatusInProgress({
    required int index,
  }) {
    state.mapOrNull(
      loaded: (loaded) {
        final stickerOrder = loaded.currentShownOrders[index];

        if (stickerOrder.orderStatus == 'In Progress') {
          return;
        }

        final isAll = loaded.orderPageStatus == OrderPageStatus.all;

        final updatedInProgressOrderList = loaded.inProgressOrders.toList()
          ..add(stickerOrder.copyWith(orderStatus: 'In Progress'));
        final updatedCompletedOrders = loaded.completedOrders.toList()
          ..removeWhere((element) => element == stickerOrder);
        final updatedOrders = loaded.stickerOrders.toList()
          ..removeWhere((element) => element == stickerOrder)
          ..add(stickerOrder.copyWith(orderStatus: 'In Progress'));
        final updatedCurrentShownOrders = loaded.currentShownOrders.toList()
          ..removeWhere((element) => element == stickerOrder)
          ..insert(index, stickerOrder.copyWith(orderStatus: 'In Progress'));

        emit(
          loaded.copyWith(
            completedOrders: updatedCompletedOrders,
            stickerOrders: updatedOrders,
            inProgressOrders: updatedInProgressOrderList,
            currentShownOrders: isAll
                ? updatedCurrentShownOrders
                : loaded.currentShownOrders.toList()
              ..removeWhere((element) => element == stickerOrder),
          ),
        );
      },
    );
  }

  void toggleSelectAll() {
    state.mapOrNull(
      loaded: (loaded) {
        if (loaded.selectedOrders.length == loaded.currentShownOrders.length) {
          emit(loaded.copyWith(selectedOrders: []));
        } else {
          emit(loaded.copyWith(selectedOrders: loaded.currentShownOrders));
        }
      },
    );
  }
}
