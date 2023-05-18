import 'package:doc_on_call/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import './screens/home/home_screen.dart';
import './screens/login_register_screen/login_screen.dart';
import './screens/login_register_screen/register_screen.dart';
import 'models/screens/body.dart';

void main() {
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
      home: HomeScreen(),
      // home: Body(),
    );
  }
}
