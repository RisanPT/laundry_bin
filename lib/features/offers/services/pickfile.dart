import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'dart:io';

import 'package:objectbox/objectbox.dart';

class Pickfile {
  static Future<String?> pickSVGFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['svg'],
    );
    if (result != null) {
      return result.files.single.path;
    } else {
      return null;
    }
  }

  static Future<void> uploadSVG(String filePath) async {
    await Firebase.initializeApp();
    String? filePath = await pickSVGFile();

    if (filePath != null) {
      File file = File(filePath);
      try {
        TaskSnapshot uploadTask = await FirebaseStorage.instance
            .ref('uploads/${file.uri.pathSegments.last}')
            .putFile(file);
        String downloadURL = await uploadTask.ref.getDownloadURL();

        await FirebaseFirestore.instance.collection('svgs').add({
          'name': file.uri.pathSegments.last,
          'url': downloadURL,
        });

        print('Upload and store complete');
      } on StorageException catch (e) {
        log('Upload and store failed: $e');
        SnackbarUtil.showsnackbar(message: e.message);
      } catch (e) {
        print('Upload and store failed: $e');
      }
    } else {
      print('No file selected');
    }
  }
}
