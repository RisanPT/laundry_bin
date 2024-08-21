import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

final class ClothsStorageServices {
  static final _clothsImageStorage = FirebaseStorage.instance.ref();

  Future<String> uploadImage(File imageFile) async {
    final res = await _clothsImageStorage.putFile(imageFile);

    return res.ref.fullPath;
  }

  Future<void> deleteImage(String imageRefPath) async {
    await _clothsImageStorage.child(imageRefPath).delete();
  }
}
