// import 'dart:js';

import 'package:doc_on_call/screens/details/disease_add/add_disease_screen.dart';
import 'package:flutter/material.dart';
import '/constants.dart';
import '/screens/AppDrawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './components/body.dart';

class HomeScreen extends StatelessWidget {
  // const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      // drawer: AppDrawer(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppDrawer(),
            ),
          );
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.add_circle,
            size: 30.9,
            color: Colors.black,
          ),
          // icon: SvgPicture.asset(
          //   "assets/icons/heart.svg",
          //   color: kTextColor,
          // ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddDiseaseScreen(),
              ),
            );
          },
        ),
        // IconButton(
        //   icon: SvgPicture.asset(
        //     "assets/icons/cart.svg",
        //     color: kTextColor,
        //   ),
        //   onPressed: () {},
        // ),
        const SizedBox(
          width: kDefaultPaddin / 2,
        ),
      ],
    );
  }
}
