import 'package:flutter/material.dart';

class MedicalStore extends StatefulWidget {
  // const Hospital({super.key});

  @override
  State<MedicalStore> createState() => _MedicalStoreState();
}

class _MedicalStoreState extends State<MedicalStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Medical Store'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
