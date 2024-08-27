import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pick_svg_controller.g.dart';

@riverpod
class PickSvgController extends _$PickSvgController {
  @override
  void build() {}

  Future<String?> pickSVGFile() async {
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
}
