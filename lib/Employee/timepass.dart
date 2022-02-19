import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Timepas extends StatefulWidget {
  const Timepas({Key? key}) : super(key: key);

  @override
  _TimepasState createState() => _TimepasState();
}

class _TimepasState extends State<Timepas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          decoration:
          BoxDecoration(
            color: const Color(0xff7c94b6),
            image: new DecorationImage(
              fit: BoxFit.cover,
              colorFilter:
              ColorFilter.mode(Colors.orangeAccent.withOpacity(0),
                  BlendMode.dstATop),
              image: new NetworkImage(
                'http://www.server.com/image.jpg',
              ),
            ),
          ),
        margin: EdgeInsets.symmetric(vertical: 50.0),


        height: 100.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Card(

                color: Kdblue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: Text('')),
                )
            ),SizedBox(
              width : 40,),
            Card(

                color: Kdblue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: Text('')),
                )
            ),SizedBox(
              width : 40,),
            Card(

                color: Kdblue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: Text('')),
                )
            ),

          ],
        ),
      ),

    );
  }
}
