import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_box_controller.g.dart';

@riverpod
class CheckBoxController extends _$CheckBoxController {
  @override
  List<bool> build(int length) {
    return List.filled(length, false);
  }

  void toggle(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) !state[i] else state[i],
    ];
  }
}
