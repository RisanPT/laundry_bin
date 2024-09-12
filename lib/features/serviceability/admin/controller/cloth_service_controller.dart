import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/cloth_service_model.dart';

final allClothProviderr = StreamProvider<List<ClothServiceModel>>((ref) async* {
  final clothsCollection = FirebaseFirestore.instance.collection('cloths');
  
  final clothsSnapshotStream = clothsCollection.snapshots();

  final servicesCollection = FirebaseFirestore.instance.collection('services');

  yield* clothsSnapshotStream.asyncMap((clothsSnapshot) async {
    final clothList = clothsSnapshot.docs.map((doc) {
      return ClothServiceModel.fromFirestore(doc);
    }).toList();

    final updatedClothList = await Future.wait(clothList.map((cloth) async {
      final serviceSnapshot = await servicesCollection.get();

      for (var serviceDoc in serviceSnapshot.docs) {
        final serviceData = serviceDoc.data();
        
        final serviceCloth = (serviceData['cloths'] as List).firstWhere(
          (clothItem) => clothItem['clothId'] == cloth.id,
          orElse: () => null,
        );

        if (serviceCloth != null) {
          return cloth.copyWith(price: serviceCloth['price']);
        }
      }

      return cloth;
    }).toList());

    return updatedClothList;
  });
});
