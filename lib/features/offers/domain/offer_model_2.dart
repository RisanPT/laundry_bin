import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'offer_model_2.freezed.dart';
part 'offer_model_2.g.dart';

enum OfferType {
  percentage,
  amount,
}

@freezed
class OfferModel2 with _$OfferModel2 {
  const OfferModel2._();
  const factory OfferModel2({
    String? id,
    required String title,
    required String image,
    required double offerTypeValue,
    required OfferType offerTypeEnum,
    required DateTime startDate,
    required DateTime endDate,
    required String description,
    int? minOrderValue,
    int? maxApplyCount,
  }) = _OfferModel2;

  factory OfferModel2.fromJson(Map<String, dynamic> json) =>
      _$OfferModel2FromJson(json);

  factory OfferModel2.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;
    data['id'] = snapshot.id;

    return OfferModel2.fromJson(data);
  }


  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('id');
    return json;
  }
}
