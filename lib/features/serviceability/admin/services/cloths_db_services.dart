import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:laundry_bin/features/serviceability/admin/domain/model/cloths_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cloths_db_services.g.dart';

final class ClothsFirestoreServices {
  static final FirebaseFirestore clothsdb = FirebaseFirestore.instance;
  static final FirebaseStorage  svgstorage = FirebaseStorage.instance;
  
  final _cloths = clothsdb.collection('cloths').withConverter(
      fromFirestore: ClothsModel.fromFireStore,
      toFirestore: (data, options) => data.toFirestore());

  void addCloths(ClothsModel cloths){
    _cloths.add(cloths);
  }    

  Future<String?>uploadSvg(PlatformFile file)async{
    try{
      final storageRef=svgstorage.ref().child('svg/${file.name}');
      final uploadTask=storageRef.putData(file.bytes!);
      final snapshot=await uploadTask.whenComplete((){});
      return await snapshot.ref.getDownloadURL();
    }catch(e){
      return null;
    }
  }
}

@riverpod
ClothsFirestoreServices clothsFirestoreServices(ClothsFirestoreServicesRef ref){
  return ClothsFirestoreServices();
}