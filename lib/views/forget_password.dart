import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/views/mail.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPassswordMail extends StatelessWidget {
  const ForgetPassswordMail({super.key});

  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final auth = FirebaseAuth.instance;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Mail(
                image: 'assets/pass.png',
                title: "Reset Password",
                crossAxisAlignment: CrossAxisAlignment.center,
                heightBetween: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                        label: Text("Email"),
                        hintText: "Email",
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          auth
                              .sendPasswordResetEmail(
                                  email: emailcontroller.text.toString())
                              .then((value) {
                            Utils().toastMessage(
                                'We have sent you email to recover password, please check email');
                          }).onError((error, stackTrace) {
                            Utils().toastMessage(error.toString());
                          });
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OTPScreen())
                                  );*/
                        },
                        child: const Text("Next"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class Utils {
  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
