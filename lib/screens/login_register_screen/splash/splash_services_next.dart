import 'package:doc_on_call/screens/login_register_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashServicesNext {
  void isLogin(BuildContext context) {
    Timer(
      const Duration(seconds: 1),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyLogin(),
        ),
      ),
    );
  }
}
