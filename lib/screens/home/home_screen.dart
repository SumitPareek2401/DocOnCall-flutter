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
      appBar: buildAppBar(),
      body: Body(),
      drawer: AppDrawer(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // leading: IconButton(
      //   icon: SvgPicture.asset("assets/icons/back.svg"),
      //   onPressed: () {
      //     AppDrawer();
      //   },
      // ),
      actions: <Widget>[         
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search (1).svg",
            color: kTextColor,
          ),
          onPressed: () {},
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
