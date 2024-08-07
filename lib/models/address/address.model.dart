// Package imports:

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.model.freezed.dart';
part 'address.model.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required String line1,
    String? line2,
    required String state,
    required String city,
    required String postalCode,
  }) = _Address;

  const Address._();

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
