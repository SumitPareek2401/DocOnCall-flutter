// import 'package:flutter/material.dart';
// import 'package:doc_on_call/models/doctor_detail.dart';

// class ItemCard extends StatelessWidget {
//   List<Doctor> doclen = [];
//   final Doctor doctor;
//   final Function press;
//   ItemCard({
//     Key key,
//     this.doctor,
//     this.press,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: ListView(
//         // return ListView(
//         // children: [
//         children: [
//           Card(
//             // margin: const EdgeInsets.only(top: 4),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       color: const Color.fromARGB(31, 8, 38, 235),
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         doctor.docname,
//                         style: Theme.of(context).textTheme.headline4.copyWith(
//                             color: const Color.fromARGB(255, 241, 6, 6),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   color: const Color.fromARGB(96, 139, 3, 3),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(
//                           doctor.profession,
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline6
//                               .copyWith(color: Colors.black45),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 24),
//                         child: Text(
//                           "FEES: ${doctor.fees}",
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline6
//                               .copyWith(color: Colors.black54),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   color: Colors.black26,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 110,
//                     ),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: const Color.fromARGB(0, 7, 7, 86),
//                       ),
//                       onPressed: () {
//                         press;
//                       },
//                       child: const Text(
//                         "Tap to see doc location",
//                         style: TextStyle(color: Colors.black54),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
