import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_bin/features/orders/user/controller/washing_notiefier.dart';
import 'package:laundry_bin/features/orders/user/controller/washing_state.dart';

final washingPro = StateNotifierProvider<WashingNotifier, WashingState>((ref) {
  return WashingNotifier();
});
