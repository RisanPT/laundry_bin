import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/services_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_db_services.g.dart';

final class ServicesDbServices {
  static final _servicesCollection = FirebaseFirestore.instance
      .collection('services')
      .withConverter(
          fromFirestore: ServicesModel.fromFireStore,
          toFirestore: (data, options) => data.toFirestore());

  Future<String> addService(ServicesModel service) async {
    final docRef = await _servicesCollection.add(service);
    return docRef.id;
  }

  Future<void> updateService(ServicesModel service) async {
    await _servicesCollection.doc(service.id).set(service);
  }

  Future<ServicesModel?> getServiceById(String id) async {
    final doc = await _servicesCollection.doc(id).get();
    return doc.exists ? doc.data() : null;
  }

  Future<void> deleteService(String serviceId) async {
    await _servicesCollection.doc(serviceId).delete();
  }

  Future<void> deleteAll() async {
    final snapshot = await _servicesCollection.get();
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  Stream<QuerySnapshot<ServicesModel>> getAllServices() {
    return _servicesCollection.snapshots();
  }
}

@riverpod
ServicesDbServices servicesDBServices(ServicesDBServicesRef ref) =>
    ServicesDbServices();
