import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapPage extends HookConsumerWidget {
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const LatLng googlelocation = LatLng(37.42796133580664, -122.085749655962);
    const CameraPosition initialCameraPosition =
        CameraPosition(target: googlelocation, zoom: 11.5);
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (
          GoogleMapController controller,
        ) {},
        initialCameraPosition: initialCameraPosition,
        mapType: MapType.normal,
      ),
    );
  }
}
