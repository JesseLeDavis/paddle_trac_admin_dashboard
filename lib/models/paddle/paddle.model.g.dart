// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paddle.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaddleImpl _$$PaddleImplFromJson(Map<String, dynamic> json) => _$PaddleImpl(
      paddleId: json['paddleId'] as String,
      paddleName: json['paddleName'] as String,
      userId: json['userId'] as String,
      paddleDescription: json['paddleDescription'] as String?,
    );

Map<String, dynamic> _$$PaddleImplToJson(_$PaddleImpl instance) =>
    <String, dynamic>{
      'paddleId': instance.paddleId,
      'paddleName': instance.paddleName,
      'userId': instance.userId,
      'paddleDescription': instance.paddleDescription,
    };
