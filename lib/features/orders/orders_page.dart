import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:paddle_trac_admin_dashboard/app/view/app.dart';
import 'package:paddle_trac_admin_dashboard/constants/paddle_checkbox.dart';
import 'package:paddle_trac_admin_dashboard/constants/sizes.dart';
import 'package:paddle_trac_admin_dashboard/features/orders/cubit/orders_cubit.dart';
import 'package:paddle_trac_admin_dashboard/features/orders/widgets/order_status_button.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/injection/injection.dart';
import 'package:paddle_trac_admin_dashboard/shared/themes/color_themes.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersPageCubit>(),
      child: const OrdersView(),
    );
  }
}

class OrdersView extends StatelessWidget {
  const OrdersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final printAllSnackBar = SnackBar(
      backgroundColor: ColorThemes.courtGreen,
      content: Text(
        'Downloaded selected orders',
        style: context.callout,
        textAlign: TextAlign.center,
      ),
    );
    final printOneSnackBar = SnackBar(
      backgroundColor: ColorThemes.courtGreen,
      content: Text(
        'Downloaded order',
        style: context.callout,
        textAlign: TextAlign.center,
      ),
    );
    return BlocBuilder<OrdersPageCubit, OrderPageState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          loaded: (loaded) {
            final _stickerOrders = loaded.currentShownOrders;
            return loaded.isLoading == false
                ? Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapH24,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(
                                  12,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorThemes.lightGrey,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Sort by: OrderDate',
                                      style: context.callout.copyWith(
                                        color: ColorThemes.primary,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_downward_rounded,
                                    ),
                                  ],
                                ),
                              ),
                              gapW32,
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 2,
                                    color: loaded.orderPageStatus ==
                                            OrderPageStatus.inProgress
                                        ? ColorThemes.primary
                                        : Colors.transparent,
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    context
                                        .read<OrdersPageCubit>()
                                        .updateScreen(
                                          orderPageStatus:
                                              OrderPageStatus.inProgress,
                                          currentShownStickerOrders:
                                              loaded.inProgressOrders,
                                        );
                                  },
                                  child: Text(
                                    'In Progress (${loaded.inProgressOrders.length})',
                                    style: context.callout.copyWith(
                                      color: loaded.orderPageStatus ==
                                              OrderPageStatus.inProgress
                                          ? ColorThemes.primary
                                          : ColorThemes.secondary,
                                    ),
                                  ),
                                ),
                              ),
                              gapW24,
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 2,
                                    color: loaded.orderPageStatus ==
                                            OrderPageStatus.completed
                                        ? ColorThemes.primary
                                        : Colors.transparent,
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    context
                                        .read<OrdersPageCubit>()
                                        .updateScreen(
                                          orderPageStatus:
                                              OrderPageStatus.completed,
                                          currentShownStickerOrders:
                                              loaded.completedOrders,
                                        );
                                  },
                                  child: Text(
                                    'Completed (${loaded.completedOrders.length})',
                                    style: context.callout.copyWith(
                                      color: loaded.orderPageStatus ==
                                              OrderPageStatus.completed
                                          ? ColorThemes.primary
                                          : ColorThemes.secondary,
                                    ),
                                  ),
                                ),
                              ),
                              gapW24,
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 2,
                                    color: loaded.orderPageStatus ==
                                            OrderPageStatus.all
                                        ? ColorThemes.primary
                                        : Colors.transparent,
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    context
                                        .read<OrdersPageCubit>()
                                        .updateScreen(
                                          orderPageStatus: OrderPageStatus.all,
                                          currentShownStickerOrders:
                                              loaded.stickerOrders,
                                        );
                                  },
                                  child: Text(
                                    'All (${loaded.stickerOrders.length})',
                                    style: context.callout.copyWith(
                                      color: loaded.orderPageStatus ==
                                              OrderPageStatus.all
                                          ? ColorThemes.primary
                                          : ColorThemes.secondary,
                                    ),
                                  ),
                                ),
                              ),
                              gapW24,
                              loaded.selectedOrders.isNotEmpty
                                  ? TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: ColorThemes.courtGreen,
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () {
                                        _showConfirmationDialog(
                                          context,
                                          loaded.selectedOrders.length,
                                        ).then((confirm) {
                                          if (confirm) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(printAllSnackBar);
                                            context
                                                .read<OrdersPageCubit>()
                                                .print();
                                          }
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            'Print ${loaded.selectedOrders.length} selected',
                                            style: context.callout,
                                          ),
                                          gapW4,
                                          const Icon(
                                            Icons.print_outlined,
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  context.read<OrdersPageCubit>().init(
                                        loaded.orderPageStatus,
                                        loaded.currentShownOrders,
                                      );
                                },
                                icon: const Icon(Icons.refresh_rounded),
                              ),
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    DataTable(
                                      dividerThickness: 1,
                                      columnSpacing: 30,
                                      dataRowHeight: 130,
                                      headingRowHeight: 150,
                                      columns: [
                                        DataColumn(
                                          label: PaddleCheckBox(
                                            isSelected:
                                                loaded.selectedOrders.length ==
                                                    _stickerOrders.length,
                                            onTapCallback: () {
                                              context
                                                  .read<OrdersPageCubit>()
                                                  .toggleSelectAll();
                                            },
                                          ),
                                        ),
                                        const DataColumn(
                                          label: Text(
                                            'Order Number',
                                          ),
                                        ),
                                        const DataColumn(
                                          label: Text(
                                            'Order Status',
                                          ),
                                        ),
                                        const DataColumn(
                                          label: Text(
                                            'Order Date',
                                          ),
                                        ),
                                        const DataColumn(
                                          label: Text(
                                            'Customer Info',
                                          ),
                                        ),
                                        const DataColumn(
                                          label: Text(
                                            'Shipping Address',
                                          ),
                                        ),
                                        // const DataColumn(
                                        //   label: Text(
                                        //     'Email',
                                        //   ),
                                        // ),
                                        const DataColumn(
                                          label: Text(
                                            'Product Name',
                                          ),
                                        ),
                                        const DataColumn(
                                          label: Text(
                                            'Payment ID',
                                          ),
                                        ),
                                      ],
                                      rows: List<DataRow>.generate(
                                          _stickerOrders.length, (index) {
                                        return DataRow(
                                          selected:
                                              loaded.selectedOrders.contains(
                                            _stickerOrders[index],
                                          ),
                                          cells: [
                                            DataCell(
                                              PaddleCheckBox(
                                                isSelected: loaded
                                                    .selectedOrders
                                                    .contains(
                                                  _stickerOrders[index],
                                                ),
                                                onTapCallback: () {
                                                  context
                                                      .read<OrdersPageCubit>()
                                                      .toggleSelectOrder(
                                                        _stickerOrders[index],
                                                      );
                                                },
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                _stickerOrders[index]
                                                    .orderNumber!,
                                                style: context.body,
                                              ),
                                            ),
                                            DataCell(
                                              OrderStatusButton(
                                                index: index,
                                                stickerOrders: _stickerOrders,
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                DateFormat(
                                                  'MM/dd/yyyy',
                                                ).format(
                                                  DateTime.parse(
                                                    _stickerOrders[index]
                                                        .orderDate,
                                                  ),
                                                ),
                                                style: context.body,
                                              ),
                                            ),
                                            DataCell(
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    _stickerOrders[index]
                                                        .customerName!,
                                                    style: context.body,
                                                  ),
                                                  Text(
                                                    loaded.stickerOrders[index]
                                                        .phoneNumber!,
                                                    style: context.body,
                                                  ),
                                                  Text(
                                                    loaded.stickerOrders[index]
                                                        .userId,
                                                    style: context.body,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            DataCell(
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    _stickerOrders[index]
                                                        .shippingAddress!
                                                        .line1,
                                                    style: context.body,
                                                  ),
                                                  Text(
                                                    '${_stickerOrders[index].shippingAddress!.city}, ${_stickerOrders[index].shippingAddress!.state}',
                                                    style: context.body,
                                                  ),
                                                  Text(
                                                    _stickerOrders[index]
                                                        .shippingAddress!
                                                        .postalCode,
                                                    style: context.body,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // DataCell(
                                            //   Text(
                                            //     loaded.stickerOrders[index]
                                            //         .customerEmail!,
                                            //     style: context.body,
                                            //   ),
                                            // ),
                                            DataCell(
                                              Text(
                                                _stickerOrders[index]
                                                    .productName!,
                                                style: context.body,
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                _stickerOrders[index].paymentId,
                                                style: context.body,
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
          },
        );
      },
    );
  }

  Future<bool> _showConfirmationDialog(
    BuildContext context,
    int selectedOrderCount,
  ) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  gapH24,
                  Text(
                    'Print $selectedOrderCount orders, and mark as completed?',
                    style: context.callout.copyWith(color: Colors.black),
                  ),
                  gapH24,
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: ColorThemes.courtGreen,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: SizedBox(
                      width: 200,
                      child: Center(
                        child: Text(
                          'Yes',
                          style: context.bodyBold.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  gapH12,
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: ColorThemes.alert,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: SizedBox(
                      width: 200,
                      child: Center(
                        child: Text(
                          'No',
                          style: context.bodyBold.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ) ??
        false;
  }
}
