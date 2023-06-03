import 'package:doc_on_call/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddDiseaseScreen extends StatefulWidget {
  const AddDiseaseScreen({super.key});

  @override
  State<AddDiseaseScreen> createState() => _AddDiseaseScreenState();
}

class _AddDiseaseScreenState extends State<AddDiseaseScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final descController = TextEditingController();
  final phoneController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref('Text');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        title: const Text(
          'Fill the form',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Medical Form:',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Your name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Age',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: genderController,
                        decoration: const InputDecoration(
                          hintText: 'Gender',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.account_box),
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: descController,
                        maxLines: 2,
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.account_box),
                          hintText: 'Explain your Disease,\nSymptoms',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: const Size(100, 50),
                  ),
                  onPressed: () {
                    String id =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    databaseRef
                        // .child('1')
                        .child(id)
                        .set({
                      'name': nameController.text.toString(),
                      'uid': id,
                      'age': ageController.text.toString(),
                      'gender': genderController.text.toString(),
                      'description': descController.text.toString(),
                      'phone': phoneController.text.toString(),
                    }).then((value) {
                      Utils().toastMessage('Form Submitted');
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
