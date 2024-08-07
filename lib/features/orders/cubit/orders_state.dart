part of 'orders_cubit.dart';

enum OrderPageStatus {
  all,
  inProgress,
  completed,
}

@freezed
class OrderPageState with _$OrderPageState {
  const factory OrderPageState.initial() = _Initial;
  const factory OrderPageState.error() = _Error;
  const factory OrderPageState.loaded({
    // Sticker Orders
    @Default(false) isLoading,
    required List<StickerOrder> currentShownOrders,
    required List<StickerOrder> stickerOrders,
    required List<StickerOrder> inProgressOrders,
    required List<StickerOrder> completedOrders,
    required OrderPageStatus orderPageStatus,
    @Default([]) List<StickerOrder> selectedOrders,
  }) = _Loaded;

  const OrderPageState._();
}
