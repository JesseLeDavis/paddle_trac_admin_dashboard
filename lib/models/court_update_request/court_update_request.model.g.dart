// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court_update_request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourtUpdateRequestImpl _$$CourtUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CourtUpdateRequestImpl(
      id: json['id'] as String,
      courtId: json['courtId'] as String,
      requestedUpdates: json['requestedUpdates'] as Map<String, dynamic>,
      submittedBy: json['submittedBy'] as String,
      submittedAt: DateTime.parse(json['submittedAt'] as String),
      status: json['status'] as String? ?? 'pending',
    );

Map<String, dynamic> _$$CourtUpdateRequestImplToJson(
        _$CourtUpdateRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courtId': instance.courtId,
      'requestedUpdates': instance.requestedUpdates,
      'submittedBy': instance.submittedBy,
      'submittedAt': instance.submittedAt.toIso8601String(),
      'status': instance.status,
    };
