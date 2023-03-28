//64ea506b79ea929602bd259fc6f67224
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationView extends StatefulWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late GoogleMapController googleMapController;
  bool _zoomGesturesEnabled = true;
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(28.7144068, 77.0909803), zoom: 14);

  Set<Marker> markers = {};
  String temperature = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (LatLng latLng) async {
              // Reverse geocode the selected location to get its address
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  latLng.latitude, latLng.longitude);
              String address = placemarks.first.name ?? "";

              markers.clear();
              markers.add(Marker(
                  markerId: const MarkerId('selectedLocation'),
                  position: latLng,
                  infoWindow: InfoWindow(
                      title:
                          address))); // Use the address as the marker's title

              setState(() {});

              getTemperature(latLng.latitude, latLng.longitude);
            },
            padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
            zoomGesturesEnabled: _zoomGesturesEnabled,
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Temperature: $temperature',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _determinePosition();

          final GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));

          markers.clear();

          markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude),
              infoWindow: InfoWindow(
                title: 'Current Location',
                snippet: 'You are here',
              )));

          setState(() {
            zoomGesturesEnabled:
            !_zoomGesturesEnabled;
          });

          await getTemperature(position.latitude, position.longitude);
        },
        label: const Icon(Icons.location_searching_outlined),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  Future<void> getTemperature(double latitude, double longitude) async {
    final String apiKey = '64ea506b79ea929602bd259fc6f67224';
    final String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      final responseData = json.decode(response.body);
      setState(() {
        temperature = responseData['main']['temp'].toStringAsFixed(1) + "°C";
      });
    } catch (error) {
      print(error);
    }
  }
}
