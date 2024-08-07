// Package imports:
import 'package:firefuel/firefuel.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:paddle_trac_admin_dashboard/models/sticker_order/sticker_order.model.dart';

@injectable
class AdminStickerOrderCollection extends FirefuelCollection<StickerOrder> {
  AdminStickerOrderCollection() : super('orders');

  @override
  StickerOrder? fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) return null;

    return StickerOrder.fromJson(data);
  }

  @override
  Map<String, Object?> toFirestore(StickerOrder? model, SetOptions? options) {
    final json = model?.toJson() ?? {};

    return json;
  }
}
