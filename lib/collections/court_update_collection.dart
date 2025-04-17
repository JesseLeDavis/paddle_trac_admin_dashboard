// Package imports:
import 'package:firefuel/firefuel.dart';
import 'package:injectable/injectable.dart';
import 'package:paddle_trac_admin_dashboard/models/court_update_request/court_update_request.model.dart';

// Project imports:

@injectable
class CourtUpdateRequestCollection extends FirefuelCollection<CourtUpdateRequest> {
  CourtUpdateRequestCollection() : super('courtUpdateRequests');

  @override
  CourtUpdateRequest? fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) return null;
    return CourtUpdateRequest.fromJson(data);
  }

  @override
  Map<String, Object?> toFirestore(CourtUpdateRequest? model, SetOptions? options) {
    return model?.toJson() ?? {};
  }
}