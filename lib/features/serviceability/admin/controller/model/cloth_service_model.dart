import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloth_service_model.freezed.dart';
part 'cloth_service_model.g.dart';

@freezed
class ClothServiceModel with _$ClothServiceModel {
  const factory ClothServiceModel({
    required String id,     
    required String name,    
    double? price,            
    required String image,   
  }) = _ClothServiceModel;

  factory ClothServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ClothServiceModelFromJson(json);

  factory ClothServiceModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    
    return ClothServiceModel(
      id: doc.id,            
      name: data['name'] as String,
      image: data['image'] as String,
      price: data['price'] as double?,  
    );
  }
}
