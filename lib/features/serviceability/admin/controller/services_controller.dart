import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/service_cloth_model.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/services_model.dart';
import 'package:laundry_bin/features/serviceability/admin/services/cloths_storage_services.dart';
import 'package:laundry_bin/features/serviceability/admin/services/service_storage.dart';
import 'package:laundry_bin/features/serviceability/admin/services/services_db_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_controller.g.dart';

@riverpod
class ServicesController extends _$ServicesController {
  @override
  void build() {}

  /// Add a new cloths to the DB
  Future<void> addService(String name, File image,List<ServiceClothModel> cloths) async {
    ServicesModel newService = ServicesModel(id: '', name: name, image:image.path , cloths: cloths);

    /// Upload the images to the storage
    final uploadedImgPath =
        await ref.read(serviceStorageProvider).uploadImage(image);

    newService = newService.copyWith(image: uploadedImgPath);
    await ref.read(servicesDBServicesProvider).addService(newService);
  }
}

@riverpod
Stream<List<ServicesModel>> getAllServices(GetAllServicesRef ref) async* {
  final Stream<QuerySnapshot<ServicesModel>> snapshotStream =
      ref.read(servicesDBServicesProvider).getAllServices();

  await for (final snapshot in snapshotStream) {
    final docsSnapshot = snapshot.docs;

    final cloths = <ServicesModel>[];
    for (final doc in docsSnapshot) {
      ServicesModel cloth = doc.data();

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
