import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CheckBoxRightSide extends StatefulWidget {
  @override
  CheckBoxRightSideState createState() {
    return new CheckBoxRightSideState();
  }
}

class CheckBoxRightSideState extends State<CheckBoxRightSide> {
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox in Right Side "),
      ),
      body: Center(
        child: Container(
          height: 10,
          width: 20,
          child: TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: bgGrey,
                contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                hintText: 'Your Name',
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
                enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                )

            ),
          ),
        ),),
    );
  }
}