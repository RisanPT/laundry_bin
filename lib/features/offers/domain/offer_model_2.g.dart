// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model_2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferModel2Impl _$$OfferModel2ImplFromJson(Map<String, dynamic> json) =>
    _$OfferModel2Impl(
      id: json['id'] as String?,
      title: json['title'] as String,
      image: json['image'] as String,
      offerTypeValue: (json['offerTypeValue'] as num).toDouble(),
      offerTypeEnum: $enumDecode(_$OfferTypeEnumMap, json['offerTypeEnum']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      description: json['description'] as String,
      minOrderValue: (json['minOrderValue'] as num?)?.toInt(),
      maxApplyCount: (json['maxApplyCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OfferModel2ImplToJson(_$OfferModel2Impl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'offerTypeValue': instance.offerTypeValue,
      'offerTypeEnum': _$OfferTypeEnumMap[instance.offerTypeEnum]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'description': instance.description,
      'minOrderValue': instance.minOrderValue,
      'maxApplyCount': instance.maxApplyCount,
    };

const _$OfferTypeEnumMap = {
  OfferType.percentage: 'percentage',
  OfferType.amount: 'amount',
};
