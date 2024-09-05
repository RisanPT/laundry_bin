// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_cloth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceClothModel _$ServiceClothModelFromJson(Map<String, dynamic> json) {
  return _ServiceClothModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceClothModel {
  String get clothId => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  /// Serializes this ServiceClothModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceClothModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceClothModelCopyWith<ServiceClothModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceClothModelCopyWith<$Res> {
  factory $ServiceClothModelCopyWith(
          ServiceClothModel value, $Res Function(ServiceClothModel) then) =
      _$ServiceClothModelCopyWithImpl<$Res, ServiceClothModel>;
  @useResult
  $Res call({String clothId, double price});
}

/// @nodoc
class _$ServiceClothModelCopyWithImpl<$Res, $Val extends ServiceClothModel>
    implements $ServiceClothModelCopyWith<$Res> {
  _$ServiceClothModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceClothModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clothId = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      clothId: null == clothId
          ? _value.clothId
          : clothId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceClothModelImplCopyWith<$Res>
    implements $ServiceClothModelCopyWith<$Res> {
  factory _$$ServiceClothModelImplCopyWith(_$ServiceClothModelImpl value,
          $Res Function(_$ServiceClothModelImpl) then) =
      __$$ServiceClothModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String clothId, double price});
}

/// @nodoc
class __$$ServiceClothModelImplCopyWithImpl<$Res>
    extends _$ServiceClothModelCopyWithImpl<$Res, _$ServiceClothModelImpl>
    implements _$$ServiceClothModelImplCopyWith<$Res> {
  __$$ServiceClothModelImplCopyWithImpl(_$ServiceClothModelImpl _value,
      $Res Function(_$ServiceClothModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceClothModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clothId = null,
    Object? price = null,
  }) {
    return _then(_$ServiceClothModelImpl(
      clothId: null == clothId
          ? _value.clothId
          : clothId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceClothModelImpl extends _ServiceClothModel {
  const _$ServiceClothModelImpl({required this.clothId, required this.price})
      : super._();

  factory _$ServiceClothModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceClothModelImplFromJson(json);

  @override
  final String clothId;
  @override
  final double price;

  @override
  String toString() {
    return 'ServiceClothModel(clothId: $clothId, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceClothModelImpl &&
            (identical(other.clothId, clothId) || other.clothId == clothId) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clothId, price);

  /// Create a copy of ServiceClothModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceClothModelImplCopyWith<_$ServiceClothModelImpl> get copyWith =>
      __$$ServiceClothModelImplCopyWithImpl<_$ServiceClothModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceClothModelImplToJson(
      this,
    );
  }
}

abstract class _ServiceClothModel extends ServiceClothModel {
  const factory _ServiceClothModel(
      {required final String clothId,
      required final double price}) = _$ServiceClothModelImpl;
  const _ServiceClothModel._() : super._();

  factory _ServiceClothModel.fromJson(Map<String, dynamic> json) =
      _$ServiceClothModelImpl.fromJson;

  @override
  String get clothId;
  @override
  double get price;

  /// Create a copy of ServiceClothModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceClothModelImplCopyWith<_$ServiceClothModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
