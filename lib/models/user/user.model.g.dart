// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      customerId: json['customerId'] as String?,
      token: json['token'] as String?,
      ageRange: json['ageRange'] as String?,
      gender: json['gender'] as String?,
      profilePhotoKey: json['profilePhotoKey'] as String,
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      nameVisible: json['nameVisible'] as bool? ?? false,
      locationServicesOn: json['locationServicesOn'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'customerId': instance.customerId,
      'token': instance.token,
      'ageRange': instance.ageRange,
      'gender': instance.gender,
      'profilePhotoKey': instance.profilePhotoKey,
      'phone': instance.phone,
      'email': instance.email,
      'nameVisible': instance.nameVisible,
      'locationServicesOn': instance.locationServicesOn,
    };
