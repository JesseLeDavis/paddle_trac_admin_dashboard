import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paddle_trac_admin_dashboard/app/view/app.dart';
import 'package:paddle_trac_admin_dashboard/constants/sizes.dart';
import 'package:paddle_trac_admin_dashboard/features/orders/cubit/orders_cubit.dart';
import 'package:paddle_trac_admin_dashboard/models/sticker_order/sticker_order.model.dart';
import 'package:paddle_trac_admin_dashboard/shared/themes/color_themes.dart';

class OrderStatusButton extends StatefulWidget {
  const OrderStatusButton({
    super.key,
    required List<StickerOrder> stickerOrders,
    required this.index,
  }) : _stickerOrders = stickerOrders;

  final List<StickerOrder> _stickerOrders;
  final int index;

  @override
  State<OrderStatusButton> createState() => _OrderStatusButtonState();
}

class _OrderStatusButtonState extends State<OrderStatusButton> {
  final OverlayPortalController _tooltipController = OverlayPortalController();

  final _link = LayerLink();

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersPageCubit, OrderPageState>(
      builder: (context, state) {
        return CompositedTransformTarget(
          link: _link,
          child: OverlayPortal(
            controller: _tooltipController,
            overlayChildBuilder: (context) {
              return CompositedTransformFollower(
                link: _link,
                targetAnchor: Alignment.bottomLeft,
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(
                            6,
                            6,
                          ), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: ColorThemes.lightGrey),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Change Status',
                          style: context.callout
                              .copyWith(color: ColorThemes.primary),
                        ),
                        gapH8,
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: ColorThemes.orange,
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () {
                            onTap();
                            context
                                .read<OrdersPageCubit>()
                                .updateOrderStatusInProgress(
                                  index: widget.index,
                                );
                          },
                          child: Text(
                            'In Progress',
                            style: context.callout
                                .copyWith(color: ColorThemes.primary),
                          ),
                        ),
                        gapH8,
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: ColorThemes.pickleGreen,
                          ),
                          onPressed: () {
                            onTap();
                            context
                                .read<OrdersPageCubit>()
                                .updateOrderStatusCompleted(
                                  index: widget.index,
                                );
                          },
                          child: Text(
                            'Completed',
                            style:
                                context.callout.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    widget._stickerOrders[widget.index].orderStatus ==
                            'Completed'
                        ? ColorThemes.pickleGreen
                        : ColorThemes.orange,
              ),
              onPressed: onTap,
              child: Text(
                widget._stickerOrders[widget.index].orderStatus,
                style: context.callout.copyWith(
                  color: widget._stickerOrders[widget.index].orderStatus ==
                          'Completed'
                      ? Colors.white
                      : ColorThemes.primary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void onTap() {
    // _tooltipController.toggle();
    // setState(() {
    //   isSelected = !isSelected;
    // });
  }
}
