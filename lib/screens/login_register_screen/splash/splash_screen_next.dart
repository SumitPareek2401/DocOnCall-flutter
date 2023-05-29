import 'package:flutter/material.dart';
import './splash_services_next.dart';

class SplashScreenNext extends StatefulWidget {
  // const SplashScreen({super.key});

  @override
  State<SplashScreenNext> createState() => _SplashScreenNextState();
}

class _SplashScreenNextState extends State<SplashScreenNext> {
  SplashServicesNext splashServices = SplashServicesNext();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'One who cares \n for your health',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
