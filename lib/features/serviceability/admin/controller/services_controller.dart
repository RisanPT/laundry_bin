import 'dart:developer';
import 'dart:io';
// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/service_cloth_model.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/services_model.dart';
import 'package:laundry_bin/features/serviceability/admin/services/cloths_storage_services.dart';
import 'package:laundry_bin/features/serviceability/admin/services/service_storage.dart';
import 'package:laundry_bin/features/serviceability/admin/services/services_db_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_controller.g.dart';
part 'services_controller.freezed.dart';

@freezed
class ServiceControllerState with _$ServiceControllerState {
  factory ServiceControllerState({
    required bool isLoading,
    required Map<String, double> cloths,
  }) = _ServiceControllerState;
}

@Riverpod(keepAlive: true)
class ServicesController extends _$ServicesController {
  @override
  ServiceControllerState build() {
    return ServiceControllerState(cloths: {}, isLoading: false);
  }

  /// Add a new cloth to the DB
  void setClothPrice(String clothId, String price) {
    final parsedPrice = double.tryParse(price);
    if (price.isNotEmpty && parsedPrice != null) {
      state = state.copyWith(cloths: {...state.cloths, clothId: parsedPrice});
    } else {
      SnackbarUtil.showsnackbar(message: "Invalid price format: $price");
    }
  }

  /// Add a new service to the DB
  Future<void> addService(
      String name, File image, List<ServiceClothModel> clothPriceList) async {
    // Validate service name
    if (name.isEmpty) {
      SnackbarUtil.showsnackbar(message: "Service name cannot be empty");
      return;
    }

    // Validate image
    if (image == null) {
      SnackbarUtil.showsnackbar(message: "Please pick an image");
      return;
    }

    // Validate cloth prices
    if (clothPriceList.isEmpty) {
      SnackbarUtil.showsnackbar(
          message: "You must add at least one cloth with a price");
      return;
    }

    // Set loading to true
    state = state.copyWith(isLoading: true);

    try {
      // Create a new service model with the provided data
      ServicesModel newService = ServicesModel(
        id: '', // Firestore will assign an ID
        name: name,
        image: image.path,
        cloths: clothPriceList,
      );

      // Upload the image to storage and get the download URL
      final uploadedImgPath =
          await ref.read(serviceStorageProvider).uploadImage(image);

      // Update the service model with the uploaded image URL
      newService = newService.copyWith(image: uploadedImgPath);

      // Add the service to the database
      await ref.read(servicesDBServicesProvider).addService(newService);

      // Optionally, clear the state after successful addition
      // state = state.copyWith(cloths: {});

      SnackbarUtil.showsnackbar(message: "Service added successfully");
    } catch (e) {
      // Handle any errors during the process
      SnackbarUtil.showsnackbar(message: "Failed to add service: $e");
    } finally {
      // Set loading to false regardless of success or failure
      state = state.copyWith(isLoading: false);
    }
  }
}

@riverpod
Stream<List<ServicesModel>> getAllServices(GetAllServicesRef ref) async* {
  try {
    final Stream<QuerySnapshot<ServicesModel>> snapshotStream =
        ref.read(servicesDBServicesProvider).getAllServices();

    await for (final snapshot in snapshotStream) {
      final docsSnapshot = snapshot.docs;

      final cloths = <ServicesModel>[];
      for (final doc in docsSnapshot) {
        ServicesModel cloth = doc.data();

        log('Fetched cloth data: $cloth');

        try {
          final String imageDownloadURL = await ref
              .read(clothsStorageServicesProvider)
              .getDownloadUrl(cloth.image);

          cloth = cloth.copyWith(image: imageDownloadURL);
        } catch (e) {
          log('Error downloading image for ${cloth.name}: $e');
        }
        cloths.add(cloth);
      }

      yield cloths;
    }
  } catch (e) {
    log('Error in getAllServices Stream: $e');
    yield [];
  }
}
