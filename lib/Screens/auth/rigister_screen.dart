import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/Screens/auth/login_screen.dart';
import 'package:untitled/Widgets/color_resource.dart';
import 'package:untitled/Widgets/have_account_yes_no.dart';
import 'package:untitled/Widgets/my_password.dart';
import 'package:untitled/Widgets/my_text_field.dart';
import 'package:untitled/Widgets/text_constant.dart';

class Registration_Screen extends StatefulWidget {
  @override
  _Registration_ScreenState createState() => _Registration_ScreenState();
}

class _Registration_ScreenState extends State<Registration_Screen> {
  bool isMale = false;

  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
  bool isLoading = false;
  UserCredential? authResult;
  void submit() async {
    setState(() {
      isLoading = true;
    });
    try {
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on PlatformException catch (e) {
      String message = "Please Check Internet";
      if (e.message != null) {
        message = e.message.toString();
      }
      // ignore: deprecated_member_use
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(authResult!.user!.uid)
        .set({
      "UserName": fullName.text,
      "UserEmail": email.text,
      "UserId": authResult!.user!.uid,
      "UserNumber": phoneNumber.text,
      "UserAddress": address.text,
      "password": password.text,
      // "UserGender": isMale == true ? "Male" : "Female"
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => Login_Screen(),
      ),
    );
    setState(() {
      isLoading = false;
    });
  }

  void vaildation() {
    if (email.text.isEmpty &&
        password.text.isEmpty &&
        fullName.text.isEmpty &&
        address.text.isEmpty &&
        phoneNumber.text.isEmpty) {
      scaffold.currentState!.showSnackBar(
        const SnackBar(
          content: Text("All Fleid Is Empty"),
        ),
      );
    } else if (fullName.text.isEmpty) {
      scaffold.currentState!.showSnackBar(
        const SnackBar(
          content: Text("Full Name Is Empty"),
        ),
      );
    } else if (email.text.isEmpty) {
      scaffold.currentState!.showSnackBar(
        const SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (!regExp.hasMatch(email.text)) {
      scaffold.currentState!.showSnackBar(
        const SnackBar(
          content: Text("Email Is Not Vaild"),
        ),
      );
    } else if (phoneNumber.text.isEmpty) {
      scaffold.currentState!.showSnackBar(
        const SnackBar(
          content: Text("Phone Number Is Empty"),
        ),
      );
    } else if (phoneNumber.text.length < 11) {
      scaffold.currentState!.showSnackBar(
        const SnackBar(
          content: Text("Phone Number Must Be 11 "),
        ),
      );
    } else if (password.text.isEmpty) {
      scaffold.currentState!.showSnackBar(
        const SnackBar(
          content: Text("Password Is Empty"),
        ),
      );
    } else if (password.text.length < 8) {
      scaffold.currentState!.showSnackBar(
        const SnackBar(
          content: Text("Password Is Too Short"),
        ),
      );
    } else if (password.text != address.text) {
      scaffold.currentState!.showSnackBar(
        const SnackBar(
          content: Text("Password Does Not Match"),
        ),
      );
    } else {
      submit();
    }
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  Widget _buildAllTextFormField() {
    return Container(
      child: Column(
        children: [
          MyTextFormField(
            kry: TextInputType.name,
            prefixIcon: const Icon(Icons.person),
            controller: fullName,
            hint: "Full Name",
          ),
          const SizedBox(height: 10),
          MyTextFormField(
            controller: email,
            kry: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.email),
            hint: "Email",
          ),
          const SizedBox(height: 10),
          MyTextFormField(
            kry: TextInputType.phone,
            prefixIcon: const Icon(Icons.phone_android),
            controller: phoneNumber,
            hint: "Phone Number",
          ),
          const SizedBox(height: 10),
          MyPasswordTextFormField(
            kry: TextInputType.visiblePassword,
            prefixIcon: const Icon(Icons.vpn_key),
            controller: address,
            hint: "Password",
          ),
          const SizedBox(height: 10),
          /*GestureDetector(
            onTap: () {
              setState(() {
                isMale = !isMale;
              });
            },
            child: Container(
              height: 60,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                isMale == false ? "Female" : "Male",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              decoration: BoxDecoration(
                  color: Color(0xfff5d8e4),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),*/
          MyPasswordTextFormField(
            controller: password,
            prefixIcon: const Icon(Icons.vpn_key),
            hint: "Confirm Password",
          ),
        ],
      ),
    );
  }

  Widget _buildButtonPart() {
    return isLoading == false
        ? Container(
            height: 45,
            width: double.infinity,
            child: RaisedButton(
              textColor: ColorResources.WHITE,
              color: ColorResources.ORANGE,
              child: const Text("LOGIN"),
              onPressed: () async {
                // Validate returns true if the form is valid, otherwise false.
                vaildation();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 60, right: 20, left: 20),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg_logo.svg',
                    height: 45.0,
                    width: 45.0,
                    // allowDrawingOutsideViewBox: true,
                  ),
                  SimpleText("MEPA"),
                  const SizedBox(height: 20),
                  _buildAllTextFormField(),
                  const SizedBox(height: 20),
                  _buildButtonPart(),
                  const SizedBox(height: 20),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () => {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, a, b) =>
                                      Login_Screen(),
                                  transitionDuration: Duration(seconds: 0),
                                ),
                                (route) => false)
                          },
                          child: const Text('LOGIN',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 18)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
