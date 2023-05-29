// import 'package:expenses/doctor_list.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:doc_on_call/models/screens/doctor_location_screen2.dart';
import 'package:doc_on_call/screens/details/doctor_location_screen.dart';

class DoctorDetailScreen extends StatefulWidget {
  // const DoctorDetailScreen ({Key key, required this.doctors}) : super(key:key);

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  var data;
  Future<void> getDocApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Doctor Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getDocApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color.fromARGB(19, 28, 20, 20),
                        child: Column(
                          children: [
                            ReusableRow(
                              title: 'Dr. ',
                              value: data[index]['name'].toString(),
                            ),
                            ReusableRow(
                              title: 'Phone number: ',
                              value: data[index]['phone'].toString(),
                            ),
                            ReusableRow(
                              title: 'Website: ',
                              value: data[index]['website'].toString(),
                            ),
                            ReusableRow(
                              title: 'City: ',
                              value: data[index]['address']['city'].toString(),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.purpleAccent),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return const CurrentLocationScreen();
                                    },
                                  ),
                                );
                              },
                              child: const Text('Location'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Color.fromARGB(255, 232, 6, 6),
                fontWeight: FontWeight.bold),
          ),
          Text(
            value,
          ),
        ],
      ),
    );
  }
}
