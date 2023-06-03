import 'package:doc_on_call/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MedicalForm extends StatefulWidget {
  const MedicalForm({super.key});

  @override
  State<MedicalForm> createState() => _MedicalFormState();
}

class _MedicalFormState extends State<MedicalForm> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Text');
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Medical Form',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                final title = snapshot.child('name').value.toString();

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: ListTile(
                    title: Text(
                      "Name: ${snapshot.child('name').value.toString()}\nAge: ${snapshot.child('age').value.toString()}\nGender: ${snapshot.child('gender').value.toString()}\nDisease: ${snapshot.child('description').value.toString()}\nPhone Number: ${snapshot.child('phone').value.toString()}",
                    ),
                    trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              showMyDialog(
                                  title, snapshot.child('uid').value.toString());
                            },
                            leading: Icon(Icons.edit),
                            title: Text('Edit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showMyDialog(String title, String id) async {
    editController.text = title;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update'),
          content: Container(
            child: TextField(
              controller: editController,
              decoration: InputDecoration(hintText: 'Edit'),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ref.child(id).update({
                  'name': editController.text.toLowerCase(),
                  'age': editController.text.toLowerCase(),
                }).then(
                  (value) {
                    Utils().toastMessage('Updated');
                  },
                ).onError((error, stackTrace) {
                  Utils().toastMessage(
                    error.toString(),
                  );
                });
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
