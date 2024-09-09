import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/cloths_model.dart';
import 'package:laundry_bin/features/serviceability/admin/services/cloths_db_services.dart';
import 'package:laundry_bin/features/serviceability/admin/services/cloths_storage_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cloths_controller.g.dart';

@riverpod
class ClothsController extends _$ClothsController {
  @override
  void build() {}

  /// Add a new cloths to the DB
  Future<void> addCloth(String name, File image) async {
    ClothsModel newCloth = ClothsModel(id: '', name: name, image: image.path);

    /// Upload the images to the storage
    final uploadedImgPath =
        await ref.read(clothsStorageServicesProvider).uploadImage(image);

    newCloth = newCloth.copyWith(image: uploadedImgPath);
    await ref.read(clothsDBServicesProvider).addCloth(newCloth);
  }

  /// Update the cloths in the DB
  Future<void> updateCloth(String id, String name, File? image) async {
  // Start by retrieving the existing cloth data
  final currentCloth = await ref.read(clothsDBServicesProvider).getClothById(id);

  if (currentCloth == null) {
    throw ArgumentError('Cloth with ID $id does not exist.');
  }

  // Initialize updatedCloth with the current cloth's data
  ClothsModel updatedCloth = currentCloth.copyWith(name: name);

  // If an image is provided, upload the new image and update the image path
  if (image != null) {
    final uploadedImgPath =
        await ref.read(clothsStorageServicesProvider).uploadImage(image);
    updatedCloth = updatedCloth.copyWith(image: uploadedImgPath);
  }

  // Update the cloth in the database
  await ref.read(clothsDBServicesProvider).updateCloth(updatedCloth);
}
}



@Riverpod(keepAlive: true)
Stream<List<ClothsModel>> allCloths(AllClothsRef ref) async* {
  final Stream<QuerySnapshot<ClothsModel>> snapshotStream =
      ref.read(clothsDBServicesProvider).getAllCloths();

  await for (final snapshot in snapshotStream) {
    final docsSnapshot = snapshot.docs;

    final cloths = <ClothsModel>[];
    for (final doc in docsSnapshot) {
      ClothsModel cloth = doc.data();

      final String imageDownloadURL = await ref
          .read(clothsStorageServicesProvider)
          .getDownloadUrl(cloth.image);

      cloth = cloth.copyWith(image: imageDownloadURL);
      cloths.add(cloth);
    }

    yield cloths;
  }
  // return ;
}
