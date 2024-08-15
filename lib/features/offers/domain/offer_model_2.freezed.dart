// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_model_2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OfferModel2 {
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OfferModel2CopyWith<OfferModel2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferModel2CopyWith<$Res> {
  factory $OfferModel2CopyWith(
          OfferModel2 value, $Res Function(OfferModel2) then) =
      _$OfferModel2CopyWithImpl<$Res, OfferModel2>;
  @useResult
  $Res call({String title, String image});
}

/// @nodoc
class _$OfferModel2CopyWithImpl<$Res, $Val extends OfferModel2>
    implements $OfferModel2CopyWith<$Res> {
  _$OfferModel2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfferModel2ImplCopyWith<$Res>
    implements $OfferModel2CopyWith<$Res> {
  factory _$$OfferModel2ImplCopyWith(
          _$OfferModel2Impl value, $Res Function(_$OfferModel2Impl) then) =
      __$$OfferModel2ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String image});
}

/// @nodoc
class __$$OfferModel2ImplCopyWithImpl<$Res>
    extends _$OfferModel2CopyWithImpl<$Res, _$OfferModel2Impl>
    implements _$$OfferModel2ImplCopyWith<$Res> {
  __$$OfferModel2ImplCopyWithImpl(
      _$OfferModel2Impl _value, $Res Function(_$OfferModel2Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
  }) {
    return _then(_$OfferModel2Impl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OfferModel2Impl implements _OfferModel2 {
  const _$OfferModel2Impl({required this.title, required this.image});

  @override
  final String title;
  @override
  final String image;

  @override
  String toString() {
    return 'OfferModel2(title: $title, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferModel2Impl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferModel2ImplCopyWith<_$OfferModel2Impl> get copyWith =>
      __$$OfferModel2ImplCopyWithImpl<_$OfferModel2Impl>(this, _$identity);
}

abstract class _OfferModel2 implements OfferModel2 {
  const factory _OfferModel2(
      {required final String title,
      required final String image}) = _$OfferModel2Impl;

  @override
  String get title;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$OfferModel2ImplCopyWith<_$OfferModel2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
