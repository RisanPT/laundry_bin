import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_bottom_navigation_controller.g.dart';

@riverpod
class UserBottomNavigationController extends _$UserBottomNavigationController {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}
