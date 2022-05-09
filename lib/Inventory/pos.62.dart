import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Pos62 extends StatefulWidget {
  const Pos62({Key? key}) : super(key: key);

  @override
  _Pos62State createState() => _Pos62State();
}

class _Pos62State extends State<Pos62> {
  get asset => null;

  @override
  Widget build(BuildContext context) {
    var smalllogo;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            height: 41,
            width: Get.width,
            color: kblue,

            child: Row(
              children: [
                SizedBox(width: 10),
                Image.asset("asset/smalllogo.png",),
                SizedBox(width: 10),

    Text("Cash in/out",style: TextStyle(color: Colors.white),),
                SizedBox(width: 225),

                Image.asset("asset/backbutton.png"),

              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 40,
            width: 255,
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: bgGrey,
                    contentPadding: EdgeInsets.only(left: 35,top: 3,bottom: 25),
                    hintText: 'Search product....',

                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),

                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),



                    suffixIcon: Icon(Icons.search,)


                ),
              ),
            ),

          ),
          SizedBox(height: 15),


          Row(
            children: [


              Container(
            height: 100,
            width: 100,
            color: Colors.green,
                
          ),

            ],
          ),

        ],
      ),
    )
    );
  }
}
