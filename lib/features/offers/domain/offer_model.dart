import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

enum OfferType {
  percentage,
  amount,
}

@freezed
class OfferModel with _$OfferModel {
  const OfferModel._();
  const factory OfferModel({
    required String id,
    String? image,
    DateTime? startDate,
    DateTime? endDate,
    String? description,
    int? minOrderValue,
    List<String>? serviceIds,
    required double offerTypeValue,
    required OfferType offerTypeEnum,
    required String title,
    required int maxApplyCount,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);

  factory OfferModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;
    data['id'] = snapshot.id;

    return OfferModel.fromJson(data);
  }

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('id');

    return json;
  }
}
