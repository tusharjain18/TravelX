//RicXaLkvLr6iI25CrAGzUAAEF8nYu2ll
//S61AZWj8GLGe4npu
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final String apiKey = 'AIzaSyCcH9B_Ra-TdjXNhcp4Im7qFmWtOvp4334';
  final String country = 'India';

  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Hotels in $country'),
      ),
      body: GoogleMap(
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(20.5937, 78.9629),
          zoom: 4.0,
        ),
        markers: Set<Marker>.of(markers.values),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: searchHotels,
        child: Icon(Icons.search),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> searchHotels() async {
    const String apiUrl =
        'https://test.api.amadeus.com/v2/shopping/hotel-offers?';
    const String latitude = '28.7143953';
    const String longitude = '77.0909696';
    const String radius = '50'; // km
    const String currency = 'INR';
    const String checkInDate = '2023-04-01';
    const String checkOutDate = '2023-04-03';
    const String adults = '1';

    final String url =
        '$apiUrl&latitude=$latitude&longitude=$longitude&radius=$radius&currency=$currency&checkInDate=$checkInDate&checkOutDate=$checkOutDate&adults=$adults';

    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer RicXaLkvLr6iI25CrAGzUAAEF8nYu2ll',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['data'];

      if (results != null) {
        final MarkerId selectedMarker = MarkerId('selected');
        markers.clear();

        for (final result in results) {
          final lat = result['hotel']['latitude'];
          final lng = result['hotel']['longitude'];
          final latLng = LatLng(lat, lng);

          final markerId = MarkerId(result['hotel']['name']);
          final marker = Marker(
            markerId: markerId,
            position: latLng,
            onTap: () {
              mapController
                  .animateCamera(CameraUpdate.newLatLngZoom(latLng, 14.0));
              setState(() {
                Marker? myMarker; // use the null-aware type for the variable

                // assign a value to the variable using a null-aware operator
                myMarker ??= const Marker(
                  markerId: MarkerId('myMarker'),
                  position: LatLng(28.7143953, 77.0909696),
                  infoWindow: InfoWindow(title: 'My Marker'),
                );
              });
            },
          );

          markers[markerId] = marker;
        }
      }
    }
  }
}
