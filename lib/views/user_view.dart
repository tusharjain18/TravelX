import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  late User _currentUser;
  bool themeDarkOrLightControl = false;
  int xmoney = 0; // add this line to declare xmoney variable

  void darkOrLight() {
    setState(() {
      themeDarkOrLightControl = !themeDarkOrLightControl;
    });
  }

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        _currentUser = currentUser;
        _isLoading = false;
        // increment xmoney by 5 every time user logs in
        xmoney += 5;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeDarkOrLightControl ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
          title: const Text(
            'User Info',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: themeDarkOrLightControl
                  ? Icon(Icons.dark_mode)
                  : Icon(Icons.light_mode),
              onPressed: darkOrLight,
            ),
          ],
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                _currentUser.photoURL ??
                                    'https://www.gravatar.com/avatar/?d=mp',
                              ),
                            ),
                            border: Border.all(
                              // color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _currentUser.displayName ?? '',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _currentUser.email ?? '',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Phone Number',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _currentUser.phoneNumber ?? '',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'xmoney',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$xmoney',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
