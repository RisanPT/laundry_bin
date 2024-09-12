// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloth_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClothServiceModelImpl _$$ClothServiceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClothServiceModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$ClothServiceModelImplToJson(
        _$ClothServiceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
    };
