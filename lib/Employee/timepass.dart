import 'package:flutter/material.dart';



class CheckBoxRightSide extends StatefulWidget {
  @override
  CheckBoxRightSideState createState() {
    return new CheckBoxRightSideState();
  }
}

class CheckBoxRightSideState extends State<CheckBoxRightSide> {
  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text(
              'Select Item',
              style: TextStyle(
                fontSize: 14,
                color: Theme
                    .of(context)
                    .hintColor,
              ),
            ),
            items: items
                .map((item) =>
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },

          ),
        ),
      ),
    );
  }

}


