// Package imports:
import 'package:firefuel/firefuel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'uuid.model.freezed.dart';
part 'uuid.model.g.dart';

@freezed
class Uuid with _$Uuid implements Serializable {
  const factory Uuid({
    required String uuid,
    required bool isAssigned,
  }) = _Uuid;

  const Uuid._();

  factory Uuid.fromJson(Map<String, dynamic> json) => _$UuidFromJson(json);
}
