import 'package:doc_on_call/screens/login_register_screen/login_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  // const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'Hello friend!',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle),
            title: const Text('User_name\n\nuser_id'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyLogin(),
                ),
              );
            },
            child: const Text(
              "Logout",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 15,
                color: Color(0xff4c505b),
              ),
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) =>const MyLogin(),
          //       ),
          //     );
          //   },
          //   icon:const Icon(Icons.arrow_back),
          // ),
        ],
      ),
    );
  }
}
