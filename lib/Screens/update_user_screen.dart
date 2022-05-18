import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'home/home_screen_nine9.dart';
import 'home/home_screen_11.dart';
import 'package:untitled/Widgets/text_field.dart';

class Update_User_Screen extends StatefulWidget {
  @override
  _Update_User_ScreenState createState() => _Update_User_ScreenState();
}

class _Update_User_ScreenState extends State<Update_User_Screen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home_Screen_nine9()));
                },
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      ClipPath(
                        clipper: DiagonalPathClipperTwo(),
                        child: Container(
                          height: 140,
                          color: const Color.fromRGBO(3, 30, 116, 100),
                          // child: Center(child: Text()),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(50)),
                          child: Image.asset(
                            "assets/profile_icon.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Add_TextField(
                      hint: "John Doe",
                      width: double.infinity,
                      onChange: () {},
                      controller: emailController,
                      kry: TextInputType.name,
                      suffixIcon: const Icon(Icons.person),
                      prefixIcon: const Icon(Icons.person),
                      // controller: controller,
                      // decoration: decoration
                    ),
                    const SizedBox(height: 10),
                    Add_TextField(
                      hint: "johndoe@mepa.com",
                      width: double.infinity,
                      controller: emailController,
                      onChange: () {},
                      kry: TextInputType.emailAddress,
                      suffixIcon: const Icon(Icons.person),
                      prefixIcon: const Icon(Icons.email),
                      // controller: controller,
                      // decoration: decoration
                    ),
                    const SizedBox(height: 10),
                    Add_TextField(
                      hint: "+1-987654321",
                      width: double.infinity,
                      onChange: () {},
                      controller: emailController,
                      kry: TextInputType.emailAddress,
                      suffixIcon: const Icon(Icons.person),
                      prefixIcon: const Icon(Icons.phone_android),
                      // controller: controller,
                      // decoration: decoration
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: const Color(0xFFFF8000),
                        child: const Text("Update Profile"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home_Screen_11()));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
