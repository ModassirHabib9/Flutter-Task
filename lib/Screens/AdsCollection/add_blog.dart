/*
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:random_string/random_string.dart';
// import 'package:untitled/Screens/AdsCollection/services.dart';

// class CreateBlog extends StatefulWidget {
//   @override
//   _CreateBlogState createState() => _CreateBlogState();
// }

// class _CreateBlogState extends State<CreateBlog> {
//   String? authorName, title, desc;

//   File? selectedImage;
//   bool _isLoading = false;
//   CrudMethods crudMethods = new CrudMethods();

//   Future getImage() async {
//     var image = await ImagePicker().getImage(source: ImageSource.gallery);
//     // var image = await ImagePicker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       selectedImage = File(image!.path);
//     });
//   }

//   uploadBlog() async {
//     try {
//       final response = await FirebaseStorage.instance
//           .ref()
//           .child('blogs')
//           .child("${randomAlphaNumeric(9)}.jpg");
//       final upload = await response.putFile(selectedImage!);

//       var downloadUrl = await (await upload).ref.getDownloadURL();
//       print("this is url $downloadUrl");
//       await FirebaseFirestore.instance.collection("User").add({
//         "imgUrl": downloadUrl,
//         "authorName": authorName,
//         "title": title,
//         "desc": desc,
//       }).then((value) {
//         print("successfully");
//       });
//     } catch (e) {
//       print("some error occured");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[
//             Text(
//               "Add Data",
//               style: TextStyle(fontSize: 22, color: Colors.blue),
//             )
//           ],
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         actions: <Widget>[
//           GestureDetector(
//             onTap: () {
//               uploadBlog();
//             },
//             child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: const Icon(
//                   Icons.file_upload,
//                   color: Colors.black,
//                 )),
//           )
//         ],
//       ),
//       body: _isLoading
//           ? Container(
//               alignment: Alignment.center,
//               child: CircularProgressIndicator(),
//             )
//           : Container(
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(
//                     height: 10,
//                   ),
//                   GestureDetector(
//                       onTap: () {
//                         getImage();
//                       },
//                       child: selectedImage != null
//                           ? Container(
//                               margin: EdgeInsets.symmetric(horizontal: 16),
//                               height: 170,
//                               width: MediaQuery.of(context).size.width,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(6),
//                                 child: Image.file(
//                                   selectedImage!,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             )
//                           : Container(
//                               margin: EdgeInsets.symmetric(horizontal: 16),
//                               height: 170,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(6)),
//                               width: MediaQuery.of(context).size.width,
//                               child: Icon(
//                                 Icons.add_a_photo,
//                                 color: Colors.black,
//                               ),
//                             )),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       children: <Widget>[
//                         TextField(
//                           decoration: InputDecoration(hintText: "Author Name"),
//                           onChanged: (val) {
//                             authorName = val;
//                           },
//                         ),
//                         TextField(
//                           decoration: InputDecoration(hintText: "Title"),
//                           onChanged: (val) {
//                             title = val;
//                           },
//                         ),
//                         TextField(
//                           decoration: InputDecoration(hintText: "Desc"),
//                           onChanged: (val) {
//                             desc = val;
//                           },
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class ExampleHomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage>
    with TickerProviderStateMixin {
  List<String> welcomeImages = [
    "assets/welcome0.png",
    "assets/welcome1.png",
    "assets/welcome2.png",
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: TinderSwapCard(
            orientation: AmassOrientation.BOTTOM,
            totalNum: welcomeImages.length,
            stackNum: 3,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 0.9,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 0.8,
            cardBuilder: (context, index) {
              print('index ${index}');
              return Card(
                child: Image.asset('${welcomeImages[index]}'),
              );
            },
            cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                //print("Card is LEFT swiping");
              } else if (align.x > 0) {
                //print("Card is RIGHT swiping");
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              print(orientation.toString());
              if (orientation == CardSwipeOrientation.LEFT) {
                print("Card is LEFT swiping");
                print(welcomeImages.length);
              } else if (orientation == CardSwipeOrientation.RIGHT) {
                print("Card is RIGHT swiping");
                print(welcomeImages.length);
              }
            },
          ),
        ),
      ),
    );
  }
}
*/
