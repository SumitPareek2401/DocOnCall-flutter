import 'package:flutter/material.dart';

class Categories2 extends StatelessWidget {
  // const Categories2({super.key});

  List<String> categories = [
    "Top Doctors",
    "Hospitals",
    "Medical Stores",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        // scrollDirection: Axis.horizontal,
        children: <Widget>[
          const SizedBox(width: 8),
          Stack(
            children: [
              Container(
                // child: Padding(
                // child: GestureDetector(onTap: () {
                //  (context) => BlankScreen();
                // }),
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/doctorImage.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 90),
                  child: Text(
                    'Doctors',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      backgroundColor: Color.fromARGB(255, 4, 9, 76),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          // padding: EdgeInsets.symmetric(
          //   horizontal: kDefaultPaddin,
          // ),
          // child: ListView.builder(
          //   itemCount: categories.length,
          //   itemBuilder: (context, index) => BlankScreen(),
          // ),
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/hospital.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/medicalStore.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
