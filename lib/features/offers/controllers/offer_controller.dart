import 'package:laundry_bin/features/offers/domain/offer_model_2.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'offer_controller.g.dart';
@riverpod
class OfferController extends _$OfferController {
  @override
  List<OfferModel2> build() {
    return [];
  }
  /// Adds an [OfferModel2] to the state.
  void addOffer(OfferModel2 offer){
    state = [...state, offer];
  }
  void removeOffer(OfferModel2 offer){
    state = state.where((element) => element != offer).toList();
  }

}