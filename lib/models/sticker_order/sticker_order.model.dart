// Package imports:

// Package imports:
import 'package:firefuel/firefuel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paddle_trac_admin_dashboard/models/address/address.model.dart';

part 'sticker_order.model.freezed.dart';
part 'sticker_order.model.g.dart';

@freezed
class StickerOrder with _$StickerOrder implements Serializable {
  const factory StickerOrder({
    required String orderDate,
    required String orderStatus,
    required String paymentId,
    required double total,
    required String userId,
    String? customerName,
    String? customerEmail,
    String? productName,
    String? phoneNumber,
    String? orderNumber,
    @JsonKey(toJson: _addressToJson) Address? shippingAddress,
  }) = _StickerOrder;

  const StickerOrder._();

  factory StickerOrder.fromJson(Map<String, dynamic> json) =>
      _$StickerOrderFromJson(json);
}

Map<String, dynamic>? _addressToJson(Address? shippingAddress) {
  return shippingAddress?.toJson();
}
