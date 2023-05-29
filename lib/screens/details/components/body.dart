import 'package:doc_on_call/models/screens/body.dart';
import 'package:doc_on_call/screens/details/doctor_location_screen.dart';
import 'package:flutter/material.dart';
import '/constants.dart';
// import '/order_traking_page.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import './product_title_with_image.dart';
import '/models/product.dart';
import './description.dart';
import 'package:doc_on_call/models/doctor_detail_screen.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.35),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin * 2,
                    right: kDefaultPaddin * 2,
                  ),
                  // height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      // ColorAndSize(product: product),
                      // SizedBox(height: kDefaultPaddin / 2),
                      Description(product: product),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return CurrentLocationScreen();
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(66, 86, 13, 175),
                        ),
                        child: const Text("Nearby Best Doctors"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(66, 86, 13, 175),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return DoctorDetailScreen();
                              },
                            ),
                          );
                        },
                        child: const Text("Doctors"),
                      ),
                      // SizedBox(height: kDefaultPaddin / 2),
                      // CounterWithFavBtn(),
                      // SizedBox(height: kDefaultPaddin / 2),
                      // AddToCart(product: product),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
