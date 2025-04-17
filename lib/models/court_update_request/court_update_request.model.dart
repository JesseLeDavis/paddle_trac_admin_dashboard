import 'package:firefuel/firefuel.dart';
import 'package:firefuel_core/firefuel_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'court_update_request.model.freezed.dart';
part 'court_update_request.model.g.dart';

@freezed
class CourtUpdateRequest extends Serializable with _$CourtUpdateRequest {
  const factory CourtUpdateRequest({
    required String id,
    required String courtId,
    required Map<String, dynamic> requestedUpdates,
    required String submittedBy,
    required DateTime submittedAt,
    @Default('pending') String status,
  }) = _CourtUpdateRequest;

  factory CourtUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$CourtUpdateRequestFromJson(json);
}
