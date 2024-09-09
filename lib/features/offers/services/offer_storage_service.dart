import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'offer_storage_service.g.dart';

final class OfferStorageService {
  static final _offerImageStorage = FirebaseStorage.instance.ref();

  Future<String> uploadImage(File imageFile) async {
    final res = await _offerImageStorage
        .child('offers/offer_${DateTime.now().millisecond}')
        .putFile(imageFile);

    return res.ref.fullPath;
  }

  Future<void> deleteImage(String imageRefPath) async {
    await _offerImageStorage.child(imageRefPath).delete();
  }

  Future<String> getDownloadUrl(String ref) async {
    return await _offerImageStorage.child(ref).getDownloadURL();
  }
}

@riverpod
OfferStorageService offerStorageService(OfferStorageServiceRef ref) =>
    OfferStorageService();
