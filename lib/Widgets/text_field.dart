import 'dart:async';

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

class Hide_TextField extends StatelessWidget {
  final String hint;
  final TextInputType kry;
  final double width;
  final Function() onChange;
  // final Function validator;
  final Widget suffixIcon;
  final Widget prefixIcon;
  // final Function onTap;
  // final TextEditingController controller;
  // final Color borderColor;
  // final bool obscureText;
  // final InputDecoration decoration;
  // final Function(String) validator;

  // final MaskFilter maskFilter;

  Hide_TextField({
    @override required this.hint,
    @override required this.width,
    @override required this.onChange,
    @override required this.kry,
    // required this.validator,
    @override required this.suffixIcon,
    @override required this.prefixIcon,
    // required this.onTap,
    // required this.controller,
    // required this.borderColor,
    // required this.obscureText,
    /*required this.decoration*/
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      // keyboardType: TextInputType.phone,
      onChanged: onChange(),
      // controller: callback,
      // autovalidate: true,
      // obscureText: obscureText,
      // validator: validator(),
      // inputFormatters: inputFormatters,
      keyboardType: kry,

      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabled: false,
        contentPadding: const EdgeInsets.fromLTRB(12, 10, 0, 10),
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF0F0F0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: ColorResources.WHITE, width: 2)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
                color: Color.fromRGBO(240, 240, 240, 100), width: 2)),
      ),
      // inputFormatters: [phoneFormatter],
    );
  }
}
