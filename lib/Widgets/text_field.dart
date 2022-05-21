import 'dart:async';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_resource.dart';

class Add_TextField extends StatelessWidget {
  final String hint;
  final TextInputType kry;
  final double width;
  final Function onChange;
  // final Function validator;
  final Widget suffixIcon;
  final Widget prefixIcon;
  // final Function onTap;
  final TextEditingController? controller;
  // final Color borderColor;
  // final bool obscureText;
  // final InputDecoration decoration;
  // final Function(String) validator;

  // final MaskFilter maskFilter;

  Add_TextField({
    @override required this.hint,
    required this.width,
    required this.onChange,
    required this.kry,
    // required this.validator,
    required this.suffixIcon,
    required this.prefixIcon,
    // required this.onTap,
    required this.controller,
    // required this.borderColor,
    // required this.obscureText,
    /*required this.decoration*/
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // keyboardType: TextInputType.phone,
      onChanged: onChange(),
      controller: controller,
      // controller: callback,
      // autovalidate: true,
      // obscureText: obscureText,
      // validator: validator(),
      // inputFormatters: inputFormatters,
      keyboardType: kry,

      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.fromLTRB(12, 10, 0, 10),
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF0F0F0),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Color(0xFFF0F0F0), width: 2)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
                color: Color.fromRGBO(240, 240, 240, 100), width: 2)),
      ),
      // inputFormatters: [phoneFormatter],
    );
  }
}

class Add_TextField2 extends StatelessWidget {
  final String hint;
  final TextInputType kry;
  final double width;
  final Function onChange;
  // final Function validator;
  final Widget suffixIcon;
  final Widget prefixIcon;
  // final Function onTap;
  // final TextEditingController? controller;
  // final Color borderColor;
  // final bool obscureText;
  // final InputDecoration decoration;
  // final Function(String) validator;

  // final MaskFilter maskFilter;

  Add_TextField2({
    @override required this.hint,
    required this.width,
    required this.onChange,
    required this.kry,
    // required this.validator,
    required this.suffixIcon,
    required this.prefixIcon,
    // required this.onTap,
    // required this.controller,
    // required this.borderColor,
    // required this.obscureText,
    /*required this.decoration*/
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // keyboardType: TextInputType.phone,
      onChanged: onChange(),
      // controller: controller,
      // controller: callback,
      // autovalidate: true,
      // obscureText: obscureText,
      // validator: validator(),
      // inputFormatters: inputFormatters,
      keyboardType: kry,

      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.fromLTRB(12, 10, 0, 10),
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF0F0F0),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Color(0xFFF0F0F0), width: 2)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
                color: Color.fromRGBO(240, 240, 240, 100), width: 2)),
      ),
      // inputFormatters: [phoneFormatter],
    );
  }
}

class MyWidgetListTile extends StatelessWidget {
  final Icon leding;
  final Icon trailing;
  final Function() ontap;
  final String text;
  MyWidgetListTile(
      {Key? key,
      required this.leding,
      required this.text,
      required this.ontap,
      required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Color(0xFFF0F0F0)),
      child: ListTile(
        onTap: ontap,
        leading: leding,
        title: Text(text),
        trailing: trailing,
      ),
    );
  }
}
