// Package imports:
import 'package:firefuel/firefuel.dart';
import 'package:injectable/injectable.dart';
import 'package:paddle_trac_admin_dashboard/models/court/court.model.dart';

// Project imports:

@injectable
class CourtCollection extends FirefuelCollection<Court> {
  CourtCollection() : super('updated_courts');

  @override
  Court? fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) return null;
    data['id'] = snapshot.id;
    return Court.fromJson(data);
  }

  @override
  Map<String, Object?> toFirestore(Court? model, SetOptions? options) {
    final json = model?.toJson() ?? {};

    return json;
  }
}
