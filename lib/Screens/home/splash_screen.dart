import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/Widgets/color_resource.dart';
import '../auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Login_Screen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.ORANGE,
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 60),
                SvgPicture.asset(
                  'assets/svg_logo.svg',
                  height: 100.0,
                  width: 100.0,
                  // allowDrawingOutsideViewBox: true,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 120,
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: const Text(
                      "MEPA",
                      style: TextStyle(
                          fontSize: 32,
                          color: ColorResources.COLOR_BLACK,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 5),
              Text(
                "Lorem Ipsum dolor set",
                style: TextStyle(
                    fontSize: 16,
                    color: ColorResources.WHITE,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      )),
    );
  }
}
