import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/features/offers/domain/offer_model.dart';
import 'package:laundry_bin/features/offers/services/offer_db_service.dart';
import 'package:laundry_bin/features/offers/services/offer_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'offer_controller.freezed.dart';
part 'offer_controller.g.dart';

@freezed
class OfferControllerState with _$OfferControllerState {
  factory OfferControllerState({
    required bool isLoading,
  }) = _OfferControllerState;
}

@riverpod
class OfferController extends _$OfferController {
  @override
  OfferControllerState build() {
    return OfferControllerState(isLoading: false);
  }

  Future<void> addOffer({
    required String title,
    required OfferType offerTypeEnum,
    required double offerTypeValue,
    required int maxApplyCount,
    String? description,
    File? image,
    DateTime? startDate,
    DateTime? endDate,
    int? minOrderValue,
    List<String>? serviceIds,
  }) async {
    state = state.copyWith(isLoading: true);

    try {
      final newOffer = OfferModel(
        id: '',
        title: title,
        offerTypeEnum: offerTypeEnum,
        offerTypeValue: offerTypeValue,
        maxApplyCount: maxApplyCount,
        description: description,
        image: image?.path,
        startDate: startDate,
        endDate: endDate,
        minOrderValue: minOrderValue,
        serviceIds: serviceIds,
      );
      final uploadedImage = image != null
          ? await ref
              .read(offerStorageServiceProvider)
              .uploadImage(File(image.path))
          : null;
      await ref.read(offerDbServiceProvider).addOffer(
            newOffer.copyWith(image: uploadedImage),
          );
      state = state.copyWith(isLoading: false);
    } catch (e) {}

    log(title);
    log(offerTypeEnum.toString());
    log(offerTypeValue.toString());
    log(maxApplyCount.toString());
    log(description ?? "no des");

    log(startDate.toString());
    log(endDate.toString());
    log(minOrderValue.toString());
    log(serviceIds.toString());
  }
}

@Riverpod(keepAlive: true)
Stream<List<OfferModel>> getAllOffers(GetAllOffersRef ref) async* {
  try {
    final Stream<QuerySnapshot<OfferModel>> snapshotStream =
        ref.read(offerDbServiceProvider).getAllOffers();
    await for (final snapshot in snapshotStream) {
      final docsSnapshot = snapshot.docs;
      final offers = <OfferModel>[];
      for (final doc in docsSnapshot) {
        OfferModel offer = doc.data();
        try {
          final String imageDownloadURL = await ref
              .read(offerStorageServiceProvider)
              .getDownloadUrl(offer.image!);
          offer = offer.copyWith(image: imageDownloadURL);
          offers.add(offer);
        } catch (e) {}
        offers.add(offer);
      }
      yield offers;
    }
  } catch (e) {
    yield [];
  }
}
