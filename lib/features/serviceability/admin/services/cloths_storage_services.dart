import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cloths_storage_services.g.dart';

final class ClothsStorageServices {
  static final _clothsImageStorage = FirebaseStorage.instance.ref();

  Future<String> uploadImage(File imageFile) async {
    final res = await _clothsImageStorage
        .child('cloth_${DateTime.now().millisecond}')
        .putFile(imageFile);

    return res.ref.fullPath;
  }

  Future<void> deleteImage(String imageRefPath) async {
    await _clothsImageStorage.child(imageRefPath).delete();
  }

  Future<String> getDownloadUrl(String ref) async {
    return await _clothsImageStorage.child(ref).getDownloadURL();
  }
}

@riverpod
ClothsStorageServices clothsStorageServices(ClothsStorageServicesRef ref) =>
    ClothsStorageServices();
