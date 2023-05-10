//AmzdTLWWCDCKLzY2OlZPYHbdQCgU
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchView extends StatefulWidget {
  const SearchView({Key? key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<dynamic> _locations = [];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Locations Demo'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _locations.isNotEmpty
              ? ListView.builder(
                  itemCount: _locations.length,
                  itemBuilder: (context, index) {
                    final location = _locations[index];
                    return ListTile(
                      title: Text(location['name']),
                      subtitle: Text(location['address']),
                      trailing: Text(location['rating'].toString()),
                    );
                  },
                )
              : Center(child: Text('No nearby locations found.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getNearbyLocations();
        },
        tooltip: 'Get Nearby Locations',
        child: Icon(Icons.location_searching),
      ),
    );
  }

  Future<void> _getNearbyLocations() async {
    setState(() {
      _isLoading = true;
    });

    final String url =
        'https://travel-advisor.p.rapidapi.com/locations/v2/list-nearby?currency=USD&units=km&lang=en_US';

    final Map<String, dynamic> requestBody = {
      "contentId": "cc8fc7b8-88ed-47d3-a70e-0de9991f6604",
      "contentType": "restaurant",
      "filters": [
        {
          "id": "placetype",
          "value": ["hotel", "attraction", "restaurant"]
        },
        {
          "id": "minRating",
          "value": ["30"]
        }
      ],
      "boundingBox": {
        "northEastCorner": {
          "latitude": 12.248278039408776,
          "longitude": 109.1981618106365
        },
        "southWestCorner": {
          "latitude": 12.243407232845051,
          "longitude": 109.1921640560031
        }
      }
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'X-Rapidapi-Key':
              '6a3a0baff2msh05f49bd272224dbp1d3a4cjsn2c4f673b3b04',
          'X-Rapidapi-Host': 'travel-advisor.p.rapidapi.com',
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final nearbyLocations = data['data'] ?? [];

        setState(() {
          _locations = nearbyLocations;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to get nearby locations.');
      }
    } catch (error) {
      setState(() {
        _locations = [];
        _isLoading = false;
      });
    }
  }
}
