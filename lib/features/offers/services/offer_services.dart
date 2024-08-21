import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class OfferServices {
  /// Pick an SVG file using the platform's file picker.
  ///
  /// The file picker is configured to only allow SVG files to be selected.
  ///
  /// If the user cancels the file picker, or if the file picker fails for
  /// any reason, this function returns null.
  ///
  /// Otherwise, this function returns the path of the selected file.
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
    } catch (e) {
      print('Upload and store failed: $e');
    }
  }
}
