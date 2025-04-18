// Package imports:
// ignore_for_file: override_on_non_overriding_member
import 'package:firefuel/firefuel.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
// Project imports:
import 'package:paddle_trac_admin_dashboard/collections/admin_sticker_orders_collection.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/api_error/api_error.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/firebase/firebase_auth_server_mixin.dart';

import 'package:paddle_trac_admin_dashboard/models/sticker_order/sticker_order.model.dart';

// ignore: one_member_abstracts
abstract class IOrderService {
  Future<Either<ApiError, List<StickerOrder>>> list();
  void updateInProgressOrders({required List<StickerOrder> stickerOrders});
  void updateCompletedOrders({required List<StickerOrder> stickerOrders});
  Future<Either<ApiError, String>> sendOrderShippedEmail({
    required String orderDate,
    required String orderNumber,
    required String orderPack,
    required String orderPrice,
    required String addressLine1,
    required String addressLine2,
    required String addressCity,
    required String addressState,
    required String addressZip,
    required String orderName,
    required String orderEmail,
  });
}

@named
@Singleton(as: IOrderService)
class OrderService with FirebaseAuthServerMixin implements IOrderService {
  OrderService(
    this._adminStickerOrderCollection,
  );

  final AdminStickerOrderCollection _adminStickerOrderCollection;

  @override
  Future<Either<ApiError, List<StickerOrder>>> list() async {
    try {
      final orders = await _adminStickerOrderCollection.readAll();
      return right(orders);
    } catch (e) {
      return left(ApiError.unknownError);
    }
  }

  @override
  void updateInProgressOrders({required List<StickerOrder> stickerOrders}) {
    for (final o in stickerOrders) {
      if (o.orderStatus != 'Completed') {
        final updatedUpdatedOrder = o.copyWith(orderStatus: 'Completed');
        _adminStickerOrderCollection.update(
          docId: DocumentId(o.paymentId),
          value: updatedUpdatedOrder,
        );
      }
    }
  }

  @override
  Future<Either<ApiError, String>> sendOrderShippedEmail({
    required String orderDate,
    required String orderNumber,
    required String orderPack,
    required String orderPrice,
    required String addressLine1,
    required String addressLine2,
    required String addressCity,
    required String addressState,
    required String addressZip,
    required String orderName,
    required String orderEmail,
  }) async {
    String formatDate(String dateStr) {
      final dateTime = DateTime.parse(dateStr);
      final formatter =
          DateFormat('MM-dd-yyyy'); // Customize the format as needed
      return formatter.format(dateTime);
    }

    final formattedOrderDate = formatDate(orderDate);

    try {
      final params = {
        'orderDate': formattedOrderDate,
        'orderNumber': orderNumber,
        'orderPack': orderPack,
        'orderPrice': orderPrice,
        'addressLine1': addressLine1,
        'addressLine2': addressLine2,
        'addressCity': addressCity,
        'addressState': addressState,
        'addressZip': addressZip,
        'orderName': orderName,
        'orderEmail': orderEmail,
      };

      return serverResponse(
        params: params,
        httpsCallableKey: 'sendShippedEmail',
        dataFromJson: (json) {
          return json['message'] as String;
        },
      );
    } catch (e) {
      return left(ApiError.unknownError);
    }
  }

  @override
  void updateCompletedOrders({required List<StickerOrder> stickerOrders}) {
    for (final o in stickerOrders) {
      if (o.orderStatus != 'In Progress') {
        final updatedUpdatedOrder = o.copyWith(orderStatus: 'In Progress');
        _adminStickerOrderCollection.update(
          docId: DocumentId(o.paymentId),
          value: updatedUpdatedOrder,
        );
      }
    }
  }

  @override
  Future<StickerOrder?> read(String docId) async {
    final session = await _adminStickerOrderCollection.read(DocumentId(docId));
    return session;
  }
}
