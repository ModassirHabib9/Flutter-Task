import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  String text;

  SimpleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class forgot_text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        child: const Text(
          "Forgot Password?",
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.red),
        ));
  }
}
