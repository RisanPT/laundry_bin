import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
//TODO Show Dialogue For Image Selection

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
                onPressed: () async {
                  final imagePicker = ImagePicker();
                  XFile? image =
                      await imagePicker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }
                  imageCompleter.complete(image);
                },
                label: const Text("Camera"),
                icon: const Icon(Icons.camera),
              ),
              TextButton.icon(
                onPressed: () async {
                  final imagePicker = ImagePicker();
                  XFile? image =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }
                  imageCompleter.complete(image);
                },
                label: const Text("Gallery"),
                icon: const Icon(Icons.image),
              )
            ]);
      },
    );
    final imageSelected = await (imageCompleter.future);
    imageSelected;
    return null;
  }
}

final imageProvider = StateProvider<XFile?>((ref) => null);
