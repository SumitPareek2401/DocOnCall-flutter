import 'package:doc_on_call/screens/home/home_screen.dart';
import 'package:doc_on_call/screens/login_register_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashServicesNext {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      Timer(
        const Duration(seconds: 1),
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        ),
      );
    } else {
      Timer(
        const Duration(seconds: 1),
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyLogin(),
          ),
        ),
      );
    }
  }
}
