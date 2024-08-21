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
  OfferType get offerType => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get minOrderValue => throw _privateConstructorUsedError;
  String? get maxApplyCount => throw _privateConstructorUsedError;

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
  $Res call(
      {String title,
      String image,
      OfferType offerType,
      String startDate,
      String endDate,
      String description,
      String? minOrderValue,
      String? maxApplyCount});
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
    Object? offerType = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? description = null,
    Object? minOrderValue = freezed,
    Object? maxApplyCount = freezed,
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
      offerType: null == offerType
          ? _value.offerType
          : offerType // ignore: cast_nullable_to_non_nullable
              as OfferType,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      minOrderValue: freezed == minOrderValue
          ? _value.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as String?,
      maxApplyCount: freezed == maxApplyCount
          ? _value.maxApplyCount
          : maxApplyCount // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {String title,
      String image,
      OfferType offerType,
      String startDate,
      String endDate,
      String description,
      String? minOrderValue,
      String? maxApplyCount});
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
    Object? offerType = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? description = null,
    Object? minOrderValue = freezed,
    Object? maxApplyCount = freezed,
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
      offerType: null == offerType
          ? _value.offerType
          : offerType // ignore: cast_nullable_to_non_nullable
              as OfferType,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      minOrderValue: freezed == minOrderValue
          ? _value.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as String?,
      maxApplyCount: freezed == maxApplyCount
          ? _value.maxApplyCount
          : maxApplyCount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OfferModel2Impl implements _OfferModel2 {
  const _$OfferModel2Impl(
      {required this.title,
      required this.image,
      required this.offerType,
      required this.startDate,
      required this.endDate,
      required this.description,
      this.minOrderValue,
      this.maxApplyCount});

  @override
  final String title;
  @override
  final String image;
  @override
  final OfferType offerType;
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final String description;
  @override
  final String? minOrderValue;
  @override
  final String? maxApplyCount;

  @override
  String toString() {
    return 'OfferModel2(title: $title, image: $image, offerType: $offerType, startDate: $startDate, endDate: $endDate, description: $description, minOrderValue: $minOrderValue, maxApplyCount: $maxApplyCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferModel2Impl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.offerType, offerType) ||
                other.offerType == offerType) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.maxApplyCount, maxApplyCount) ||
                other.maxApplyCount == maxApplyCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, image, offerType,
      startDate, endDate, description, minOrderValue, maxApplyCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferModel2ImplCopyWith<_$OfferModel2Impl> get copyWith =>
      __$$OfferModel2ImplCopyWithImpl<_$OfferModel2Impl>(this, _$identity);
}

abstract class _OfferModel2 implements OfferModel2 {
  const factory _OfferModel2(
      {required final String title,
      required final String image,
      required final OfferType offerType,
      required final String startDate,
      required final String endDate,
      required final String description,
      final String? minOrderValue,
      final String? maxApplyCount}) = _$OfferModel2Impl;

  @override
  String get title;
  @override
  String get image;
  @override
  OfferType get offerType;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  String get description;
  @override
  String? get minOrderValue;
  @override
  String? get maxApplyCount;
  @override
  @JsonKey(ignore: true)
  _$$OfferModel2ImplCopyWith<_$OfferModel2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
