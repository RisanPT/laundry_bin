import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_bin/features/orders/user/controller/washing_state.dart';

class WashingNotifier extends StateNotifier<WashingState> {
  WashingNotifier() : super(WashingState());

  void addItem(String name, int price) {
    final newItemCount = (state.items[name] ?? 0) + 1;
    state = state.copyWith(
      totalPrice: state.totalPrice + price,
      itemCount: state.itemCount + 1,
      items: {
        ...state.items,
        name: newItemCount,
      },
    );
  }

  void removeItem(String name, int price) {
    final currentQuantity = state.items[name] ?? 0;
    if (currentQuantity > 0) {
      final newItemCount = currentQuantity - 1;
      state = state.copyWith(
        totalPrice: state.totalPrice - price,
        itemCount: state.itemCount - 1,
        items: {
          ...state.items,
          if (newItemCount >= 0) name: newItemCount,
        },
      );
    }
  }
}
