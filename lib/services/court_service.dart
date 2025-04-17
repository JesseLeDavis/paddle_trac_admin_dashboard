

// Project imports:

import 'package:dartz/dartz.dart';
import 'package:firefuel/firefuel.dart';
import 'package:injectable/injectable.dart';
import 'package:paddle_trac_admin_dashboard/collections/court_collection.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/api_error/api_error.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/firebase/firebase_auth_server_mixin.dart';
import 'package:paddle_trac_admin_dashboard/models/court/court.model.dart';

// ignore: one_member_abstracts
abstract class ICourtService {
  Future<List<Court>> getCourts({
    required List<String> favoriteCourtList,
  });
  Future<Either<ApiError, Unit>> update(Court court);
  Future<Either<ApiError, Court>> getCourtById(String courtId);
}

@named
@Singleton(as: ICourtService)
class CourtService with FirebaseAuthServerMixin implements ICourtService {
  CourtService(this._courtCollection);

  final CourtCollection _courtCollection;

  @override
  Future<List<Court>> getCourts({
    required List<String> favoriteCourtList,
  }) async {
    final courtList = <Court>[];

    for (final courtId in favoriteCourtList) {
      final queryResult = await _courtCollection.read(DocumentId(courtId));

      if (queryResult != null) {
        courtList.add(queryResult);
      }
    }

    return courtList;
  }

  @override
  Future<Either<ApiError, Court>> getCourtById(String courtId) async {
    try {
      final court = await _courtCollection.read(DocumentId(courtId));
      if (court == null) {
        return left(ApiErrorExtension.errorFromString('COURT_NOT_FOUND'));
      }
      return right(court);
    } catch (e) {
      return left(ApiErrorExtension.errorFromString(e.toString()));
    }
  }

  @override
  Future<Either<ApiError, Unit>> update(Court court) async {
    try {
      await _courtCollection.update(docId: DocumentId(court.id), value: court);

      return right(unit);
    } catch (e) {
      return left(ApiError.unknownError);
    }
  }
}



