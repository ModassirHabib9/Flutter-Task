import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'home/home_screen_nine9.dart';
import 'home/home_screen_11.dart';
import 'package:untitled/Widgets/text_field.dart';

class Update_User_Screen extends StatefulWidget {
  // final String id;
  // Update_User_Screen({this.id})
  @override
  _Update_User_ScreenState createState() => _Update_User_ScreenState();
}

class _Update_User_ScreenState extends State<Update_User_Screen> {
//   getUserDetails() async {
//   await FirebaseFirestore.instance.instance
//       .collection('users')
//       .document(authNotifier.user.uid)
//       .get()
//       .catchError((e) => print(e))
//       .then((value) => authNotifier.setUserDetails(User.fromMap(value.data)));
// }
  // final name=snapshot.data["UserName"];
  final phoneNumber = FirebaseAuth.instance.currentUser!.phoneNumber;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User? user = FirebaseAuth.instance.currentUser;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    // uid = FirebaseAuth.instance.currentUser!.uid;
    // TODO: implement initState
    super.initState();
  }

  // Updaing Student
  CollectionReference students = FirebaseFirestore.instance.collection('User');

  Future<void> updateUser(id, name, email) {
    return students
        .doc(id)
        .update({
          'authorName': name,
          'desc': email,
          // 'title': password,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

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
                      hint: 'email',
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
                      hint: '${creationTime}',
                      width: double.infinity,
                      controller: passwordController,
                      onChange: () {},
                      kry: TextInputType.emailAddress,
                      suffixIcon: const Icon(Icons.person),
                      prefixIcon: const Icon(Icons.email),
                      // controller: controller,
                      // decoration: decoration
                    ),
                    const SizedBox(height: 10),
                    Add_TextField(
                      hint: '$phoneNumber',
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
                          // updateUser(Widget.id, name, email);
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
