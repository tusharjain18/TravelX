//RicXaLkvLr6iI25CrAGzUAAEF8nYu2ll
//S61AZWj8GLGe4npu
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController _destinationController = TextEditingController();
  TextEditingController _checkInController = TextEditingController();
  TextEditingController _checkOutController = TextEditingController();
  TextEditingController _guestsController = TextEditingController();

  List<dynamic> _hotels = [];

  void _searchHotels() async {
    String destination = _destinationController.text;
    String checkIn = _checkInController.text;
    String checkOut = _checkOutController.text;
    String guests = _guestsController.text;

    String url =
        'https://test.api.amadeus.com/v2/shopping/hotel-offers?cityCode=$destination&checkInDate=$checkIn&checkOutDate=$checkOut&adults=$guests';

    Map<String, String> headers = {
      'Authorization': 'Bearer RicXaLkvLr6iI25CrAGzUAAEF8nYu2ll',
      'Content-Type': 'application/json'
    };

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      setState(() {
        _hotels = json.decode(response.body)['data'];
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Search'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _destinationController,
              decoration: InputDecoration(
                labelText: 'Destination',
              ),
            ),
            TextField(
              controller: _checkInController,
              decoration: InputDecoration(
                labelText: 'Check-in Date',
              ),
            ),
            TextField(
              controller: _checkOutController,
              decoration: InputDecoration(
                labelText: 'Check-out Date',
              ),
            ),
            TextField(
              controller: _guestsController,
              decoration: InputDecoration(
                labelText: 'Number of Guests',
              ),
            ),
            ElevatedButton(
              onPressed: _searchHotels,
              child: Text('Search'),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _hotels.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_hotels[index]['hotel']['name']),
                  subtitle:
                      Text(_hotels[index]['hotel']['address']['lines'][0]),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HotelBookingScreen(hotel: _hotels[index]),
                        ),
                      );
                    },
                    child: Text('Book'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HotelBookingScreen extends StatefulWidget {
  final dynamic hotel;

  HotelBookingScreen({required this.hotel});

  @override
  _HotelBookingScreenState createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  void _completeBooking() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;

// Send booking request to Amadeus API

// Navigate back to search screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hotel['hotel']['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            ),
            ElevatedButton(
              onPressed: _completeBooking,
              child: Text('Complete Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
