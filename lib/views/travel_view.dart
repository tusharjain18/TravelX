import 'package:flutter/material.dart';
import 'package:travel_app/views/contact_view.dart';
import 'package:travel_app/views/home_view.dart';
import 'package:travel_app/views/location_view.dart';
import 'package:travel_app/views/user_view.dart';

class TravelView extends StatefulWidget {
  const TravelView({super.key});

  @override
  _TravelViewState createState() => _TravelViewState();
}

class _TravelViewState extends State<TravelView> {
  int currentIndex = 0;
  final screens = [
    const HomeView(),
    const LocationView(),
    //const UserView(),
    const PlaceScreen(),
    const UserView(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Location',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.recommend_rounded),
              label: 'Recommended',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      );
}
