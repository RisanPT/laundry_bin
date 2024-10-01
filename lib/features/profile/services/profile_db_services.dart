import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_bin/features/profile/controller/model/profile_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_db_services.g.dart';

final class ProfileDBServices {
  // Get a reference to the profiles collection
  static final _profileCollection = FirebaseFirestore.instance
      .collection('profile')
      .withConverter(
          fromFirestore: ProfileModel.fromFireStore,
          toFirestore: (data, options) => data.toFirestore());
   
   // Add a new profile to the DB
  Future<void> addProfile(ProfileModel profile) async {
    await _profileCollection.add(profile);
  }
  
  // Update an existing profile in the DB
  Future<void> updateprofile(ProfileModel profile) async {
  if (profile.id.isNotEmpty) {
    await _profileCollection.doc(profile.id).set(profile);
  } else {
    throw ArgumentError('profile ID must not be empty');
  }
}

 // Delete a profile from the DB
  Future<void> deleteprofile(ProfileModel profile) async {
    await _profileCollection.doc(profile.id).delete();
  }

  // Get all profiles from the DB
  Stream<QuerySnapshot<ProfileModel>> getAllprofiles() {
    return _profileCollection.snapshots();
  }
  
  // Get a single profile from the DB
  Future<ProfileModel?> getprofileById(String id) async {
  final doc = await _profileCollection.doc(id).get();
  return doc.exists ? doc.data() : null;
}
}



@riverpod
ProfileDBServices profileDBServices(ProfileDBServicesRef ref) {
  return ProfileDBServices();
}