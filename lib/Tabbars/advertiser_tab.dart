import 'package:flutter/material.dart';
import 'package:untitled/Widgets/text_field.dart';

class Advertiser_Tab extends StatefulWidget {
  @override
  _Advertiser_TabState createState() => _Advertiser_TabState();
}

class _Advertiser_TabState extends State<Advertiser_Tab> {
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
                  ontap: () {},
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
