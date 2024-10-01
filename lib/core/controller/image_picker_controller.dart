import 'dart:io';
import 'package:image_picker/image_picker.dart' as ip;
import 'package:laundry_bin/core/utils/snackbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_picker_controller.g.dart';

@riverpod
class ImagePicker extends _$ImagePicker {
  @override
  File? build() {
    return null;
  }

  final _picker = ip.ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ip.ImageSource.gallery,
    );

    if (pickedFile != null) {
      final fileExtension = pickedFile.path.split('.').last.toLowerCase();
      if (fileExtension == 'jpg' ||
          fileExtension == 'jpeg' ||
          fileExtension == 'png') {
        state = File(pickedFile.path);
      } else {
        SnackbarUtil.showsnackbar(message: "File type not supported");
      }
    }
  }
}
