import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_bin/features/offers/domain/offer_model.dart';
import 'package:laundry_bin/gen/assets.gen.dart';

final offerModelsProvider =
    StateNotifierProvider<OfferModelsNotifier, List<OfferModel>>((ref) {
  return OfferModelsNotifier();
});

class OfferModelsNotifier extends StateNotifier<List<OfferModel>> {
  OfferModelsNotifier() : super(_initialItems);

  static final List<OfferModel> _initialItems = [
    OfferModel(
        title: 'Item 1',
        icon: Assets.icons.iconWashingHomescreen,
        isSelected: true),
    OfferModel(
        title: 'Item 2',
        icon: Assets.icons.iconWashingHomescreen,
        isSelected: false),
    OfferModel(
        title: 'Item 1',
        icon: Assets.icons.iconWashingHomescreen,
        isSelected: true),
    OfferModel(
        title: 'Item 1',
        icon: Assets.icons.iconWashingHomescreen,
        isSelected: false),
    // Add more items as needed
  ];
  bool areAllSelected() {
    return state.isNotEmpty && state.every((item) => item.isSelected);
  }

  void toggleSelection(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          OfferModel(
            title: state[i].title,
            icon: state[i].icon,
            isSelected: !state[i].isSelected,
          )
        else
          state[i],
    ];
  }

  void allSelection() {
    final allSelected = state.every((item) => item.isSelected);
    state = [
      for (int i = 0; i < state.length; i++)
        OfferModel(
          title: state[i].title,
          icon: state[i].icon,
          isSelected: !allSelected,
        )
    ];
  }
}
