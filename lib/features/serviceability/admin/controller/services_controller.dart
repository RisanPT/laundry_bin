import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/service_cloth_model.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/services_model.dart';
import 'package:laundry_bin/features/serviceability/admin/services/cloths_storage_services.dart';
import 'package:laundry_bin/features/serviceability/admin/services/service_storage.dart';
import 'package:laundry_bin/features/serviceability/admin/services/services_db_services.dart';
import 'package:laundry_bin/features/serviceability/instructions/controller/instruction_controller.dart';
import 'package:laundry_bin/features/serviceability/instructions/controller/model/instruction_model.dart';
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
  void setClothPrice(String name, String price) {
    if (price.isNotEmpty && double.tryParse(price) != null) {
      state =
          state.copyWith(cloths: {...state.cloths, name: double.parse(price)});
    } else {}
  }

  /// Add a new service to the DB
  Future<void> addService(
      String name,
      File image,
      List<InstructionModel> instructions,
      List<ServiceClothModel> clothPriceList) async {
    state = state.copyWith(isLoading: true);

    try {
      final List<ServiceClothModel> clothss = [];

      // Convert the state cloths map into a list of ServiceClothModel
      for (final cloth in state.cloths.entries) {
        final ServiceClothModel serviceCloth = ServiceClothModel(
          clothId: cloth.key,
          price: cloth.value,
        );
        clothss.add(serviceCloth);
      }

      ServicesModel newService = ServicesModel(
        id: '', // This will be assigned by Firestore
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
      final serviceId =
          await ref.read(servicesDBServicesProvider).addService(newService);

      for (final instruction in instructions) {
        await ref.read(instructionControllerProvider.notifier).addInstruction(
              title: instruction.title,
              options: instruction.options,
              serviceId: serviceId,
            );
      }
      ref.invalidate(getAllServicesProvider);
    } catch (e) {
      SnackbarUtil.showsnackbar(message: "Failed to add service: $e");
    } finally {
      // Set loading to false regardless of success or failure
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> updateService({
    required String id,
    required String name,
    List<ServiceClothModel>? clothPriceList,
    File? image,
    String? description,
    List<InstructionModel>? instructions,
  }) async {
    state = state.copyWith(isLoading: true);

    try {
      final existingService =
          await ref.read(servicesDBServicesProvider).getServiceById(id);
      if (existingService == null) return;

      final updatedService = existingService.copyWith(
        name: name,
        cloths: clothPriceList ?? existingService.cloths,
      );

      final uploadedImage = image != null
          ? await ref.read(serviceStorageProvider).uploadImage(image)
          : existingService.image;

      await ref.read(servicesDBServicesProvider).updateService(
            updatedService.copyWith(image: uploadedImage),
          );

      if (instructions != null) {
        for (final instruction in instructions) {
          await ref
              .read(instructionControllerProvider.notifier)
              .updateInstruction(
                instructionId: instruction.id!,
                title: instruction.title,
                options: instruction.options,
                serviceId: id,
              );
        }
      }

      state = state.copyWith(isLoading: false);
    } on IOException catch (e) {
      state = state.copyWith(isLoading: false);
      log(e.toString());
      SnackbarUtil.showsnackbar(
          message: "Please check the file, and try again");
    } on FirebaseException catch (e) {
      state = state.copyWith(isLoading: false);
      log(e.toString());
      SnackbarUtil.showsnackbar(message: "Failed to update service");
    } catch (e) {
      log(e.toString());
      state = state.copyWith(isLoading: false);
      SnackbarUtil.showsnackbar(
          message: "Something went wrong, please try again");
    }
  }

  Future<void> deleteService(String serviceId) async {
    state = state.copyWith(isLoading: true);
    try {
      await ref.read(servicesDBServicesProvider).deleteService(serviceId);
      ref.invalidate(getAllServicesProvider);
    } catch (e) {
      SnackbarUtil.showsnackbar(message: "Failed to delete service: $e");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

@Riverpod(keepAlive: true)
Stream<List<ServicesModel>> getAllServices(GetAllServicesRef ref) async* {
  try {
    final Stream<QuerySnapshot<ServicesModel>> snapshotStream =
        ref.read(servicesDBServicesProvider).getAllServices();
    await for (final snapshot in snapshotStream) {
      final docsSnapshot = snapshot.docs;
      final services = <ServicesModel>[];
      for (final doc in docsSnapshot) {
        ServicesModel service = doc.data();

        try {
          final String imageDownloadURL = await ref
              .read(clothsStorageServicesProvider)
              .getDownloadUrl(service.image);

          service = service.copyWith(image: imageDownloadURL);
        } catch (e) {
          log('Error downloading image for ${service.name}: $e');
        }
        services.add(service);
      }
      yield services;
    }
  } catch (e) {
    log('Error in getAllServices Stream: $e');
    yield [];
  }
}
