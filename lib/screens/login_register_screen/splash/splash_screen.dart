import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:doc_on_call/screens/login_register_screen/splash/splash_screen_next.dart';
import 'package:flutter/material.dart';
import './splash_services.dart';

class SplashScreen extends StatefulWidget {
  // const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          splash: 'assets/images/doctorImage.jpg',
          backgroundColor: Colors.purpleAccent,
          splashIconSize: 250,
          nextScreen: SplashScreenNext(),
          duration: 2500,
          // animationDuration: const Duration(seconds: 1),
          splashTransition: SplashTransition.fadeTransition
          // pageTransitionType: PageTransitionType.leftToRight,
          ),
      // body: Center(
      //   child: Text(
      //     'Welcome to\nDocOnCall',
      //     style: TextStyle(
      //       fontSize: 30,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black54,
      //     ),
      //   ),
      // ),
    );
  }
}
