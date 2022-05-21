import 'package:flutter/material.dart';
import 'package:untitled/Widgets/country_popup.dart';

class BackgroudCurveWidget extends StatelessWidget {
  const BackgroudCurveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Country_Popup(),
      ),
    );
  }
}
