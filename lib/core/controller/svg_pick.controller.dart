import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'svg_pick.controller.g.dart';



class SvgPicker {
  String? selectedSvgPath;

  Future<void> pickFileSvg() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
       
      );

      if (result != null && result.files.isNotEmpty) {
        selectedSvgPath = result.files.single.path;
      } else {
        selectedSvgPath = null;
      }
    } catch (e) {
      // Handle any exceptions here
      print('Error picking SVG file: $e');
    }
  }
}



@riverpod

SvgPicker svgPicker(SvgPickerRef ref){
  return SvgPicker();
}