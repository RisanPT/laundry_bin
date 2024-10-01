import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/service_cloth_model.dart';

part 'services_model.freezed.dart';
part 'services_model.g.dart';

@freezed
class ServicesModel with _$ServicesModel {
  const ServicesModel._();

  @JsonSerializable(explicitToJson: true)
  const factory ServicesModel({
    required String id,
    required String name,
    required String image,
    required List<ServiceClothModel> cloths, 
  }) = _ServicesModel;

  factory ServicesModel.fromJson(Map<String, Object?> json) =>
      _$ServicesModelFromJson(json);

 
  factory ServicesModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;
    data['id'] = snapshot.id;

 
    final clothsList = (data['cloths'] as List)
        .map((clothData) => ServiceClothModel.fromJson(clothData as Map<String, dynamic>))
        .toList();

    return ServicesModel(
      id: data['id'] as String,
      name: data['name'] as String,
      image: data['image'] as String,
      cloths: clothsList,
    );
  }

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('id');
    return json;
  }
}
