// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_cloth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceClothModelImpl _$$ServiceClothModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceClothModelImpl(
      clothId: json['clothId'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$ServiceClothModelImplToJson(
        _$ServiceClothModelImpl instance) =>
    <String, dynamic>{
      'clothId': instance.clothId,
      'price': instance.price,
    };
