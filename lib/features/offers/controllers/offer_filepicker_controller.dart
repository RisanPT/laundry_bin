import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_bin/features/offers/domain/offer_model_2.dart';

// Define a StateNotifier for the picked file path
class PickedFilePathNotifier extends StateNotifier<List<OfferModel2>> {
  PickedFilePathNotifier() : super([]);

  void addFilePath(OfferModel2 filePath) {
    state = [...state, filePath];
  }

  void removeFilePath(OfferModel2 filePath) {
    state = state.where((element) => element != filePath).toList();
  }
  
}

// Create a provider for the StateNotifier
final pickedFilePathProvider =
    StateNotifierProvider<PickedFilePathNotifier, List<OfferModel2>>(
        (ref) => PickedFilePathNotifier());
