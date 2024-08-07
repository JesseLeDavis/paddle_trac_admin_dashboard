// Package imports:
import 'package:firefuel/firefuel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.model.freezed.dart';
part 'user.model.g.dart';

@freezed
class User extends Serializable with _$User {
  const factory User({
    required String id,
    @Default('') String firstName,
    @Default('') String lastName,
    String? customerId,
    String? token,
    String? ageRange,
    String? gender,
    required String profilePhotoKey,
    @Default('') String phone,
    @Default('') String email,
    @Default(false) bool nameVisible,
    @Default(true) bool locationServicesOn,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
