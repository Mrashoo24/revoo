import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  String initialValue = '';

  var itemList = [
    '',
    'Std1',
    'Std2',
    'Std3',
    'Std4',
    'Std5',
    'Std6',
    'Std7'
  ];





  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: new Text('DropDownList - FlutterCorner'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.grey,
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 35,
              width: 160,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),

              margin: EdgeInsets.symmetric(horizontal: 20),

              child: DropdownButton(
                isExpanded: true,
                iconEnabledColor: Colors.black,
                style: TextStyle(color: Colors.black, fontSize: 19),
                dropdownColor: Colors.white70,
                focusColor: Colors.black,
                value: initialValue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: itemList.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(), onChanged: (String? value) {  },

              ),
            )

          ],
        ),
      ),
    );
  }
}





