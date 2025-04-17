// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'court_update_request.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourtUpdateRequest _$CourtUpdateRequestFromJson(Map<String, dynamic> json) {
  return _CourtUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$CourtUpdateRequest {
  String get id => throw _privateConstructorUsedError;
  String get courtId => throw _privateConstructorUsedError;
  Map<String, dynamic> get requestedUpdates =>
      throw _privateConstructorUsedError;
  String get submittedBy => throw _privateConstructorUsedError;
  DateTime get submittedAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this CourtUpdateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourtUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourtUpdateRequestCopyWith<CourtUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourtUpdateRequestCopyWith<$Res> {
  factory $CourtUpdateRequestCopyWith(
          CourtUpdateRequest value, $Res Function(CourtUpdateRequest) then) =
      _$CourtUpdateRequestCopyWithImpl<$Res, CourtUpdateRequest>;
  @useResult
  $Res call(
      {String id,
      String courtId,
      Map<String, dynamic> requestedUpdates,
      String submittedBy,
      DateTime submittedAt,
      String status});
}

/// @nodoc
class _$CourtUpdateRequestCopyWithImpl<$Res, $Val extends CourtUpdateRequest>
    implements $CourtUpdateRequestCopyWith<$Res> {
  _$CourtUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourtUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courtId = null,
    Object? requestedUpdates = null,
    Object? submittedBy = null,
    Object? submittedAt = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      requestedUpdates: null == requestedUpdates
          ? _value.requestedUpdates
          : requestedUpdates // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      submittedBy: null == submittedBy
          ? _value.submittedBy
          : submittedBy // ignore: cast_nullable_to_non_nullable
              as String,
      submittedAt: null == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourtUpdateRequestImplCopyWith<$Res>
    implements $CourtUpdateRequestCopyWith<$Res> {
  factory _$$CourtUpdateRequestImplCopyWith(_$CourtUpdateRequestImpl value,
          $Res Function(_$CourtUpdateRequestImpl) then) =
      __$$CourtUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String courtId,
      Map<String, dynamic> requestedUpdates,
      String submittedBy,
      DateTime submittedAt,
      String status});
}

/// @nodoc
class __$$CourtUpdateRequestImplCopyWithImpl<$Res>
    extends _$CourtUpdateRequestCopyWithImpl<$Res, _$CourtUpdateRequestImpl>
    implements _$$CourtUpdateRequestImplCopyWith<$Res> {
  __$$CourtUpdateRequestImplCopyWithImpl(_$CourtUpdateRequestImpl _value,
      $Res Function(_$CourtUpdateRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourtUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courtId = null,
    Object? requestedUpdates = null,
    Object? submittedBy = null,
    Object? submittedAt = null,
    Object? status = null,
  }) {
    return _then(_$CourtUpdateRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      requestedUpdates: null == requestedUpdates
          ? _value._requestedUpdates
          : requestedUpdates // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      submittedBy: null == submittedBy
          ? _value.submittedBy
          : submittedBy // ignore: cast_nullable_to_non_nullable
              as String,
      submittedAt: null == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourtUpdateRequestImpl implements _CourtUpdateRequest {
  const _$CourtUpdateRequestImpl(
      {required this.id,
      required this.courtId,
      required final Map<String, dynamic> requestedUpdates,
      required this.submittedBy,
      required this.submittedAt,
      this.status = 'pending'})
      : _requestedUpdates = requestedUpdates;

  factory _$CourtUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourtUpdateRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String courtId;
  final Map<String, dynamic> _requestedUpdates;
  @override
  Map<String, dynamic> get requestedUpdates {
    if (_requestedUpdates is EqualUnmodifiableMapView) return _requestedUpdates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_requestedUpdates);
  }

  @override
  final String submittedBy;
  @override
  final DateTime submittedAt;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'CourtUpdateRequest(id: $id, courtId: $courtId, requestedUpdates: $requestedUpdates, submittedBy: $submittedBy, submittedAt: $submittedAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourtUpdateRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courtId, courtId) || other.courtId == courtId) &&
            const DeepCollectionEquality()
                .equals(other._requestedUpdates, _requestedUpdates) &&
            (identical(other.submittedBy, submittedBy) ||
                other.submittedBy == submittedBy) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      courtId,
      const DeepCollectionEquality().hash(_requestedUpdates),
      submittedBy,
      submittedAt,
      status);

  /// Create a copy of CourtUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourtUpdateRequestImplCopyWith<_$CourtUpdateRequestImpl> get copyWith =>
      __$$CourtUpdateRequestImplCopyWithImpl<_$CourtUpdateRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourtUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _CourtUpdateRequest implements CourtUpdateRequest {
  const factory _CourtUpdateRequest(
      {required final String id,
      required final String courtId,
      required final Map<String, dynamic> requestedUpdates,
      required final String submittedBy,
      required final DateTime submittedAt,
      final String status}) = _$CourtUpdateRequestImpl;

  factory _CourtUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$CourtUpdateRequestImpl.fromJson;

  @override
  String get id;
  @override
  String get courtId;
  @override
  Map<String, dynamic> get requestedUpdates;
  @override
  String get submittedBy;
  @override
  DateTime get submittedAt;
  @override
  String get status;

  /// Create a copy of CourtUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourtUpdateRequestImplCopyWith<_$CourtUpdateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
