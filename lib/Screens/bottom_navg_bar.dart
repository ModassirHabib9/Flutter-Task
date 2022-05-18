import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home/home_screen.dart';
import 'home/home_screen_siven7.dart';
import 'home/home_screen_six6.dart';
import 'package:untitled/Widgets/color_resource.dart';

class BottomNavBar extends StatefulWidget {
  final int? selectedTypeId;

  BottomNavBar({this.selectedTypeId});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 1;

  final Home_Screen about = Home_Screen();
  final Home_Screen_Six6 focus = Home_Screen_Six6();
  final Home_Screen_Siven7 home = Home_Screen_Siven7();

  Widget showPage = new Home_Screen_Six6();

  Widget pageChooser(int page) {
    switch (page) {
      case 0:
        return about;
        break;
      case 1:
        return focus;
        break;
      case 2:
        return home;
        break;
      default:
        return Container(
          child: Text('No page found'),
        );
        break;
    }
  }

  storeIdInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('selectedTypeUid', this.widget.selectedTypeId!);
    print('Id stored in local DB');
    print(prefs.getInt('selectedTypeUid'));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
    storeIdInSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: pageIndex,
          height: 55,
          items: const <Widget>[
            Icon(Icons.favorite, size: 30, color: Colors.white),
            Icon(Icons.home_filled, size: 30, color: Colors.white),
            Icon(Icons.person, size: 30, color: Colors.white),
          ],
          color: ColorResources.ORANGE,
          buttonBackgroundColor: Colors.black,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              showPage = pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          child: Center(
            //child: Text(_page.toString(), textScaleFactor: 10.0),
            child: showPage,
          ),
        ));
  }
}
