import 'package:flutter/material.dart';
import 'package:untitled/Widgets/country_popup.dart';

class BackgroudCurveWidget extends StatelessWidget {
  const BackgroudCurveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Country_Popup(),
    );
  }
}
