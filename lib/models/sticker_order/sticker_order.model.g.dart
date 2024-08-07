// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_order.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StickerOrderImpl _$$StickerOrderImplFromJson(Map<String, dynamic> json) =>
    _$StickerOrderImpl(
      orderDate: json['orderDate'] as String,
      orderStatus: json['orderStatus'] as String,
      paymentId: json['paymentId'] as String,
      total: (json['total'] as num).toDouble(),
      userId: json['userId'] as String,
      customerName: json['customerName'] as String?,
      customerEmail: json['customerEmail'] as String?,
      productName: json['productName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      orderNumber: json['orderNumber'] as String?,
      shippingAddress: json['shippingAddress'] == null
          ? null
          : Address.fromJson(json['shippingAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StickerOrderImplToJson(_$StickerOrderImpl instance) =>
    <String, dynamic>{
      'orderDate': instance.orderDate,
      'orderStatus': instance.orderStatus,
      'paymentId': instance.paymentId,
      'total': instance.total,
      'userId': instance.userId,
      'customerName': instance.customerName,
      'customerEmail': instance.customerEmail,
      'productName': instance.productName,
      'phoneNumber': instance.phoneNumber,
      'orderNumber': instance.orderNumber,
      'shippingAddress': _addressToJson(instance.shippingAddress),
    };
