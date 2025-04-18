part of 'court_update_cubit.dart';

@freezed
class CourtUpdateState with _$CourtUpdateState {
  const factory CourtUpdateState.initial() = _Initial;
  const factory CourtUpdateState.loading() = _Loading;
  const factory CourtUpdateState.error({
    required String message,
  }) = _Error;

  /// now holds selection + court details
  const factory CourtUpdateState.loaded({
    required List<CourtUpdateRequest> requests,
    CourtUpdateRequest? selectedRequest,
    Court? selectedCourt,
    ApiError? courtLoadError,
    @Default(false) bool isCourtLoading,
  }) = _Loaded;
}
