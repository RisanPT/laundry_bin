import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/services_model.dart';
import 'package:laundry_bin/features/serviceability/admin/services/services_db_services.dart';

final servicesStreamProvider =
    AutoDisposeStreamProvider<QuerySnapshot<ServicesModel>>((ref) {
  final servicesDbServices = ref.watch(servicesDBServicesProvider);
  return servicesDbServices.getAllServices();
});
