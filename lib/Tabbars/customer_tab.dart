import 'package:flutter/material.dart';
import 'package:untitled/Widgets/color_resource.dart';
import '../Screens/auth/rigister_screen.dart';
import 'package:untitled/Tabbars/advertiser_tab.dart';
import 'package:untitled/Widgets/text_constant.dart';
import 'package:untitled/Widgets/text_field.dart';

import '../Screens/update_user_screen.dart';

class Customer_Tab extends StatefulWidget {
  @override
  _Customer_TabState createState() => _Customer_TabState();
}

class _Customer_TabState extends State<Customer_Tab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              /*mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,*/
              children: [
                MyWidgetListTile(
                  text: "Email",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Update_User_Screen()));
                  },
                  leding: Icon(Icons.email),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                SizedBox(height: 10),
                MyWidgetListTile(
                  text: "Location",
                  ontap: () {},
                  leding: Icon(Icons.location_on_rounded),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                SizedBox(height: 10),
                MyWidgetListTile(
                  text: "About",
                  ontap: () {},
                  leding: Icon(Icons.watch_later),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const SizedBox(height: 10),
                MyWidgetListTile(
                  text: "Rate this App",
                  ontap: () {},
                  leding: Icon(Icons.watch_later),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const SizedBox(height: 10),
                MyWidgetListTile(
                  text: "Logout",
                  ontap: () {},
                  leding: Icon(Icons.logout),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
