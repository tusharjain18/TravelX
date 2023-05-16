import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "CODE",
              style: TextStyle(
                  fontFamily: 'RobotMono',
                  fontWeight: FontWeight.bold,
                  fontSize: 80),
            ),
            Text(
              "VERIFICATION".toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 40,
            ),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.blue.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                print("OTP is : $code");
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("NEXT"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
