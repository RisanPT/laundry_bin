import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'svg_pick.controller.g.dart';

@riverpod
class SvgPicker extends _$SvgPicker {
  @override
  File? build() {
    return null;
  }

  Future<String?> pickSvgFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['svg'],
      );
      if (result != null) {
        return result.files.single.path;
      } else {
        return null;
      }
    } catch (e) {
      // Handle any exceptions here
      print('Error picking SVG file: $e');
    }
    return null;
  }
}
