// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferModelImpl _$$OfferModelImplFromJson(Map<String, dynamic> json) =>
    _$OfferModelImpl(
      id: json['id'] as String,
      image: json['image'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      description: json['description'] as String?,
      minOrderValue: (json['minOrderValue'] as num?)?.toInt(),
      serviceIds: (json['serviceIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      offerTypeValue: (json['offerTypeValue'] as num).toDouble(),
      offerTypeEnum: $enumDecode(_$OfferTypeEnumMap, json['offerTypeEnum']),
      title: json['title'] as String,
      maxApplyCount: (json['maxApplyCount'] as num).toInt(),
    );

Map<String, dynamic> _$$OfferModelImplToJson(_$OfferModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'description': instance.description,
      'minOrderValue': instance.minOrderValue,
      'serviceIds': instance.serviceIds,
      'offerTypeValue': instance.offerTypeValue,
      'offerTypeEnum': _$OfferTypeEnumMap[instance.offerTypeEnum]!,
      'title': instance.title,
      'maxApplyCount': instance.maxApplyCount,
    };

const _$OfferTypeEnumMap = {
  OfferType.percentage: 'percentage',
  OfferType.amount: 'amount',
};
