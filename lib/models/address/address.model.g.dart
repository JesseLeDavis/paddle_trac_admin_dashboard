// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      line1: json['line1'] as String,
      line2: json['line2'] as String?,
      state: json['state'] as String,
      city: json['city'] as String,
      postalCode: json['postalCode'] as String,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'line1': instance.line1,
      'line2': instance.line2,
      'state': instance.state,
      'city': instance.city,
      'postalCode': instance.postalCode,
    };
