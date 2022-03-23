import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Myapp1 extends StatefulWidget {
  const Myapp1({Key? key}) : super(key: key);

  @override
  State<Myapp1> createState() => _MyappState();
}

class _MyappState extends State<Myapp1> {

  String initialValue = 'Product category';

  var itemList = [
    'Product category',
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButton(
                isExpanded: true,
                iconEnabledColor: Colors.white,
                style: TextStyle(color: Colors.white, fontSize: 16),
                dropdownColor: Colors.green,
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





