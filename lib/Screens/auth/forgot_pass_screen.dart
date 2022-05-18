import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Widgets/color_resource.dart';
import 'package:untitled/Widgets/text_constant.dart';
import 'package:untitled/Widgets/text_field.dart';

import 'rigister_screen.dart';

class Forgot_Password_Screen extends StatefulWidget {
  @override
  _Forgot_Password_ScreenState createState() => _Forgot_Password_ScreenState();
}

class _Forgot_Password_ScreenState extends State<Forgot_Password_Screen> {
  final _formKey = GlobalKey<FormState>();

  var email = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Password Reset Email has been sent !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'No user found for that email.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg_logo.svg',
                      height: 45.0,
                      width: 45.0,
                      // allowDrawingOutsideViewBox: true,
                    ),
                    SimpleText("MEPA"),
                    const SizedBox(height: 50),
                    Add_TextField(
                      hint: "Email",
                      width: double.infinity,
                      onChange: () {},
                      controller: emailController,

                      kry: TextInputType.name,
                      suffixIcon: const Icon(Icons.person),
                      prefixIcon: const Icon(Icons.email),
                      // controller: controller,
                      // decoration: decoration
                    ),
                    /*const SizedBox(height: 20),
                    forgot_text(),*/
                    const SizedBox(height: 20),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: RaisedButton(
                        textColor: ColorResources.WHITE,
                        color: ColorResources.ORANGE,
                        child: Text("Forgot Password"),
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              email = emailController.text;
                            });
                            resetPassword();
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an Account? ",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () => {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, a, b) =>
                                        Registration_Screen(),
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                  (route) => false)
                            },
                            child: const Text('Signup',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 18)),
                          ),
                          // TextButton(
                          //   onPressed: () => {
                          //     Navigator.pushAndRemoveUntil(
                          //         context,
                          //         PageRouteBuilder(
                          //           pageBuilder: (context, a, b) => UserMain(),
                          //           transitionDuration: Duration(seconds: 0),
                          //         ),
                          //         (route) => false)
                          //   },
                          //   child: Text('Dashboard'),
                          // ),
                        ],
                      ),
                    )
                    /* RichText(
                        text: const TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            children: <TextSpan>[
                          TextSpan(
                              text: ' SIGN UP',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 18))
                        ])),*/
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
