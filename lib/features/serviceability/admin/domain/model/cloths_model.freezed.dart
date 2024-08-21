// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloths_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClothsModel _$ClothsModelFromJson(Map<String, dynamic> json) {
  return _ClothsModel.fromJson(json);
}

/// @nodoc
mixin _$ClothsModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClothsModelCopyWith<ClothsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClothsModelCopyWith<$Res> {
  factory $ClothsModelCopyWith(
          ClothsModel value, $Res Function(ClothsModel) then) =
      _$ClothsModelCopyWithImpl<$Res, ClothsModel>;
  @useResult
  $Res call({String id, String name, String image});
}

/// @nodoc
class _$ClothsModelCopyWithImpl<$Res, $Val extends ClothsModel>
    implements $ClothsModelCopyWith<$Res> {
  _$ClothsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClothsModelImplCopyWith<$Res>
    implements $ClothsModelCopyWith<$Res> {
  factory _$$ClothsModelImplCopyWith(
          _$ClothsModelImpl value, $Res Function(_$ClothsModelImpl) then) =
      __$$ClothsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String image});
}

/// @nodoc
class __$$ClothsModelImplCopyWithImpl<$Res>
    extends _$ClothsModelCopyWithImpl<$Res, _$ClothsModelImpl>
    implements _$$ClothsModelImplCopyWith<$Res> {
  __$$ClothsModelImplCopyWithImpl(
      _$ClothsModelImpl _value, $Res Function(_$ClothsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_$ClothsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClothsModelImpl extends _ClothsModel {
  const _$ClothsModelImpl(
      {required this.id, required this.name, required this.image})
      : super._();

  factory _$ClothsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClothsModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String image;

  @override
  String toString() {
    return 'ClothsModel(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClothsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClothsModelImplCopyWith<_$ClothsModelImpl> get copyWith =>
      __$$ClothsModelImplCopyWithImpl<_$ClothsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClothsModelImplToJson(
      this,
    );
  }
}

abstract class _ClothsModel extends ClothsModel {
  const factory _ClothsModel(
      {required final String id,
      required final String name,
      required final String image}) = _$ClothsModelImpl;
  const _ClothsModel._() : super._();

  factory _ClothsModel.fromJson(Map<String, dynamic> json) =
      _$ClothsModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$ClothsModelImplCopyWith<_$ClothsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
