// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServiceControllerState {
  bool get isLoading => throw _privateConstructorUsedError;
  Map<String, double> get cloths => throw _privateConstructorUsedError;

  /// Create a copy of ServiceControllerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceControllerStateCopyWith<ServiceControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceControllerStateCopyWith<$Res> {
  factory $ServiceControllerStateCopyWith(ServiceControllerState value,
          $Res Function(ServiceControllerState) then) =
      _$ServiceControllerStateCopyWithImpl<$Res, ServiceControllerState>;
  @useResult
  $Res call({bool isLoading, Map<String, double> cloths});
}

/// @nodoc
class _$ServiceControllerStateCopyWithImpl<$Res,
        $Val extends ServiceControllerState>
    implements $ServiceControllerStateCopyWith<$Res> {
  _$ServiceControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceControllerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? cloths = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      cloths: null == cloths
          ? _value.cloths
          : cloths // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceControllerStateImplCopyWith<$Res>
    implements $ServiceControllerStateCopyWith<$Res> {
  factory _$$ServiceControllerStateImplCopyWith(
          _$ServiceControllerStateImpl value,
          $Res Function(_$ServiceControllerStateImpl) then) =
      __$$ServiceControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, Map<String, double> cloths});
}

/// @nodoc
class __$$ServiceControllerStateImplCopyWithImpl<$Res>
    extends _$ServiceControllerStateCopyWithImpl<$Res,
        _$ServiceControllerStateImpl>
    implements _$$ServiceControllerStateImplCopyWith<$Res> {
  __$$ServiceControllerStateImplCopyWithImpl(
      _$ServiceControllerStateImpl _value,
      $Res Function(_$ServiceControllerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceControllerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? cloths = null,
  }) {
    return _then(_$ServiceControllerStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      cloths: null == cloths
          ? _value._cloths
          : cloths // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc

class _$ServiceControllerStateImpl implements _ServiceControllerState {
  _$ServiceControllerStateImpl(
      {required this.isLoading, required final Map<String, double> cloths})
      : _cloths = cloths;

  @override
  final bool isLoading;
  final Map<String, double> _cloths;
  @override
  Map<String, double> get cloths {
    if (_cloths is EqualUnmodifiableMapView) return _cloths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cloths);
  }

  @override
  String toString() {
    return 'ServiceControllerState(isLoading: $isLoading, cloths: $cloths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceControllerStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._cloths, _cloths));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_cloths));

  /// Create a copy of ServiceControllerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceControllerStateImplCopyWith<_$ServiceControllerStateImpl>
      get copyWith => __$$ServiceControllerStateImplCopyWithImpl<
          _$ServiceControllerStateImpl>(this, _$identity);
}

abstract class _ServiceControllerState implements ServiceControllerState {
  factory _ServiceControllerState(
          {required final bool isLoading,
          required final Map<String, double> cloths}) =
      _$ServiceControllerStateImpl;

  @override
  bool get isLoading;
  @override
  Map<String, double> get cloths;

  /// Create a copy of ServiceControllerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceControllerStateImplCopyWith<_$ServiceControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
