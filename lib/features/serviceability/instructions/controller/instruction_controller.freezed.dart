// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instruction_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InstructionControllerState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InstructionControllerStateCopyWith<InstructionControllerState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructionControllerStateCopyWith<$Res> {
  factory $InstructionControllerStateCopyWith(InstructionControllerState value,
          $Res Function(InstructionControllerState) then) =
      _$InstructionControllerStateCopyWithImpl<$Res,
          InstructionControllerState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$InstructionControllerStateCopyWithImpl<$Res,
        $Val extends InstructionControllerState>
    implements $InstructionControllerStateCopyWith<$Res> {
  _$InstructionControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstructionControllerStateImplCopyWith<$Res>
    implements $InstructionControllerStateCopyWith<$Res> {
  factory _$$InstructionControllerStateImplCopyWith(
          _$InstructionControllerStateImpl value,
          $Res Function(_$InstructionControllerStateImpl) then) =
      __$$InstructionControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$InstructionControllerStateImplCopyWithImpl<$Res>
    extends _$InstructionControllerStateCopyWithImpl<$Res,
        _$InstructionControllerStateImpl>
    implements _$$InstructionControllerStateImplCopyWith<$Res> {
  __$$InstructionControllerStateImplCopyWithImpl(
      _$InstructionControllerStateImpl _value,
      $Res Function(_$InstructionControllerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$InstructionControllerStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InstructionControllerStateImpl implements _InstructionControllerState {
  _$InstructionControllerStateImpl({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'InstructionControllerState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructionControllerStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructionControllerStateImplCopyWith<_$InstructionControllerStateImpl>
      get copyWith => __$$InstructionControllerStateImplCopyWithImpl<
          _$InstructionControllerStateImpl>(this, _$identity);
}

abstract class _InstructionControllerState
    implements InstructionControllerState {
  factory _InstructionControllerState({required final bool isLoading}) =
      _$InstructionControllerStateImpl;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$InstructionControllerStateImplCopyWith<_$InstructionControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
