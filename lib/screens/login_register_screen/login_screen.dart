// import 'package:fetch_api_demo/ui/auth/login_with_phone_no.dart';
// import 'package:fetch_api_demo/utils/utils.dart';
import 'package:doc_on_call/screens/login_register_screen/login_with_phone_no.dart';
// import 'package:doc_on_call/screens/login_register_screen/register_screen.dart';
import 'package:doc_on_call/screens/login_register_screen/register_screen.dart';
import 'package:doc_on_call/screens/home/home_screen.dart';
import 'package:doc_on_call/screens/login_register_screen/round_button.dart';
import 'package:doc_on_call/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

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
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      Utils().toastMessage(
        value.user!.email.toString(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
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
        automaticallyImplyLeading: false,
        title: const Text('Login'),
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
              height: 50,
            ),
            RoundButton(
              loading: loading,
              title: 'Login',
              OnTap: () {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
            const SizedBox(height: 14),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginWithPhoneNumber(),
                  ),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.blue),
                ),
                child: const Center(
                  child: Text(
                    'Login with phone',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:doc_on_call/screens/home/home_screen.dart';
// import 'package:flutter/material.dart';

// class MyLogin extends StatefulWidget {
//   const MyLogin({Key? key}) : super(key: key);

//   @override
//   State<MyLogin> createState() => _MyLoginState();
// }

// class _MyLoginState extends State<MyLogin> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/login.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(
//               padding: const EdgeInsets.only(
//                 left: 25,
//                 top: 100,
//               ),
//               child: const Text(
//                 'Welcome\nBack',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 32,
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.5,
//                   right: 35,
//                   left: 35,
//                 ),
//                 child: Column(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100,
//                         hintText: 'Email',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     TextField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100,
//                         hintText: 'Password',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
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
//                             color: Color(0xff4c505b),
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
//                             Navigator.pushNamed(context, 'register');
//                           },
//                           child: const Text(
//                             'Sign Up',
//                             style: TextStyle(
//                               decoration: TextDecoration.underline,
//                               fontSize: 18,
//                               color: Color(0xff4c505b),
//                             ),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             'Forgot Password?',
//                             style: TextStyle(
//                               decoration: TextDecoration.underline,
//                               fontSize: 18,
//                               color: Color(0xff4c505b),
//                             ),
//                           ),
//                         ),
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
