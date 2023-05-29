// import 'package:flutter/material.dart';
// import 'package:doc_on_call/models/doctor_detail.dart';
// import './item_card.dart';
// import 'package:doc_on_call/models/screens/doctor_location_screen2.dart';
// import 'package:doc_on_call/models/doctor_detail_screen.dart';

// class Bodydoc extends StatelessWidget {
//   // const Body({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: doctors.length,
//             itemBuilder: (context, index) => ItemCard(
//               doctor: doctors[index],
//               press: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DoctorLocationScreen(
//                     doctor: doctors[index],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
