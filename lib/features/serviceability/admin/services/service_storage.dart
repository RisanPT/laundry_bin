import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_storage.g.dart';

final class ServiceStorage {
  static final _serviceImages = FirebaseStorage.instance.ref();

  Future<String> uploadImage(File imageFile) async {
    final res = await _serviceImages
        .child('service_${DateTime.now().millisecond}')
        .putFile(imageFile);

    return res.ref.fullPath;
  }

  Future<void> deleteImage(String imageRefPath) async {
    await _serviceImages.child(imageRefPath).delete();
  }

  Future<String> getDownloadUrl(String ref) async {
    return await _serviceImages.child(ref).getDownloadURL();
  }
}

@riverpod
ServiceStorage serviceStorage(ServiceStorageRef ref) => ServiceStorage();
