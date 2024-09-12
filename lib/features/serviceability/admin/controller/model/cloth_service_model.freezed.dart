// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloth_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClothServiceModel _$ClothServiceModelFromJson(Map<String, dynamic> json) {
  return _ClothServiceModel.fromJson(json);
}

/// @nodoc
mixin _$ClothServiceModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClothServiceModelCopyWith<ClothServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClothServiceModelCopyWith<$Res> {
  factory $ClothServiceModelCopyWith(
          ClothServiceModel value, $Res Function(ClothServiceModel) then) =
      _$ClothServiceModelCopyWithImpl<$Res, ClothServiceModel>;
  @useResult
  $Res call({String id, String name, double? price, String image});
}

/// @nodoc
class _$ClothServiceModelCopyWithImpl<$Res, $Val extends ClothServiceModel>
    implements $ClothServiceModelCopyWith<$Res> {
  _$ClothServiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = freezed,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClothServiceModelImplCopyWith<$Res>
    implements $ClothServiceModelCopyWith<$Res> {
  factory _$$ClothServiceModelImplCopyWith(_$ClothServiceModelImpl value,
          $Res Function(_$ClothServiceModelImpl) then) =
      __$$ClothServiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double? price, String image});
}

/// @nodoc
class __$$ClothServiceModelImplCopyWithImpl<$Res>
    extends _$ClothServiceModelCopyWithImpl<$Res, _$ClothServiceModelImpl>
    implements _$$ClothServiceModelImplCopyWith<$Res> {
  __$$ClothServiceModelImplCopyWithImpl(_$ClothServiceModelImpl _value,
      $Res Function(_$ClothServiceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = freezed,
    Object? image = null,
  }) {
    return _then(_$ClothServiceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClothServiceModelImpl implements _ClothServiceModel {
  const _$ClothServiceModelImpl(
      {required this.id, required this.name, this.price, required this.image});

  factory _$ClothServiceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClothServiceModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double? price;
  @override
  final String image;

  @override
  String toString() {
    return 'ClothServiceModel(id: $id, name: $name, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClothServiceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClothServiceModelImplCopyWith<_$ClothServiceModelImpl> get copyWith =>
      __$$ClothServiceModelImplCopyWithImpl<_$ClothServiceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClothServiceModelImplToJson(
      this,
    );
  }
}

abstract class _ClothServiceModel implements ClothServiceModel {
  const factory _ClothServiceModel(
      {required final String id,
      required final String name,
      final double? price,
      required final String image}) = _$ClothServiceModelImpl;

  factory _ClothServiceModel.fromJson(Map<String, dynamic> json) =
      _$ClothServiceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double? get price;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$ClothServiceModelImplCopyWith<_$ClothServiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
