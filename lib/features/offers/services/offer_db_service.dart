import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_bin/features/offers/domain/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'offer_db_service.g.dart';

final class OfferDbService {
  static final _offerCollection = FirebaseFirestore.instance
      .collection('offers')
      .withConverter(
          fromFirestore: OfferModel.fromFireStore,
          toFirestore: (data, options) => data.toFirestore());

  Future<void> addOffer(OfferModel offer) async {
    await _offerCollection.add(offer);
  }

  Stream<QuerySnapshot<OfferModel>> getAllOffers() {
    return _offerCollection.snapshots();
  }

  Future<OfferModel?> getOfferById(String id) async {
    final doc = await _offerCollection.doc(id).get();
    return doc.exists ? doc.data() : null;
  }

  Future<void> updateOffer(OfferModel offer) async {
    await _offerCollection.doc(offer.id).set(offer);
  }

  Future<void> deleteOffer(String offerId) async {
    await _offerCollection.doc(offerId).delete();
  }
}

@riverpod
OfferDbService offerDbService(OfferDbServiceRef ref) => OfferDbService();
