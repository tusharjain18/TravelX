//AIzaSyCSNW7Pt4PQZ7qxeT6rrTAQoBqpcw51KBE
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/constants/route.dart';
import 'package:travel_app/main.dart';
import 'package:travel_app/views/search_view.dart';

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
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 27,
                        backgroundImage: AssetImage("assets/travel.png"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      RichText(
                          text: const TextSpan(
                              text: "Hi",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                              ),
                              children: [
                            TextSpan(
                                text: ",Traveller",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: Colors.blueGrey))
                          ]))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(100),
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SearchTextField(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          10,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Stack(
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/destination${index + 1}.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.6)
                                        ],
                                      ),
                                    ),
                                    child: AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      opacity: 1.0,
                                      curve: Curves.easeInOut,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withOpacity(0.6)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchView()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: const [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            //  SizedBox(width: 3),
            Text(
              'Search for hotels and flights       ',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.yellow,
              child: Icon(
                Icons.sort_by_alpha_sharp,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
