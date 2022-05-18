import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:untitled/Screens/AdsCollection/services.dart';
import 'package:untitled/Screens/home/home_screen_12.dart';

import '../AdsCollection/services.dart';

class Home_Screen_11 extends StatefulWidget {
  @override
  _Home_Screen_11State createState() => _Home_Screen_11State();
}

class _Home_Screen_11State extends State<Home_Screen_11> {
  String? addTitle, AddWebsiteLink, AdCountry;

  TextEditingController name = TextEditingController();
  TextEditingController name1 = TextEditingController();
  TextEditingController name2 = TextEditingController();

  File? selectedImage;
  bool _isLoading = false;
  CrudMethods crudMethods = new CrudMethods();

  Future getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    // var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
    });
  }

  uploadBlog() async {
    try {
      final response = await FirebaseStorage.instance
          .ref()
          .child('blogs')
          .child("${randomAlphaNumeric(9)}.jpg");
      final upload = await response.putFile(selectedImage!);

      var downloadUrl = await (await upload).ref.getDownloadURL();
      print("this is url $downloadUrl");
      await FirebaseFirestore.instance.collection("User").add({
        "imgUrl": downloadUrl,
        "authorName": addTitle,
        "title": AddWebsiteLink,
        "desc": AdCountry,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          width: MediaQuery.of(context).size.width * 0.90,
          content: Text("Uploded Successfully"),
        ));
        print("successfully");
      });
    } catch (e) {
      print("some error occured");
    }
  }

  int currentValue = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home_Screen_12()));
                          },
                          child: Center(
                            child: Image.asset(
                              'assets/ads.png',
                              width: 250.0,
                              height: 150.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: selectedImage != null
                              ? Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.file(
                                      selectedImage!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              : Container(
                                  width: double.infinity,
                                  height: 80,
                                  child: Card(
                                    elevation: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.camera_alt,
                                            color: Colors.indigo, size: 50),
                                        Text("  Ad Thumbnail Photo")
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(height: 30),
                        Text("  Ad Title"),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Ad Title';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            contentPadding: EdgeInsets.fromLTRB(12, 10, 0, 10),
                            hintText: "Add Title",
                            filled: true,
                            fillColor: Color(0xFFF0F0F0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color(0xFFF0F0F0), width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(240, 240, 240, 100),
                                    width: 2)),
                          ),
                          onChanged: (val) {
                            addTitle = val;
                          },
                        ),
                        Text("  Website URL"),
                        const SizedBox(height: 10),
                        TextFormField(
                          validator: (website) {
                            String pattern =
                                r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
                            RegExp regExp = RegExp(pattern);
                            if (website!.isEmpty) {
                              return "Please enter your website";
                            } else if (!(regExp.hasMatch(website))) {
                              return "Website Url must be started from www";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.language),
                            contentPadding: EdgeInsets.fromLTRB(12, 10, 0, 10),
                            hintText: "Website URL",
                            filled: true,
                            fillColor: Color(0xFFF0F0F0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color(0xFFF0F0F0), width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(240, 240, 240, 100),
                                    width: 2)),
                          ),
                          onChanged: (val) {
                            AddWebsiteLink = val;
                          },
                        ),

                        const SizedBox(height: 10),
                        Text("  Ad Country"),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Add Country';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.language),
                            contentPadding: EdgeInsets.fromLTRB(12, 10, 0, 10),
                            hintText: "Ad Country",
                            filled: true,
                            fillColor: Color(0xFFF0F0F0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color(0xFFF0F0F0), width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(240, 240, 240, 100),
                                    width: 2)),
                          ),
                          onChanged: (val) {
                            AdCountry = val;
                          },
                        ),
                        // add_post_dropdown(),
                        const SizedBox(height: 30),
                        Container(
                          height: 45,
                          width: double.infinity,
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Color(0xFFFF8000),
                            child: Text("Publish Ad Now"),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                uploadBlog();
                                return;
                              } else {
                                print("UnSuccessfull");
                              }
                              uploadBlog();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
