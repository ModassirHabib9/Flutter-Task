import 'package:flutter/material.dart';

class add_post_dropdown extends StatefulWidget {
  const add_post_dropdown({Key? key}) : super(key: key);

  @override
  _add_post_dropdownState createState() => _add_post_dropdownState();
}

class _add_post_dropdownState extends State<add_post_dropdown> {
  // Initial Selected Value
  String dropdownvalue = 'Select Country';

  // List of items in our dropdown menu
  var items = [
    'Select Country',
    'Peshawar',
    'Swat',
    'Karak',
    'Lahore',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      /*decoration: BoxDecoration(
          color: Colors.indigo, borderRadius: BorderRadius.circular(30)),*/
      child: DropdownButtonFormField(
        dropdownColor: Colors.indigo,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.indigo,
            hoverColor: Colors.indigo,
            focusColor: Colors.indigo,
            hintText: "Select option",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white))),
        // Initial Value

        value: dropdownvalue,

        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),

        // Array list of items
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items, style: TextStyle(color: Colors.white)),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        },
      ),
    );
  }
}
