import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/cloths_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cloths_db_services.g.dart';

final class ClothsDBServices {
  // Get a reference to the cloths collection
  static final _clothsCollection = FirebaseFirestore.instance
      .collection('cloths')
      .withConverter(
          fromFirestore: ClothsModel.fromFireStore,
          toFirestore: (data, options) => data.toFirestore());
   
   // Add a new cloth to the DB
  Future<void> addCloth(ClothsModel cloth) async {
    await _clothsCollection.add(cloth);
  }
  
  // Update an existing cloth in the DB
  Future<void> updateCloth(ClothsModel cloth) async {
  if (cloth.id.isNotEmpty) {
    await _clothsCollection.doc(cloth.id).set(cloth);
  } else {
    throw ArgumentError('Cloth ID must not be empty');
  }
}

 // Delete a cloth from the DB
  Future<void> deleteCloth(ClothsModel cloth) async {
    await _clothsCollection.doc(cloth.id).delete();
  }

  // Get all cloths from the DB
  Stream<QuerySnapshot<ClothsModel>> getAllCloths() {
    return _clothsCollection.snapshots();
  }
  
  // Get a single cloth from the DB
  Future<ClothsModel?> getClothById(String id) async {
  final doc = await _clothsCollection.doc(id).get();
  return doc.exists ? doc.data() : null;
}
}

@riverpod
/// A provider that returns an instance of [ClothsDBServices]
ClothsDBServices clothsDBServices(ClothsDBServicesRef ref) {
  return ClothsDBServices();
}
