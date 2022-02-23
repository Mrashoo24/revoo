import 'package:flutter/material.dart';

import '../constants/constants.dart';




class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Test> {

  // Initial Selected Value

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Flexible(
              child: Container(
                width: 400,

                decoration: BoxDecoration(

                  gradient: LinearGradient(
                    colors: [
                      kblue,
                      Kdblue,
                    ],


                  ),

                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45)),

                ),child: Text(
                'Branchs(s)',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,

                ),
              ),


              ),
            ),
          ),
        ),
      ),
    );
  }
}