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
   
   Future<void>updateCloth(String id,String name, File image) async {
     
     ClothsModel newCloth = ClothsModel(id: id, name: name, image: image.path);
       /// Upload the images to the storage
    final uploadedImgPath =
        await ref.read(clothsStorageServicesProvider).uploadImage(image);

    newCloth = newCloth.copyWith(image: uploadedImgPath);
   
     await ref.read(clothsDBServicesProvider).updateCloth(newCloth);
   }
 
}



@riverpod
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
