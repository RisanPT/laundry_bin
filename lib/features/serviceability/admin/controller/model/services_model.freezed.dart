// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServicesModel _$ServicesModelFromJson(Map<String, dynamic> json) {
  return _ServicesModel.fromJson(json);
}

/// @nodoc
mixin _$ServicesModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<ServiceClothModel> get cloths => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServicesModelCopyWith<ServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesModelCopyWith<$Res> {
  factory $ServicesModelCopyWith(
          ServicesModel value, $Res Function(ServicesModel) then) =
      _$ServicesModelCopyWithImpl<$Res, ServicesModel>;
  @useResult
  $Res call(
      {String id, String name, String image, List<ServiceClothModel> cloths});
}

/// @nodoc
class _$ServicesModelCopyWithImpl<$Res, $Val extends ServicesModel>
    implements $ServicesModelCopyWith<$Res> {
  _$ServicesModelCopyWithImpl(this._value, this._then);

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
    Object? cloths = null,
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
      cloths: null == cloths
          ? _value.cloths
          : cloths // ignore: cast_nullable_to_non_nullable
              as List<ServiceClothModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServicesModelImplCopyWith<$Res>
    implements $ServicesModelCopyWith<$Res> {
  factory _$$ServicesModelImplCopyWith(
          _$ServicesModelImpl value, $Res Function(_$ServicesModelImpl) then) =
      __$$ServicesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String image, List<ServiceClothModel> cloths});
}

/// @nodoc
class __$$ServicesModelImplCopyWithImpl<$Res>
    extends _$ServicesModelCopyWithImpl<$Res, _$ServicesModelImpl>
    implements _$$ServicesModelImplCopyWith<$Res> {
  __$$ServicesModelImplCopyWithImpl(
      _$ServicesModelImpl _value, $Res Function(_$ServicesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? cloths = null,
  }) {
    return _then(_$ServicesModelImpl(
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
      cloths: null == cloths
          ? _value._cloths
          : cloths // ignore: cast_nullable_to_non_nullable
              as List<ServiceClothModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServicesModelImpl extends _ServicesModel {
  const _$ServicesModelImpl(
      {required this.id,
      required this.name,
      required this.image,
      required final List<ServiceClothModel> cloths})
      : _cloths = cloths,
        super._();

  factory _$ServicesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServicesModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String image;
  final List<ServiceClothModel> _cloths;
  @override
  List<ServiceClothModel> get cloths {
    if (_cloths is EqualUnmodifiableListView) return _cloths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cloths);
  }

  @override
  String toString() {
    return 'ServicesModel(id: $id, name: $name, image: $image, cloths: $cloths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._cloths, _cloths));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image,
      const DeepCollectionEquality().hash(_cloths));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicesModelImplCopyWith<_$ServicesModelImpl> get copyWith =>
      __$$ServicesModelImplCopyWithImpl<_$ServicesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServicesModelImplToJson(
      this,
    );
  }
}

abstract class _ServicesModel extends ServicesModel {
  const factory _ServicesModel(
      {required final String id,
      required final String name,
      required final String image,
      required final List<ServiceClothModel> cloths}) = _$ServicesModelImpl;
  const _ServicesModel._() : super._();

  factory _ServicesModel.fromJson(Map<String, dynamic> json) =
      _$ServicesModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get image;
  @override
  List<ServiceClothModel> get cloths;
  @override
  @JsonKey(ignore: true)
  _$$ServicesModelImplCopyWith<_$ServicesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
