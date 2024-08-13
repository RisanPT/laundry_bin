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
  String get clothname => throw _privateConstructorUsedError;
  String get clothimage => throw _privateConstructorUsedError;

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
  $Res call({String id, String clothname, String clothimage});
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
    Object? clothname = null,
    Object? clothimage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clothname: null == clothname
          ? _value.clothname
          : clothname // ignore: cast_nullable_to_non_nullable
              as String,
      clothimage: null == clothimage
          ? _value.clothimage
          : clothimage // ignore: cast_nullable_to_non_nullable
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
  $Res call({String id, String clothname, String clothimage});
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
    Object? clothname = null,
    Object? clothimage = null,
  }) {
    return _then(_$ClothsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clothname: null == clothname
          ? _value.clothname
          : clothname // ignore: cast_nullable_to_non_nullable
              as String,
      clothimage: null == clothimage
          ? _value.clothimage
          : clothimage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClothsModelImpl implements _ClothsModel {
  const _$ClothsModelImpl(
      {required this.id, required this.clothname, required this.clothimage});

  factory _$ClothsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClothsModelImplFromJson(json);

  @override
  final String id;
  @override
  final String clothname;
  @override
  final String clothimage;

  @override
  String toString() {
    return 'ClothsModel(id: $id, clothname: $clothname, clothimage: $clothimage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClothsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clothname, clothname) ||
                other.clothname == clothname) &&
            (identical(other.clothimage, clothimage) ||
                other.clothimage == clothimage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, clothname, clothimage);

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
  
  @override
  Map<String, dynamic> toFirestore() {
    // TODO: implement toFirestore
    throw UnimplementedError();
  }
}

abstract class _ClothsModel implements ClothsModel {
  const factory _ClothsModel(
      {required final String id,
      required final String clothname,
      required final String clothimage}) = _$ClothsModelImpl;

  factory _ClothsModel.fromJson(Map<String, dynamic> json) =
      _$ClothsModelImpl.fromJson;

  @override
  String get id;
  @override
  String get clothname;
  @override
  String get clothimage;
  @override
  @JsonKey(ignore: true)
  _$$ClothsModelImplCopyWith<_$ClothsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
