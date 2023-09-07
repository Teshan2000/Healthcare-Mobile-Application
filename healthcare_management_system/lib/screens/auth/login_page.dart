import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_management_system/helper/helper_function.dart';
import 'package:healthcare_management_system/screens/auth/register_page.dart';
import 'package:healthcare_management_system/screens/home.dart';
import 'package:healthcare_management_system/service/auth_service.dart';
import 'package:healthcare_management_system/service/database_service.dart';
import 'package:healthcare_management_system/utils/config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isLoading = false;
  AuthService authService = AuthService();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("Assets/home_banner.png"),
                      const SizedBox(height: 10),
                      const Text(
                        "Login now to see what they are talking!",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      Image.asset("Assets/login.png"),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!)
                              ? null
                              : "Please enter a valid email";
                        },
                      ),
                      const SizedBox(height: 15),
                      // Single password field with toggle visibility
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_passwordVisible,
                        decoration: textInputDecoration.copyWith(
                          labelText: "Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme.of(context).primaryColor,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (val) {
                          if (val!.length < 6) {
                            return "Password must be at least 6 characters";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            login();
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Register here",
                              style: const TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  nextScreen(context, const RegisterPage());
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .loginWithUserNameandPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);
          // saving the values to our shared preferences
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);

          // Navigate to the Layout page after successful login
          Navigator.pushReplacementNamed(context, "main");
        } else {
          showSnackbar(context, Color.fromARGB(255, 7, 212, 205), value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:healthcare_management_system/helper/helper_function.dart';
// import 'package:healthcare_management_system/screens/auth/register_page.dart';
// import 'package:healthcare_management_system/screens/home.dart';
// import 'package:healthcare_management_system/service/auth_service.dart';
// import 'package:healthcare_management_system/service/database_service.dart';
// import 'package:healthcare_management_system/utils/config.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final formKey = GlobalKey<FormState>();
//   String email = "";
//   String password = "";
//   bool _isLoading = false;
//   AuthService authService = AuthService();
//   bool _passwordVisible = false;
//   TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _isLoading
//           ? Center(
//               child: CircularProgressIndicator(
//                   color: Theme.of(context).primaryColor),
//             )
//           : SingleChildScrollView(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//                 child: Form(
//                     key: formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Image.asset("Assets/home_banner.png"),
//                         // const Text(
//                         //   "Medi Care",
//                         //   style: TextStyle(
//                         //       fontSize: 40, fontWeight: FontWeight.bold),
//                         // ),
//                         const SizedBox(height: 10),
//                         const Text("Login now to see what they are talking!",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.w400)),
//                         Image.asset("Assets/login.png"),
//                         TextFormField(
//                           decoration: textInputDecoration.copyWith(
//                               labelText: "Email",
//                               prefixIcon: Icon(
//                                 Icons.email,
//                                 color: Theme.of(context).primaryColor,
//                               )),
//                           onChanged: (val) {
//                             setState(() {
//                               email = val;
//                             });
//                           },

//                           // check tha validation
//                           validator: (val) {
//                             return RegExp(
//                                         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                     .hasMatch(val!)
//                                 ? null
//                                 : "Please enter a valid email";
//                           },
//                         ),
//                         const SizedBox(height: 15),
//                         TextFormField(
//                           obscureText: true,
//                           decoration: textInputDecoration.copyWith(
//                               labelText: "Password",
//                               prefixIcon: Icon(
//                                 Icons.lock,
//                                 color: Theme.of(context).primaryColor,
//                               )),
//                           validator: (val) {
//                             if (val!.length < 6) {
//                               return "Password must be at least 6 characters";
//                             } else {
//                               return null;
//                             }
//                           },
//                           onChanged: (val) {
//                             setState(() {
//                               password = val;
//                             });
//                           },
//                         ),
//                         // const SizedBox(
//                         //   height: 20,
//                         // ),
//                         // Add IconButton to toggle password visibility
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Expanded(
//                               child: TextField(
//                                 controller: _passwordController,
//                                 obscureText: !_passwordVisible,
//                                 decoration: InputDecoration(
//                                   labelText: 'Password',
//                                   prefixIcon: Icon(
//                                     Icons.lock,
//                                     color: Theme.of(context).primaryColor,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 _passwordVisible
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _passwordVisible = !_passwordVisible;

//                                   // Set text selection to the end
//                                   _passwordController.selection =
//                                       TextSelection.collapsed(
//                                     offset: _passwordController.text.length,
//                                   );
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 primary: Theme.of(context).primaryColor,
//                                 elevation: 0,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(30))),
//                             child: const Text(
//                               "Sign In",
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16),
//                             ),
//                             onPressed: () {
//                               login();
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Text.rich(TextSpan(
//                           text: "Don't have an account? ",
//                           style: const TextStyle(
//                               color: Colors.black, fontSize: 14),
//                           children: <TextSpan>[
//                             TextSpan(
//                                 text: "Register here",
//                                 style: const TextStyle(
//                                     color: Colors.black,
//                                     decoration: TextDecoration.underline),
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {
//                                     nextScreen(context, const RegisterPage());
//                                   }),
//                           ],
//                         )),
//                       ],
//                     )),
//               ),
//             ),
//     );
//   }

//   login() async {
//     if (formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });
//       await authService
//           .loginWithUserNameandPassword(email, password)
//           .then((value) async {
//         if (value == true) {
//           QuerySnapshot snapshot =
//               await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
//                   .gettingUserData(email);
//           // saving the values to our shared preferences
//           await HelperFunctions.saveUserLoggedInStatus(true);
//           await HelperFunctions.saveUserEmailSF(email);
//           await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);

//           // Navigate to the Layout page after successful login
//           Navigator.pushReplacementNamed(context, "main");
//         } else {
//           showSnackbar(context, Color.fromARGB(255, 7, 212, 205), value);
//           setState(() {
//             _isLoading = false;
//           });
//         }
//       });
//     }
//   }
// }
