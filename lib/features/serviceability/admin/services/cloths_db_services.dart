import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/cloths_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cloths_db_services.g.dart';

final class ClothsDBServices {
  static final _clothsCollection = FirebaseFirestore.instance
      .collection('cloths')
      .withConverter(
          fromFirestore: ClothsModel.fromFireStore,
          toFirestore: (data, options) => data.toFirestore());

  Future<void> addCloth(ClothsModel cloth) async {
    await _clothsCollection.add(cloth);
  }

  Future<void> updateCloth(ClothsModel cloth) async {
    await _clothsCollection.doc(cloth.id).set(cloth);
  }

  Future<void> deleteCloth(ClothsModel cloth) async {
    await _clothsCollection.doc(cloth.id).delete();
  }

  Stream<QuerySnapshot<ClothsModel>> getAllCloths() {
    return _clothsCollection.snapshots();
  }
}

@riverpod
ClothsDBServices clothsDBServices(ClothsDBServicesRef ref) {
  return ClothsDBServices();
}
