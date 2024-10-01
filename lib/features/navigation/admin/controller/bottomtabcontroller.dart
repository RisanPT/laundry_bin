import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottomtabcontroller.g.dart';

@riverpod
class BottomTabController extends _$BottomTabController {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}
