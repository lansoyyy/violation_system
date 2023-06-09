import 'package:flutter/material.dart';
import 'package:violation_system/screens/auth/officer/office_login.dart';
import 'package:violation_system/widgets/button_widget.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 150,
              width: 320,
            ),

            const SizedBox(
              height: 100,
            ),
            ButtonWidget(
              label: 'Get Started',
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const OfficerLogin()));
              },
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ButtonWidget(
            //   label: 'Continue as Admin',
            //   onPressed: () {
            //     Navigator.of(context).pushReplacement(
            //         MaterialPageRoute(builder: (context) => AdminLogin()));
            //   },
            // ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
