import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:untitled/Screens/update_user_screen.dart';
import 'package:untitled/Tabbars/advertiser_tab.dart';
import 'package:untitled/Tabbars/customer_tab.dart';
import 'package:untitled/Widgets/color_resource.dart';

class Home_Screen_Siven7 extends StatefulWidget {
  @override
  _Home_Screen_Siven7State createState() => _Home_Screen_Siven7State();
}

class _Home_Screen_Siven7State extends State<Home_Screen_Siven7> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Update_User_Screen()));
                },
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      ClipPath(
                        clipper: DiagonalPathClipperTwo(),
                        child: Container(
                          height: 140,
                          color: Color.fromRGBO(3, 30, 116, 100),
                          // child: Center(child: Text()),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      ColorResources.COLOR_GRY.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: ColorResources.WHITE,
                              borderRadius: BorderRadius.circular(50)),
                          child: Image.asset(
                            "assets/profile_icon.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: ColorResources.ORANGE.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25.0)),
                child: TabBar(
                  indicator: BoxDecoration(
                      color: ColorResources.ORANGE,
                      borderRadius: BorderRadius.circular(25.0)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(text: 'Customer'),
                    Tab(text: 'Advertiser'),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  Customer_Tab(),
                  Advertiser_Tab(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
