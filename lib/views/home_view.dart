import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/constants/route.dart';
import 'package:travel_app/views/search_view.dart';

import '../main.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    await FirebaseAuth.instance.signOut();
                    // ignore: use_build_context_synchronously
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
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(children: [
            Row(
              children: [
                const CircleAvatar(
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
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        children: [
                      TextSpan(
                          text: ",Traveller",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ))
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
          ]),
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchView()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          // color: Colors.grey[300],
        ),
        child: Row(
          children: const [
            Icon(Icons.search),
            SizedBox(width: 10),
            Text(
              'Search for hotels and flights   ',
              style: TextStyle(fontSize: 15),
            ),
            CircleAvatar(
              radius: 22,
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
