// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instruction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InstructionModel _$InstructionModelFromJson(Map<String, dynamic> json) {
  return _InstructionModel.fromJson(json);
}

/// @nodoc
mixin _$InstructionModel {
  String get serviceId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<Map<String, double>>? get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstructionModelCopyWith<InstructionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructionModelCopyWith<$Res> {
  factory $InstructionModelCopyWith(
          InstructionModel value, $Res Function(InstructionModel) then) =
      _$InstructionModelCopyWithImpl<$Res, InstructionModel>;
  @useResult
  $Res call(
      {String serviceId, String title, List<Map<String, double>>? options});
}

/// @nodoc
class _$InstructionModelCopyWithImpl<$Res, $Val extends InstructionModel>
    implements $InstructionModelCopyWith<$Res> {
  _$InstructionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? title = null,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Map<String, double>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstructionModelImplCopyWith<$Res>
    implements $InstructionModelCopyWith<$Res> {
  factory _$$InstructionModelImplCopyWith(_$InstructionModelImpl value,
          $Res Function(_$InstructionModelImpl) then) =
      __$$InstructionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String serviceId, String title, List<Map<String, double>>? options});
}

/// @nodoc
class __$$InstructionModelImplCopyWithImpl<$Res>
    extends _$InstructionModelCopyWithImpl<$Res, _$InstructionModelImpl>
    implements _$$InstructionModelImplCopyWith<$Res> {
  __$$InstructionModelImplCopyWithImpl(_$InstructionModelImpl _value,
      $Res Function(_$InstructionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? title = null,
    Object? options = freezed,
  }) {
    return _then(_$InstructionModelImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Map<String, double>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InstructionModelImpl extends _InstructionModel {
  _$InstructionModelImpl(
      {required this.serviceId,
      required this.title,
      final List<Map<String, double>>? options})
      : _options = options,
        super._();

  factory _$InstructionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstructionModelImplFromJson(json);

  @override
  final String serviceId;
  @override
  final String title;
  final List<Map<String, double>>? _options;
  @override
  List<Map<String, double>>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InstructionModel(serviceId: $serviceId, title: $title, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructionModelImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, serviceId, title,
      const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructionModelImplCopyWith<_$InstructionModelImpl> get copyWith =>
      __$$InstructionModelImplCopyWithImpl<_$InstructionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstructionModelImplToJson(
      this,
    );
  }
}

abstract class _InstructionModel extends InstructionModel {
  factory _InstructionModel(
      {required final String serviceId,
      required final String title,
      final List<Map<String, double>>? options}) = _$InstructionModelImpl;
  _InstructionModel._() : super._();

  factory _InstructionModel.fromJson(Map<String, dynamic> json) =
      _$InstructionModelImpl.fromJson;

  @override
  String get serviceId;
  @override
  String get title;
  @override
  List<Map<String, double>>? get options;
  @override
  @JsonKey(ignore: true)
  _$$InstructionModelImplCopyWith<_$InstructionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
