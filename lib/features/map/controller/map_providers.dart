import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:laundry_bin/features/map/constants/const.dart';

final locationProvider = StateProvider<LatLng>((ref) {
  return const LatLng(lan, lag); // Default position
});

final markersProvider = StateProvider<Set<Marker>>((ref) {
  return {
    Marker(
      markerId: MarkerId(ref.toString()),
    )
  };
});
