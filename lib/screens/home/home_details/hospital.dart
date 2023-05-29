import 'package:flutter/material.dart';

class Hospital extends StatefulWidget {
  // const Hospital({super.key});

  @override
  State<Hospital> createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Hospitals'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
