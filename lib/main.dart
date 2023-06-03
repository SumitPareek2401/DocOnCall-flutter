import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:doc_on_call/screens/home/home_screen.dart';
import 'package:doc_on_call/screens/login_register_screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //   initialRoute: 'login',
      //   routes: {
      //   'login': (context) => const MyLogin(),
      //   'register': (context) => const MyRegister(),
      // },
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomeScreen(),
      home: SplashScreen(),
      // home: AnimatedSplashScreen(
      //   splash: SvgPicture.asset(
      //     'assets/icons/incognito.svg',
      //     width: 200,
      //     height: 200,
      //   ),
      //   duration: 3000,
      //   splashTransition: SplashTransition.fadeTransition,
      //   backgroundColor: Colors.blueAccent,
      //   nextScreen: HomeScreen(),
      // ),
      // home: Body(),
    );
  }
}
