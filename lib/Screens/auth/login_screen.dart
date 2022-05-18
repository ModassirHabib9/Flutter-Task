import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Screens/auth/forgot_pass_screen.dart';
import 'package:untitled/Screens/auth/rigister_screen.dart';
import 'package:untitled/Screens/bottom_navg_bar.dart';
import 'package:untitled/Screens/home/home_screen_siven7.dart';
import 'package:untitled/Widgets/color_resource.dart';
import 'package:untitled/Widgets/my_password.dart';
import 'package:untitled/Widgets/text_constant.dart';
import 'package:untitled/Widgets/text_field.dart';

class Login_Screen extends StatefulWidget {
  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBar(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  Saveuserid(String id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userid', id);
    print("User id 2");
    print(id);
    // prefs.setInt('usertype', selectedindex);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    Saveuserid('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                    const SizedBox(height: 10),
                    MyPasswordTextFormField(
                      controller: passwordController,
                      prefixIcon: const Icon(Icons.vpn_key),
                      hint: "Password",
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, a, b) =>
                                    Forgot_Password_Screen(),
                                transitionDuration: Duration(seconds: 0),
                              ),
                              (route) => false);
                        },
                        child: forgot_text()),
                    const SizedBox(height: 20),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: RaisedButton(
                        textColor: ColorResources.WHITE,
                        color: ColorResources.ORANGE,
                        child: Text("LOGIN"),
                        onPressed: () async {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              email = emailController.text;
                              password = passwordController.text;
                            });
                            userLogin();
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
                          Text(
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
                            child: Text('Signup',
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
