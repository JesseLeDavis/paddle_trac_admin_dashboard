// Package imports:
import 'package:dartz/dartz.dart';
import 'package:firefuel/firefuel.dart';
import 'package:injectable/injectable.dart';
import 'package:paddle_trac_admin_dashboard/collections/court_update_collection.dart';

// Project imports:
import 'package:paddle_trac_admin_dashboard/infrastructure/api_error/api_error.dart';
import 'package:paddle_trac_admin_dashboard/models/court_update_request/court_update_request.model.dart';
import 'package:paddle_trac_admin_dashboard/services/court_service.dart';
import 'package:paddle_trac_admin_dashboard/models/court/court.model.dart';

abstract class IAdminCourtUpdateRequestService {
  Future<Either<ApiError, List<CourtUpdateRequest>>> getAllUpdateRequests();
  Future<Either<ApiError, Unit>> approveUpdateRequest(
    CourtUpdateRequest request,
  );
  Future<Either<ApiError, Unit>> denyUpdateRequest(CourtUpdateRequest request);
}

@named
@Singleton(as: IAdminCourtUpdateRequestService)
class AdminCourtUpdateRequestService
    implements IAdminCourtUpdateRequestService {
  AdminCourtUpdateRequestService(
    this._updateCollection,
    @Named.from(CourtService) this._courtService,
  );
  final CourtUpdateRequestCollection _updateCollection;
  final ICourtService _courtService;

  @override
  Future<Either<ApiError, List<CourtUpdateRequest>>>
      getAllUpdateRequests() async {
    try {
      final requests = await _updateCollection.readAll();
      return right(requests);
    } catch (e) {
      return left(ApiErrorExtension.errorFromString(e.toString()));
    }
  }

  @override
  Future<Either<ApiError, Unit>> approveUpdateRequest(
    CourtUpdateRequest request,
  ) async {
    try {
      final eitherCourt = await _courtService.getCourtById(request.courtId);
      return await eitherCourt.fold(
        (err) async => left(err),
        (court) async {
          final updatedJson = <String, dynamic>{}
            ..addAll(court.toJson())
            ..addAll(request.requestedUpdates);
          final updatedCourt = Court.fromJson(updatedJson);
          final updateResult = await _courtService.update(updatedCourt);
          return await updateResult.fold(
            (err) async => left(err),
            (_) async {
              await _updateCollection.delete(DocumentId(request.id));
              return right(unit);
            },
          );
        },
      );
    } catch (e) {
      return left(ApiErrorExtension.errorFromString(e.toString()));
    }
  }

  @override
  Future<Either<ApiError, Unit>> denyUpdateRequest(
    CourtUpdateRequest request,
  ) async {
    try {
      await _updateCollection.delete(DocumentId(request.id));
      return right(unit);
    } catch (e) {
      return left(ApiErrorExtension.errorFromString(e.toString()));
    }
  }
}
