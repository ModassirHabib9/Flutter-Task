import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Widgets/color_resource.dart';
import 'package:untitled/Widgets/country_popup.dart';

import '../AdsCollection/Extra/update_student_page.dart';
import 'home_screen_siven7.dart';

class Home_Screen_Six6 extends StatefulWidget {
  @override
  _Home_Screen_Six6State createState() => _Home_Screen_Six6State();
}

class _Home_Screen_Six6State extends State<Home_Screen_Six6> {
  FirebaseStorage storage = FirebaseStorage.instance;
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        // backgroundColor: Colors.transparent,
        title: Country_Popup(),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('User').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home_Screen_Siven7()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height,
                      child: Card(
                        color: Colors.indigo.shade500,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0)),
                        elevation: 3.0,
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  // height: 120,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      child: Image.network(
                                        document["imgUrl"],
                                        height: 160,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Positioned(
                                  top: 6.0,
                                  right: 6.0,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Row(
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              FirebaseFirestore.instance
                                                  .collection("User")
                                                  .doc(document.id)
                                                  .delete()
                                                  .catchError((e) {
                                                print(e);
                                              });
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.red,
                                              size: 25.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 7.0),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 5, top: 5, right: 5, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                document['authorName'].toString(),
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: ColorResources.WHITE,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
