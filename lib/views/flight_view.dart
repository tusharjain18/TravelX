import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Flight {
  final String originStationCode;
  final String destinationStationCode;
  final String departureDateTime;
  final String arrivalDateTime;
  final String classOfService;
  final String marketingCarrierCode;
  final String operatingCarrierCode;
  final String equipmentId;
  final String? imageUrl;

  Flight({
    required this.originStationCode,
    required this.destinationStationCode,
    required this.departureDateTime,
    required this.arrivalDateTime,
    required this.classOfService,
    required this.marketingCarrierCode,
    required this.operatingCarrierCode,
    required this.equipmentId,
    this.imageUrl,
  });
}

class FlightView extends StatefulWidget {
  const FlightView({Key? key}) : super(key: key);

  @override
  _FlightViewState createState() => _FlightViewState();
}

class _FlightViewState extends State<FlightView> {
  TextEditingController _sourceAirportController = TextEditingController();
  TextEditingController _destinationAirportController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _returnDateController = TextEditingController();
  TextEditingController _numAdultsController = TextEditingController();
  TextEditingController _numSeniorsController = TextEditingController();
  TextEditingController _classOfServiceController = TextEditingController();
  TextEditingController _currencyCodeController = TextEditingController();

  List<Flight> _flights = [];

  void searchFlights() async {
    String url =
        'https://tripadvisor16.p.rapidapi.com/api/v1/flights/searchFlights';
    Map<String, String> queryParams = {
      'sourceAirportCode': _sourceAirportController.text,
      'destinationAirportCode': _destinationAirportController.text,
      'date': _dateController.text,
      'itineraryType': 'ROUND_TRIP',
      'sortOrder': 'PRICE',
      'numAdults': _numAdultsController.text,
      'numSeniors': _numSeniorsController.text,
      'classOfService': _classOfServiceController.text,
      'returnDate': _returnDateController.text,
      'pageNumber': '1',
      'currencyCode': _currencyCodeController.text,
    };

    Uri uri = Uri.parse(url).replace(queryParameters: queryParams);

    Map<String, String> headers = {
      'X-RapidAPI-Key': '6a3a0baff2msh05f49bd272224dbp1d3a4cjsn2c4f673b3b04',
      'X-RapidAPI-Host': 'tripadvisor16.p.rapidapi.com',
    };

    try {
      var response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var flightsData = jsonResponse['data']['flights'];

        List<Flight> flights = [];

        for (var flightData in flightsData) {
          var segments = flightData['segments'];
          var segment = segments[0];
          var legs = segment['legs'];
          var leg = legs[0];

          var originStationCode = leg['originStationCode'];

          var destinationStationCode = leg['destinationStationCode'];
          var departureDateTime = leg['departureDateTime'];
          var arrivalDateTime = leg['arrivalDateTime'];
          var classOfService = leg['classOfService'];
          var marketingCarrierCode = leg['marketingCarrierCode'];
          var operatingCarrierCode = leg['operatingCarrierCode'];
          var equipmentId = leg['equipmentId'];

          var marketingCarrier = leg['marketingCarrier'];
          var logoUrl = marketingCarrier['logoUrl'];

          var flight = Flight(
            originStationCode: originStationCode,
            destinationStationCode: destinationStationCode,
            departureDateTime: departureDateTime,
            arrivalDateTime: arrivalDateTime,
            classOfService: classOfService,
            marketingCarrierCode: marketingCarrierCode,
            operatingCarrierCode: operatingCarrierCode,
            equipmentId: equipmentId,
            imageUrl: logoUrl,
          );

          flights.add(flight);
        }

        setState(() {
          _flights = flights;
        });
      } else {
        setState(() {
          _flights = [];
        });
      }
    } catch (e) {
      setState(() {
        _flights = [];
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
                controller: _sourceAirportController,
                decoration: InputDecoration(labelText: 'Source Airport Code'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _destinationAirportController,
                decoration:
                    InputDecoration(labelText: 'Destination Airport Code'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _returnDateController,
                decoration:
                    InputDecoration(labelText: 'Return Date (YYYY-MM-DD)'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _numAdultsController,
                decoration: InputDecoration(labelText: 'Number of Adults'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _numSeniorsController,
                decoration: InputDecoration(labelText: 'Number of Seniors'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _classOfServiceController,
                decoration: InputDecoration(labelText: 'Class of Service'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _currencyCodeController,
                decoration: InputDecoration(labelText: 'Currency Code'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: searchFlights,
                child: Text('Search Flight'),
              ),
              SizedBox(height: 20),
              if (_flights.isNotEmpty)
                Column(
                  children: _flights.map((flight) {
                    return Card(
                      child: ListTile(
                        leading: flight.imageUrl != null
                            ? Image.network(flight.imageUrl!)
                            : null,
                        title: Text(
                          flight.originStationCode +
                              ' to ' +
                              flight.destinationStationCode,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              'Departure: ' + flight.departureDateTime,
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Arrival: ' + flight.arrivalDateTime,
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Class of Service: ' + flight.classOfService,
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Marketing Carrier: ' +
                                  flight.marketingCarrierCode,
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Operating Carrier: ' +
                                  flight.operatingCarrierCode,
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Equipment ID: ' + flight.equipmentId,
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              if (_flights.isEmpty && _sourceAirportController.text.isNotEmpty)
                Text(
                  'No flights found.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
