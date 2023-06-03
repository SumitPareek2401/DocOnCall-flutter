import 'package:doc_on_call/screens/login_register_screen/login_screen.dart';
// import 'package:fetch_api_demo/utils/utils.dart';
import 'package:doc_on_call/screens/login_register_screen/round_button.dart';
import 'package:doc_on_call/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref('SignUpDetails');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });

    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      // Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SignUp'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              //when we enter in email&password so this form is used
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      prefixIcon: Icon(Icons.man),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    //this is used for getting email&password
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email_rounded),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            RoundButton(
              title: 'SignUp',
              loading: loading,
              OnTap: () {
                setState(() {
                  loading = true;
                });

                String id = DateTime.now().millisecondsSinceEpoch.toString();
                databaseRef.child(id).set({
                  'name ': nameController.text.toString(),
                  'gmail': emailController.text.toString(),
                  'uid': id,
                }).then((value) {
                  Utils().toastMessage('Sign Up Successfully');
                  setState(() {
                    loading = false;
                  });
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                  setState(() {
                    loading = false;
                  });
                });
                // to check whether the email and password are submitted or are in correct format or not
                if (_formKey.currentState!.validate()) {
                  login();
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Text("Already have an account"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyLogin(),
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:doc_on_call/screens/home/home_screen.dart';

// class MyRegister extends StatefulWidget {
//   const MyRegister({Key? key}) : super(key: key);

//   @override
//   State<MyRegister> createState() => _MyRegisterState();
// }

// class _MyRegisterState extends State<MyRegister> {
//   final _formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/register.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(
//               padding: const EdgeInsets.only(
//                 left: 25,
//                 top: 25,
//               ),
//               child: const Text(
//                 'Create\nAccount',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 32,
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.23,
//                   right: 35,
//                   left: 35,
//                 ),
//                 child: Column(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                             10,
//                           ),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                             10,
//                           ),
//                           borderSide: const BorderSide(
//                             color: Colors.white,
//                           ),
//                         ),
//                         hintText: 'Name',
//                         hintStyle: const TextStyle(
//                           color: Colors.white,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 40),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                             10,
//                           ),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                             10,
//                           ),
//                           borderSide: const BorderSide(
//                             color: Colors.white,
//                           ),
//                         ),
//                         hintText: 'Email',
//                         hintStyle: const TextStyle(
//                           color: Colors.white,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Enter email';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                             10,
//                           ),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                             10,
//                           ),
//                           borderSide: const BorderSide(
//                             color: Colors.white,
//                           ),
//                         ),
//                         hintText: 'Password',
//                         hintStyle: const TextStyle(
//                           color: Colors.white,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Enter email';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Sign in',
//                           style: TextStyle(
//                             color: Color.fromARGB(255, 247, 248, 252),
//                             fontSize: 27,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         CircleAvatar(
//                           radius: 30,
//                           backgroundColor: const Color(0xff4c505b),
//                           child: IconButton(
//                             color: Colors.white,
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => HomeScreen(),
//                                 ),
//                               );
//                             },
//                             icon: const Icon(
//                               Icons.arrow_forward,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pushNamed(context, 'login');
//                           },
//                           child: const Text(
//                             'Sign Up',
//                             style: TextStyle(
//                               decoration: TextDecoration.underline,
//                               fontSize: 18,
//                               color: Color.fromARGB(255, 240, 241, 244),
//                             ),
//                           ),
//                         ),
//                         // TextButton(
//                         //   onPressed: () {},
//                         //   child: Text(
//                         //     'Forgot Password?',
//                         //     style: TextStyle(
//                         //       decoration: TextDecoration.underline,
//                         //       fontSize: 18,
//                         //       color: Color(0xff4c505b),
//                         //     ),
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
