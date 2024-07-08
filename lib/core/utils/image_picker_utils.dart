import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';


//TODO Image Picker Utils
class ImagePickerUtils {

  //TODO Image Select From Camera
  static Future<XFile?> pickImageFromCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return image;
    } else {
      Future.sync(
          () => SnackbarUtil.showErrorsnackbar(message: "No Image Picked"));
    }
    return null;
  }
  //TODO Image Select From Gallery
  static Future<XFile?> pickImageFromGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return image;
    } else {
      Future.sync(
          () => SnackbarUtil.showErrorsnackbar(message: "No Image Picked"));
    }
    return null;
  }
//TODO Show Dialogue For Imagge Selection

  static Future<XFile?> showDialogueForImagePicker(BuildContext context,
      [bool showDeleteOption = false]) async {
    final imageCompleter = Completer<XFile?>();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: context.colors.white,
            title: const Text("Select Image"),
            actions: [
              TextButton.icon(
                onPressed: () {},
                label: Text("Camera"),
                icon: Icon(Icons.camera),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text("Gallery"),
                icon: Icon(Icons.image),
              )
            ]);
            
      },
    );
    final imageSelected = await (imageCompleter.future);
    imageSelected;
  }
}
