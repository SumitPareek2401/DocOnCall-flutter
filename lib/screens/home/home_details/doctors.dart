import 'package:flutter/material.dart';

class Doctors extends StatefulWidget {
  // const Hospital({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Doctors'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
