import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchView extends StatefulWidget {
  const SearchView({super.key, Key? k});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController _locationController = TextEditingController();
  String locationData = '';

  List<LocationData> parsedLocationData = [];

  void searchLocation() async {
    var query = _locationController.text;
    var url = Uri.parse(
        'https://tripadvisor16.p.rapidapi.com/api/v1/hotels/searchLocation');
    var queryParameters = {'query': query};

    var headers = {
      'X-RapidAPI-Key': '6a3a0baff2msh05f49bd272224dbp1d3a4cjsn2c4f673b3b04',
      'X-RapidAPI-Host': 'tripadvisor16.p.rapidapi.com',
    };

    var response = await http.get(
      url.replace(queryParameters: queryParameters),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData['data'];

      List<LocationData> locations = [];
      for (var item in data) {
        var title = item['title'] as String? ?? '';
        var secondaryText = item['secondaryText'] as String? ?? '';
        var image = item['image'];
        var urlTemplate =
            image != null ? image['urlTemplate'] as String? : null;

        if (urlTemplate != null) {
          // Replace {width} and {height} with actual values
          urlTemplate = urlTemplate
              .replaceAll('{width}', '500')
              .replaceAll('{height}', '300');
        }

        // Remove <b> tags from the title
        title = title.replaceAll('<b>', '').replaceAll('</b>', '');

        locations.add(
          LocationData(
            title: title,
            secondaryText: secondaryText,
            urlTemplate: urlTemplate,
          ),
        );
      }

      setState(() {
        parsedLocationData = locations;
      });
    } else {
      // Request failed, handle the error
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Enter Location',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: searchLocation,
              child: Text('Search'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: parsedLocationData.map((location) {
                    return ListTile(
                      title: Text(
                        location.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(location.secondaryText),
                          if (location.urlTemplate != null)
                            SizedBox(
                              height: 200,
                              child: Image.network(
                                location.urlTemplate!,
                                fit: BoxFit.cover,
                              ),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationData {
  final String title;
  final String secondaryText;
  final String? urlTemplate;

  LocationData({
    required this.title,
    required this.secondaryText,
    this.urlTemplate,
  });
}
  /*
  TextEditingController sourceAirportController = TextEditingController();
  TextEditingController destinationAirportController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController returnDateController = TextEditingController();
  TextEditingController numAdultsController = TextEditingController();
  TextEditingController numSeniorsController = TextEditingController();
  TextEditingController classOfServiceController = TextEditingController();
  TextEditingController currencyCodeController = TextEditingController();

  String flightSearchResult = '';

  void searchFlight() async {
    String url =
        'https://tripadvisor16.p.rapidapi.com/api/v1/flights/searchFlights';
    Map<String, String> queryParams = {
      'sourceAirportCode': sourceAirportController.text,
      'destinationAirportCode': destinationAirportController.text,
      'date': dateController.text,
      'itineraryType': 'ROUND_TRIP',
      'sortOrder': 'PRICE',
      'numAdults': numAdultsController.text,
      'numSeniors': numSeniorsController.text,
      'classOfService': classOfServiceController.text,
      'returnDate': returnDateController.text,
      'pageNumber': '1',
      'currencyCode': currencyCodeController.text,
    };

    Uri uri = Uri.parse(url).replace(queryParameters: queryParams);

    Map<String, String> headers = {
      'X-RapidAPI-Key': '6a3a0baff2msh05f49bd272224dbp1d3a4cjsn2c4f673b3b04',
      'X-RapidAPI-Host': 'tripadvisor16.p.rapidapi.com'
    };

    try {
      var response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        setState(() {
          flightSearchResult = jsonResponse.toString();
        });
      } else {
        setState(() {
          flightSearchResult =
              'Request failed with status: ${response.statusCode}.';
        });
      }
    } catch (e) {
      setState(() {
        flightSearchResult = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight Search'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: sourceAirportController,
                decoration: InputDecoration(labelText: 'Source Airport Code'),
              ),
              TextField(
                controller: destinationAirportController,
                decoration:
                    InputDecoration(labelText: 'Destination Airport Code'),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
              ),
              TextField(
                controller: returnDateController,
                decoration:
                    InputDecoration(labelText: 'Return Date (YYYY-MM-DD)'),
              ),
              TextField(
                controller: numAdultsController,
                decoration: InputDecoration(labelText: 'Number of Adults'),
              ),
              TextField(
                controller: numSeniorsController,
                decoration: InputDecoration(labelText: 'Number of Seniors'),
              ),
              TextField(
                controller: classOfServiceController,
                decoration: InputDecoration(labelText: 'Class of Service'),
              ),
              TextField(
                controller: currencyCodeController,
                decoration: InputDecoration(labelText: 'Currency Code'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: searchFlight,
                child: Text('Search Flight'),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                child: Text(
                  flightSearchResult,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/