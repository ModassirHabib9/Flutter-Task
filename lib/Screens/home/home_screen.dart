import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Card_Swipping_Widgets/background_curve_widget.dart';
import 'package:untitled/Card_Swipping_Widgets/cards_stack_widget.dart';

// ignore: camel_case_types
class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

// ignore: camel_case_types
class _Home_ScreenState extends State<Home_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initial();
  }

  // void initial() async {
  //   // logindata = await SharedPreferences.getInstance();
  //   setState(() {
  //     // username = logindata.getString('email')!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BackgroudCurveWidget(),
          CardsStackWidget(),
        ],
      ),
    );
  }
}

///

enum Swipe { left, right, none }
