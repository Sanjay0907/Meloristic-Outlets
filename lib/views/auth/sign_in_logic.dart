import 'package:buffer/views/auth/mobile_screen.dart';
import 'package:buffer/views/auth/signin_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/homepage.dart';

class SignInLogic extends StatelessWidget {
  const SignInLogic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const HomePage();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error Logging in'),
            );
          } else {
            return const SignInSignUp();
          }
        },
      ),
    );
  }
}
