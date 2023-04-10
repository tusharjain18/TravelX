//hhhhXQDcY5eSQB4pLSsQLSukDjoeWGvY
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchView extends StatefulWidget {
  const SearchView({Key? key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _httpClient = http.Client();
  final _hotels = <Hotel>[];
  late String _cityCode;

  @override
  void initState() {
    super.initState();
    _cityCode = '';
    _fetchHotels();
  }

  Future<void> _fetchHotels() async {
    final response = await _httpClient.get(
      Uri.parse(
          'https://test.api.amadeus.com/v1/reference-data/locations/hotels/by-city?cityCode=$_cityCode&radius=5&radiusUnit=KM&hotelSource=ALL'),
      headers: {'Authorization': 'Bearer lD8JsfuuJRerhgfO5H57VaoGZFdA'},
    );
    if (response.statusCode == 200) {
      final hotelsJson = jsonDecode(response.body)['data'] as List<dynamic>;
      setState(() {
        _hotels.clear();
        _hotels.addAll(hotelsJson.map((json) => Hotel.fromJson(json)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'Enter a city name',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (value) => setState(() => _cityCode = value),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _fetchHotels,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _hotels.length,
        itemBuilder: (context, index) {
          final hotel = _hotels[index];
          return ListTile(
            title: Text(hotel.name),
            //    subtitle: Text(hotel.address),
            //  trailing: Text(hotel.phoneNumber),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _httpClient.close();
    super.dispose();
  }
}

class Hotel {
  final String name;

  Hotel({
    required this.name,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name'],
    );
  }
}
