import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:travel_app/constants/route.dart';
import 'package:travel_app/views/login_view.dart';
import 'package:travel_app/views/travel_view.dart';
import '../utilities/show_error_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _phoneNo;
  late final TextEditingController _fullName;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _phoneNo = TextEditingController();
    _fullName = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/travel3.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcome to ",
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.yellow,
                        ),
                        children: [
                          TextSpan(
                            text: "TRAVELX",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Register to Continue",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: Container(
              height: 380,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Palette.textColor1,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "REGISTER",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Palette.activeColor,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _fullName,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            label: Text("Full Name"),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Full Name",
                            prefixIcon: Icon(
                              Icons.person_outline_rounded,
                            ),
                            hintStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          // style: const TextStyle(color: Colors.black),
                          controller: _email,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            label: Text("Email"),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email_outlined),
                            hintStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          controller: _password,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            label: Text("Password"),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            hintStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        LoginView(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  var begin = Offset(1.0, 0.0);
                                  var end = Offset.zero;
                                  var curve = Curves.easeInToLinear;
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text.rich(TextSpan(
                              text: "Already Sign Up? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: " Login In",
                                  style: TextStyle(color: Colors.blue),
                                )
                              ])),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 535,
            right: 0,
            left: 0,
            child: Center(
              child: GestureDetector(
                onTap: () async {
                  final email = _email.text;
                  final password = _password.text;
                  try {
                    final userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    final user = FirebaseAuth.instance.currentUser;
                    await user?.sendEmailVerification();
                    Navigator.of(context).pushNamed(verifyEmailRoute);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      await showErrorDialog(
                        context,
                        'weak password',
                      );
                    } else if (e.code == 'email-already-in-use') {
                      await showErrorDialog(
                        context,
                        'Email is already in use',
                      );
                    } else if (e.code == 'invalid-email') {
                      await showErrorDialog(
                        context,
                        'Invalid email entered',
                      );
                    } else {
                      await showErrorDialog(
                        context,
                        'Error ${e.code}',
                      );
                    }
                  } catch (e) {
                    await showErrorDialog(
                      context,
                      e.toString(),
                    );
                  }
                },
                child: Container(
                    height: 90,
                    width: 90,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.orange, Colors.red],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                spreadRadius: 2,
                                blurRadius: 20,
                                offset: Offset(0, 1))
                          ]),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        travelRoute,
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "OR",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextButton(
                      onPressed: () {
                        _googleSignIn.signIn().then((value) {
                          String userName = value!.displayName!;
                          String profilePicture = value!.photoUrl!;
                          String userEmail = value!.email;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TravelView()),
                          );
                        });
                      },
                      style: TextButton.styleFrom(
                        side: BorderSide(width: 1, color: Colors.grey),
                        minimumSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        primary: Colors.white,
                        backgroundColor: Palette.googleColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 5),
                          const Text("Google"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
