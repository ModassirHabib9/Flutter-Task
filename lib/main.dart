import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/AdsCollection/home11.dart';
import 'package:untitled/Screens/home/home_screen.dart';
import 'package:untitled/Screens/home/home_screen_11.dart';
import 'package:untitled/Screens/home/home_screen_12.dart';
import 'package:untitled/Screens/home/home_screen_six6.dart';
import 'package:untitled/Screens/home/splash_screen.dart';

import 'Screens/AdsCollection/Extra/home_page.dart';
import 'Screens/AdsCollection/add_blog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for Errors
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return MaterialApp(
            title: 'Flutter Task',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            debugShowCheckedModeBanner: false,
            home: Home_Screen(),
          );
        });
  }
}
