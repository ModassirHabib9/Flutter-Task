import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Widgets/color_resource.dart';

class Country_Popup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0, top: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    color: ColorResources.ORANGE),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svg_logo.svg',
                    height: 20.0,
                    width: 25.0,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
              ),
              const Text("    MEPA",
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ],
          ),
          Container(
              width: 140,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Location",
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        child: Text("Pakistan"),
                        value: 1,
                      ),
                      const PopupMenuItem(
                        child: Text("UAE"),
                        value: 2,
                      ),
                      const PopupMenuItem(
                        child: Text("USA"),
                        value: 2,
                      ),
                    ],
                    child: SvgPicture.asset(
                      'assets/country.svg',
                      height: 25.0,
                      width: 25.0,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
