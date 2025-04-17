import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:paddle_trac_admin_dashboard/models/court_update_request/court_update_request.model.dart';
import 'package:paddle_trac_admin_dashboard/services/court_update_service.dart';

part 'court_update_state.dart';
part 'court_update_cubit.freezed.dart';

@injectable
class CourtUpdateCubit extends Cubit<CourtUpdateState> {
  CourtUpdateCubit(@Named.from(AdminCourtUpdateRequestService) this._service)
      : super(const CourtUpdateState.initial());
  final IAdminCourtUpdateRequestService _service;

  Future<void> fetchRequests() async {
    emit(const CourtUpdateState.loading());
    final result = await _service.getAllUpdateRequests();
    result.fold(
      (error) => emit(CourtUpdateState.error(message: error.toString())),
      (requests) => emit(CourtUpdateState.loaded(requests: requests)),
    );
  }

  Future<void> approveRequest(CourtUpdateRequest request) async {
    emit(const CourtUpdateState.loading());
    final result = await _service.approveUpdateRequest(request);
    result.fold(
      (error) => emit(CourtUpdateState.error(message: error.toString())),
      (_) => fetchRequests(),
    );
  }

  Future<void> denyRequest(CourtUpdateRequest request) async {
    emit(const CourtUpdateState.loading());
    final result = await _service.denyUpdateRequest(request);
    result.fold(
      (error) => emit(CourtUpdateState.error(message: error.toString())),
      (_) => fetchRequests(),
    );
  }
}
