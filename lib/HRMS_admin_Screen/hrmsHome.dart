import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HrmsHomePage extends StatefulWidget {
  const HrmsHomePage({Key? key}) : super(key: key);

  @override
  _HrmsHomePageState createState() => _HrmsHomePageState();
}

class _HrmsHomePageState extends State<HrmsHomePage> {

  var widgetList = [

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hrmsAppbar(),

        body: Container()
    );
  }
}

hrmsAppbar(){
  Align(
    alignment: Alignment.topCenter,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: (){
                print('clicked');
              },
              child: Image.asset('asset/navicon.png',)),
          Row(
            children: [
              SizedBox(width: 110),
              Image.asset('asset/bellicon.png'),
              SizedBox(width: 20),
              Image.asset('asset/settingsicon.png'),
              SizedBox(width: 20),
              Image.asset('asset/usericon.png'),
            ],
          ),

        ],
      ),
    ),
  );
}
