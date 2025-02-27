// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uuid.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Uuid _$UuidFromJson(Map<String, dynamic> json) {
  return _Uuid.fromJson(json);
}

/// @nodoc
mixin _$Uuid {
  String get uuid => throw _privateConstructorUsedError;
  bool get isAssigned => throw _privateConstructorUsedError;

  /// Serializes this Uuid to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Uuid
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UuidCopyWith<Uuid> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UuidCopyWith<$Res> {
  factory $UuidCopyWith(Uuid value, $Res Function(Uuid) then) =
      _$UuidCopyWithImpl<$Res, Uuid>;
  @useResult
  $Res call({String uuid, bool isAssigned});
}

/// @nodoc
class _$UuidCopyWithImpl<$Res, $Val extends Uuid>
    implements $UuidCopyWith<$Res> {
  _$UuidCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Uuid
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? isAssigned = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      isAssigned: null == isAssigned
          ? _value.isAssigned
          : isAssigned // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UuidImplCopyWith<$Res> implements $UuidCopyWith<$Res> {
  factory _$$UuidImplCopyWith(
          _$UuidImpl value, $Res Function(_$UuidImpl) then) =
      __$$UuidImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, bool isAssigned});
}

/// @nodoc
class __$$UuidImplCopyWithImpl<$Res>
    extends _$UuidCopyWithImpl<$Res, _$UuidImpl>
    implements _$$UuidImplCopyWith<$Res> {
  __$$UuidImplCopyWithImpl(_$UuidImpl _value, $Res Function(_$UuidImpl) _then)
      : super(_value, _then);

  /// Create a copy of Uuid
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? isAssigned = null,
  }) {
    return _then(_$UuidImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      isAssigned: null == isAssigned
          ? _value.isAssigned
          : isAssigned // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UuidImpl extends _Uuid {
  const _$UuidImpl({required this.uuid, required this.isAssigned}) : super._();

  factory _$UuidImpl.fromJson(Map<String, dynamic> json) =>
      _$$UuidImplFromJson(json);

  @override
  final String uuid;
  @override
  final bool isAssigned;

  @override
  String toString() {
    return 'Uuid(uuid: $uuid, isAssigned: $isAssigned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UuidImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.isAssigned, isAssigned) ||
                other.isAssigned == isAssigned));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, isAssigned);

  /// Create a copy of Uuid
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UuidImplCopyWith<_$UuidImpl> get copyWith =>
      __$$UuidImplCopyWithImpl<_$UuidImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UuidImplToJson(
      this,
    );
  }
}

abstract class _Uuid extends Uuid {
  const factory _Uuid(
      {required final String uuid,
      required final bool isAssigned}) = _$UuidImpl;
  const _Uuid._() : super._();

  factory _Uuid.fromJson(Map<String, dynamic> json) = _$UuidImpl.fromJson;

  @override
  String get uuid;
  @override
  bool get isAssigned;

  /// Create a copy of Uuid
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UuidImplCopyWith<_$UuidImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
