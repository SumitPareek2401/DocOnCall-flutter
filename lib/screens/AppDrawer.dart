import 'package:doc_on_call/screens/details/disease_add/previous_form.dart';
import 'package:doc_on_call/screens/login_register_screen/login_screen.dart';
import 'package:doc_on_call/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  // const AppDrawer({super.key});
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('SignUpDetails');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                final mail = snapshot.child('gmail').value.toString();
                if (mail == auth.currentUser?.email) {
                  //snapshot.child('gmail').value.toString()) {
                  return AppBar(
                    title: Text(
                      'Hi, ${snapshot.child('name ').value.toString()}',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  );
                } else {
                  return const Text(
                    'null',
                    style: TextStyle(color: Colors.white, fontSize: 0),
                  );
                }
              },
            ),
          ),
          const Divider(),
          Expanded(
            flex: 5,
            child: ListTile(
              leading: const Icon(Icons.supervised_user_circle),
              title: const Text('User_name\n\nuser_id'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ),
          const Divider(),
          Expanded(
            flex: 5,
            child: ListTile(
              leading: const Icon(Icons.forum),
              title: const Text('Previous Medical Form'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MedicalForm(),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyLogin(),
                    ));
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
    );
  }
}
