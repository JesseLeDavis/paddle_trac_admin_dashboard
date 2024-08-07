// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paddle.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Paddle _$PaddleFromJson(Map<String, dynamic> json) {
  return _Paddle.fromJson(json);
}

/// @nodoc
mixin _$Paddle {
  String get paddleId => throw _privateConstructorUsedError;
  String get paddleName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get paddleDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaddleCopyWith<Paddle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaddleCopyWith<$Res> {
  factory $PaddleCopyWith(Paddle value, $Res Function(Paddle) then) =
      _$PaddleCopyWithImpl<$Res, Paddle>;
  @useResult
  $Res call(
      {String paddleId,
      String paddleName,
      String userId,
      String? paddleDescription});
}

/// @nodoc
class _$PaddleCopyWithImpl<$Res, $Val extends Paddle>
    implements $PaddleCopyWith<$Res> {
  _$PaddleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paddleId = null,
    Object? paddleName = null,
    Object? userId = null,
    Object? paddleDescription = freezed,
  }) {
    return _then(_value.copyWith(
      paddleId: null == paddleId
          ? _value.paddleId
          : paddleId // ignore: cast_nullable_to_non_nullable
              as String,
      paddleName: null == paddleName
          ? _value.paddleName
          : paddleName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      paddleDescription: freezed == paddleDescription
          ? _value.paddleDescription
          : paddleDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaddleImplCopyWith<$Res> implements $PaddleCopyWith<$Res> {
  factory _$$PaddleImplCopyWith(
          _$PaddleImpl value, $Res Function(_$PaddleImpl) then) =
      __$$PaddleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String paddleId,
      String paddleName,
      String userId,
      String? paddleDescription});
}

/// @nodoc
class __$$PaddleImplCopyWithImpl<$Res>
    extends _$PaddleCopyWithImpl<$Res, _$PaddleImpl>
    implements _$$PaddleImplCopyWith<$Res> {
  __$$PaddleImplCopyWithImpl(
      _$PaddleImpl _value, $Res Function(_$PaddleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paddleId = null,
    Object? paddleName = null,
    Object? userId = null,
    Object? paddleDescription = freezed,
  }) {
    return _then(_$PaddleImpl(
      paddleId: null == paddleId
          ? _value.paddleId
          : paddleId // ignore: cast_nullable_to_non_nullable
              as String,
      paddleName: null == paddleName
          ? _value.paddleName
          : paddleName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      paddleDescription: freezed == paddleDescription
          ? _value.paddleDescription
          : paddleDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaddleImpl extends _Paddle {
  const _$PaddleImpl(
      {required this.paddleId,
      required this.paddleName,
      required this.userId,
      this.paddleDescription})
      : super._();

  factory _$PaddleImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaddleImplFromJson(json);

  @override
  final String paddleId;
  @override
  final String paddleName;
  @override
  final String userId;
  @override
  final String? paddleDescription;

  @override
  String toString() {
    return 'Paddle(paddleId: $paddleId, paddleName: $paddleName, userId: $userId, paddleDescription: $paddleDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaddleImpl &&
            (identical(other.paddleId, paddleId) ||
                other.paddleId == paddleId) &&
            (identical(other.paddleName, paddleName) ||
                other.paddleName == paddleName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.paddleDescription, paddleDescription) ||
                other.paddleDescription == paddleDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, paddleId, paddleName, userId, paddleDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaddleImplCopyWith<_$PaddleImpl> get copyWith =>
      __$$PaddleImplCopyWithImpl<_$PaddleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaddleImplToJson(
      this,
    );
  }
}

abstract class _Paddle extends Paddle {
  const factory _Paddle(
      {required final String paddleId,
      required final String paddleName,
      required final String userId,
      final String? paddleDescription}) = _$PaddleImpl;
  const _Paddle._() : super._();

  factory _Paddle.fromJson(Map<String, dynamic> json) = _$PaddleImpl.fromJson;

  @override
  String get paddleId;
  @override
  String get paddleName;
  @override
  String get userId;
  @override
  String? get paddleDescription;
  @override
  @JsonKey(ignore: true)
  _$$PaddleImplCopyWith<_$PaddleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
