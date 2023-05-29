import 'package:doc_on_call/screens/login_register_screen/splash/splash_screen_next.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SplashScreenNext(),
        ),
      ),
    );
  }
}
