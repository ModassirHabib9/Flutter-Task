import 'package:flutter/material.dart';

class MyPasswordTextFormField extends StatefulWidget {
  final String hint;
  final TextInputType? kry;
  final double? width;
  // final Function? onChange;
  // final Function validator;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  // final Function onTap;
  final TextEditingController? controller;
  // final Color borderColor;
  // final bool obscureText;
  // final InputDecoration decoration;
  // final Function(String) validator;

  // final MaskFilter maskFilter;
  MyPasswordTextFormField({
    @override required this.hint,
    this.width,
    // this.onChange,
    this.kry,
    // required this.validator,
    this.suffixIcon,
    required this.prefixIcon,
    // required this.onTap,
    this.controller,
    // required this.borderColor,
    // required this.obscureText,
    /*required this.decoration*/
  });

  @override
  _MyPasswordTextFormFieldState createState() =>
      _MyPasswordTextFormFieldState();
}

class _MyPasswordTextFormFieldState extends State<MyPasswordTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(12, 10, 0, 10),
        prefixIcon: const Icon(Icons.vpn_key),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText == true ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        fillColor: const Color(0xFFF0F0F0),
        filled: true,
        hintText: widget.hint,
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Color(0xFFF0F0F0), width: 2)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
                color: Color.fromRGBO(240, 240, 240, 100), width: 2)),
      ),
    );
  }
}
