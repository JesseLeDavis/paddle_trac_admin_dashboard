// Package imports:
import 'package:firefuel/firefuel.dart';
import 'package:firefuel_core/firefuel_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paddle.model.freezed.dart';
part 'paddle.model.g.dart';

@freezed
class Paddle extends Serializable with _$Paddle {
  const factory Paddle({
    required String paddleId,
    required String paddleName,
    required String userId,
    String? paddleDescription,
  }) = _Paddle;

  const Paddle._();

  factory Paddle.fromJson(Map<String, dynamic> json) => _$PaddleFromJson(json);
}
