// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sticker_order.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StickerOrder _$StickerOrderFromJson(Map<String, dynamic> json) {
  return _StickerOrder.fromJson(json);
}

/// @nodoc
mixin _$StickerOrder {
  String get orderDate => throw _privateConstructorUsedError;
  String get orderStatus => throw _privateConstructorUsedError;
  String get paymentId => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get customerName => throw _privateConstructorUsedError;
  String? get customerEmail => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(toJson: _addressToJson)
  Address? get shippingAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StickerOrderCopyWith<StickerOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StickerOrderCopyWith<$Res> {
  factory $StickerOrderCopyWith(
          StickerOrder value, $Res Function(StickerOrder) then) =
      _$StickerOrderCopyWithImpl<$Res, StickerOrder>;
  @useResult
  $Res call(
      {String orderDate,
      String orderStatus,
      String paymentId,
      double total,
      String userId,
      String? customerName,
      String? customerEmail,
      String? productName,
      String? phoneNumber,
      String? orderNumber,
      @JsonKey(toJson: _addressToJson) Address? shippingAddress});

  $AddressCopyWith<$Res>? get shippingAddress;
}

/// @nodoc
class _$StickerOrderCopyWithImpl<$Res, $Val extends StickerOrder>
    implements $StickerOrderCopyWith<$Res> {
  _$StickerOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderDate = null,
    Object? orderStatus = null,
    Object? paymentId = null,
    Object? total = null,
    Object? userId = null,
    Object? customerName = freezed,
    Object? customerEmail = freezed,
    Object? productName = freezed,
    Object? phoneNumber = freezed,
    Object? orderNumber = freezed,
    Object? shippingAddress = freezed,
  }) {
    return _then(_value.copyWith(
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerEmail: freezed == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get shippingAddress {
    if (_value.shippingAddress == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.shippingAddress!, (value) {
      return _then(_value.copyWith(shippingAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StickerOrderImplCopyWith<$Res>
    implements $StickerOrderCopyWith<$Res> {
  factory _$$StickerOrderImplCopyWith(
          _$StickerOrderImpl value, $Res Function(_$StickerOrderImpl) then) =
      __$$StickerOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderDate,
      String orderStatus,
      String paymentId,
      double total,
      String userId,
      String? customerName,
      String? customerEmail,
      String? productName,
      String? phoneNumber,
      String? orderNumber,
      @JsonKey(toJson: _addressToJson) Address? shippingAddress});

  @override
  $AddressCopyWith<$Res>? get shippingAddress;
}

/// @nodoc
class __$$StickerOrderImplCopyWithImpl<$Res>
    extends _$StickerOrderCopyWithImpl<$Res, _$StickerOrderImpl>
    implements _$$StickerOrderImplCopyWith<$Res> {
  __$$StickerOrderImplCopyWithImpl(
      _$StickerOrderImpl _value, $Res Function(_$StickerOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderDate = null,
    Object? orderStatus = null,
    Object? paymentId = null,
    Object? total = null,
    Object? userId = null,
    Object? customerName = freezed,
    Object? customerEmail = freezed,
    Object? productName = freezed,
    Object? phoneNumber = freezed,
    Object? orderNumber = freezed,
    Object? shippingAddress = freezed,
  }) {
    return _then(_$StickerOrderImpl(
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerEmail: freezed == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StickerOrderImpl extends _StickerOrder {
  const _$StickerOrderImpl(
      {required this.orderDate,
      required this.orderStatus,
      required this.paymentId,
      required this.total,
      required this.userId,
      this.customerName,
      this.customerEmail,
      this.productName,
      this.phoneNumber,
      this.orderNumber,
      @JsonKey(toJson: _addressToJson) this.shippingAddress})
      : super._();

  factory _$StickerOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$StickerOrderImplFromJson(json);

  @override
  final String orderDate;
  @override
  final String orderStatus;
  @override
  final String paymentId;
  @override
  final double total;
  @override
  final String userId;
  @override
  final String? customerName;
  @override
  final String? customerEmail;
  @override
  final String? productName;
  @override
  final String? phoneNumber;
  @override
  final String? orderNumber;
  @override
  @JsonKey(toJson: _addressToJson)
  final Address? shippingAddress;

  @override
  String toString() {
    return 'StickerOrder(orderDate: $orderDate, orderStatus: $orderStatus, paymentId: $paymentId, total: $total, userId: $userId, customerName: $customerName, customerEmail: $customerEmail, productName: $productName, phoneNumber: $phoneNumber, orderNumber: $orderNumber, shippingAddress: $shippingAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StickerOrderImpl &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerEmail, customerEmail) ||
                other.customerEmail == customerEmail) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderDate,
      orderStatus,
      paymentId,
      total,
      userId,
      customerName,
      customerEmail,
      productName,
      phoneNumber,
      orderNumber,
      shippingAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StickerOrderImplCopyWith<_$StickerOrderImpl> get copyWith =>
      __$$StickerOrderImplCopyWithImpl<_$StickerOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StickerOrderImplToJson(
      this,
    );
  }
}

abstract class _StickerOrder extends StickerOrder {
  const factory _StickerOrder(
          {required final String orderDate,
          required final String orderStatus,
          required final String paymentId,
          required final double total,
          required final String userId,
          final String? customerName,
          final String? customerEmail,
          final String? productName,
          final String? phoneNumber,
          final String? orderNumber,
          @JsonKey(toJson: _addressToJson) final Address? shippingAddress}) =
      _$StickerOrderImpl;
  const _StickerOrder._() : super._();

  factory _StickerOrder.fromJson(Map<String, dynamic> json) =
      _$StickerOrderImpl.fromJson;

  @override
  String get orderDate;
  @override
  String get orderStatus;
  @override
  String get paymentId;
  @override
  double get total;
  @override
  String get userId;
  @override
  String? get customerName;
  @override
  String? get customerEmail;
  @override
  String? get productName;
  @override
  String? get phoneNumber;
  @override
  String? get orderNumber;
  @override
  @JsonKey(toJson: _addressToJson)
  Address? get shippingAddress;
  @override
  @JsonKey(ignore: true)
  _$$StickerOrderImplCopyWith<_$StickerOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
