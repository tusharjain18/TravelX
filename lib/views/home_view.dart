//AIzaSyCSNW7Pt4PQZ7qxeT6rrTAQoBqpcw51KBE

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/constants/route.dart';
import 'package:travel_app/main.dart';
import 'dart:async';

import 'package:travel_app/views/locatiob.dart';
import 'package:travel_app/views/images.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ThemeMode _themeMode = ThemeMode.system;
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  int _selectedIndex = 0;
  late PageController _controller;
  double _rotateY = 0.0;
  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: .7,
    );
    super.initState();
    _pageController = PageController(initialPage: 0);
    _controller.addListener(() {
      var currentPosition = _controller.page ?? 0;
      var converted = currentPosition % 1; // to get value 0 - 1
      if (converted >= 0.5) {
        converted = 1 - converted;
      }
      setState(() {
        _rotateY = converted;
      });
    });
    bool forward = true;
    //we will scroll every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (forward) {
        if (_selectedIndex < 9) {
          _selectedIndex++;
        } else {
          forward = false;
        }
      }
      if (!forward) {
        if (_selectedIndex <= 9 && _selectedIndex > 0) {
          _selectedIndex--;
        } else {
          forward = true;
        }
      }
      _controller.animateToPage(_selectedIndex,
          duration: const Duration(milliseconds: 1200), curve: Curves.easeIn);
    });
  }

  final TextEditingController _searchController = TextEditingController();
  final List<String> _destinations = [
    'assets/images/destination1.jpg',
    'assets/images/destination2.jpg',
    'assets/images/destination3.jpg',
    'assets/images/destination4.jpg',
    'assets/images/destination5.jpg',
    'assets/images/destination6.jpg',
    'assets/images/destination7.jpg',
    'assets/images/destination8.jpg',
    'assets/images/destination9.jpg',
    'assets/images/destination10.jpg',
  ];
  late final PageController _pageController;

  int _selectedThemeIndex = 0;
  final List<ThemeData> _themeList = [
    ThemeData.light(),
    ThemeData.dark(),
    ThemeData(
      primarySwatch: Colors.deepPurple,
      accentColor: Colors.deepPurpleAccent,
      scaffoldBackgroundColor: Colors.deepPurple[50],
    ),
    ThemeData(
      primarySwatch: Colors.indigo,
      accentColor: Colors.indigoAccent,
      scaffoldBackgroundColor: Colors.indigo[50],
    ),
    ThemeData(
      primarySwatch: Colors.blue,
      accentColor: Colors.blueAccent,
      scaffoldBackgroundColor: Colors.blue[50],
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        theme: _themeList[_selectedThemeIndex],
        themeMode: _themeMode,
        home: Scaffold(
          appBar: AppBar(
            actions: [
              PopupMenuButton<MenuAction>(
                onSelected: (value) async {
                  switch (value) {
                    case MenuAction.logout:
                      final shouldLogout = await showLogOutDialog(context);
                      if (shouldLogout) {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          loginRoute,
                          (_) => false,
                        );
                      }
                  }
                },
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem<MenuAction>(
                      value: MenuAction.logout,
                      child: Text('Log Out'),
                    ),
                  ];
                },
              ),
              IconButton(
                icon: _themeList[_selectedThemeIndex].brightness ==
                        Brightness.light
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode),
                onPressed: () {
                  setState(() {
                    _selectedThemeIndex =
                        (_selectedThemeIndex + 1) % _themeList.length;
                  });
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search, size: 35.0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * .15),
                    child: const Text(
                      'Find your\nnext vacation',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .6,
                    child: PageView.builder(
                      itemCount: locations.length,
                      controller: _controller,
                      onPageChanged: (value) {
                        setState(() {
                          _selectedIndex = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        Location location = locations[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY(_rotateY),
                            child: ImageCard(
                              size: size,
                              location: location,
                              isSelected:
                                  index == _selectedIndex ? true : false,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
