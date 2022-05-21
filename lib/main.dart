import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Screens/AdsCollection/add_blog.dart';
import 'package:untitled/Screens/home/home_screen.dart';
import 'package:untitled/Screens/home/splash_screen.dart';

import 'Screens/home/Home_Screen_nine9.dart';
import 'Screens/home/home_screen_11.dart';

var email;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: FutureBuilder(
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
              home: SplashScreen(),
            );
          }),
    );
  }
}
