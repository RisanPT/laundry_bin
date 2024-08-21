import 'package:freezed_annotation/freezed_annotation.dart';
part 'offer_model_2.freezed.dart';

enum OfferType {
  percentage,
  amount,
}

@freezed
class OfferModel2 with _$OfferModel2 {
  const factory OfferModel2({
    required String title,
    required String image,
    required OfferType offerType,
    required String startDate,
    required String endDate,
    required String description,
    String? minOrderValue,
    String? maxApplyCount,
  }) = _OfferModel2;
}
