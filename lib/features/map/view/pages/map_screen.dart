import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:laundry_bin/features/map/controller/map_providers.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  GoogleMapController? _mapController;
  List<Placemark> _searchResults = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LatLng currentPosition = ref.watch(locationProvider);
    final Set<Marker> markers = ref.watch(markersProvider);

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentPosition,
              zoom: 14.0,
            ),
            markers: markers,
            onMapCreated: (controller) {
              _mapController = controller;
              // Use onCameraMove to detect when the map is moved
              // {{ edit_1 }}
            },
            // onCameraMove: (CameraPosition position) {
            //   LatLng newPosition = position.target; // Get the new position
            //   ref.read(locationProvider.notifier).state =
            //       newPosition; // Update location provider

            //   // Update the current location marker to red
            //   final currentLocationMarker = Marker(
            //     markerId: const MarkerId('current_location'),
            //     position: newPosition, // Update position to newPosition
            //     infoWindow: const InfoWindow(title: ''),
            //   );

            //   // Update the markers state to include the current location marker
            //   ref.read(markersProvider.notifier).state = {
            //     ...markers, // Keep existing markers
            //     currentLocationMarker, // Add the updated current location marker
            //   };
            // },
            onTap: (tappedLocation) async {
              // Fetch the address for the tapped location
              List<Placemark> placemarks = await placemarkFromCoordinates(
                tappedLocation.latitude,
                tappedLocation.longitude,
              );

              String address = 'Unknown Location';
              if (placemarks.isNotEmpty) {
                Placemark placemark = placemarks.first;
                address =
                    '${placemark.street}, ${placemark.locality}, ${placemark.country}';
              }

              // Update the marker and location provider state
              ref.read(markersProvider.notifier).state = {
                Marker(
                  markerId: MarkerId(tappedLocation.toString()),
                  position: tappedLocation,
                  infoWindow: InfoWindow(title: address),
                  // icon: BitmapDescriptor.defaultMarkerWithHue(
                  //     BitmapDescriptor.hueRed),
                ),
              };

              ref.read(locationProvider.notifier).state =
                  tappedLocation; // Update location provider state
            },
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
          ),
          Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Column(children: [
                  TextField(
                    controller: _searchController, // {{ edit_4 }}
                    onChanged: (value) async {
                      // {{ edit_5 }}
                      if (value.isNotEmpty) {
                        try {
                          List<Location> locations =
                              await locationFromAddress(value);
                          _searchResults =
                              await Future.wait(locations.map((location) async {
                            List<Placemark> placemarks =
                                await placemarkFromCoordinates(
                              location.latitude,
                              location.longitude,
                            );
                            return placemarks.first; // Get the first Placemark
                          }));
                          setState(() {}); // Refresh the UI with search results
                        } catch (e) {}
                      } else {
                        _searchResults
                            .clear(); // Clear results if input is empty
                      }
                    },
                    onSubmitted: (value) async {
                      // Handle submission if needed
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: "Search for your location",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),

                  // Wrap ListView in a Container with a fixed height

                  if (_searchResults.isNotEmpty)

                    // Show ListView only if there are results
                    Container(
                      height: MediaQuery.of(context).size.height * .15,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.black),
                          color: Colors
                              .transparent), // Set a fixed height for the search results
                      child: ListView.builder(
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final placemark = _searchResults[index];
                          return ListTile(
                            title: Text(placemark.name ??
                                'Unknown Location'), // Display location name
                            subtitle: Text(
                              '${placemark.street}, ${placemark.locality}, ${placemark.country}', // Optional: Display more details
                            ),
                            onTap: () async {
                              try {
                                // Define locations here to avoid undefined error
                                List<Location> locations =
                                    await locationFromAddress(
                                        _searchController.text); // {{ edit_1 }}
                                if (locations.isNotEmpty) {
                                  // Check if locations are found
                                  Location location = locations[
                                      index]; // Get the corresponding Location
                                  LatLng newLocation = LatLng(
                                    location.latitude, // {{ edit_1 }}
                                    location.longitude, // {{ edit_1 }}
                                  );
                                  _mapController?.animateCamera(
                                      CameraUpdate.newLatLng(newLocation));
                                  _searchController
                                      .clear(); // Clear search field
                                  _searchResults
                                      .clear(); // Clear search results
                                  setState(() {}); // Refresh the UI
                                } else {
                                  // Handle case when no locations are found
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'No results found for the address.')),
                                  );
                                }
                              } catch (e) {
                                // Handle any exceptions
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Error: ${e.toString()}')),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                ]),
              )),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                log("Location confirmed: $currentPosition");
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                "Confirm",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
