import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Cashinoutc extends StatefulWidget {
  const Cashinoutc({Key? key}) : super(key: key);

  @override
  _CashinoutcState createState() => _CashinoutcState();
}

class _CashinoutcState extends State<Cashinoutc> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:   EdgeInsets.all(8.0),
                  child: Container(
                    height: 41,
                    width: Get.width,
                    color: Kdblue,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Image.asset("asset/dollar.png"),
                        SizedBox(width: 15,),
                        Text("Cash In/Out",style: TextStyle(color: Colors.white,fontSize: 20,),),
                        SizedBox(width: 210),
                        Padding(
                          padding:   EdgeInsets.only(right: 8.0),
                          child: Image.asset("asset/arows .png"),
                        )
                      ],
                    ),
                  ),
                ),
                Text("Rs. 40,000/-",style: TextStyle(color: kyellow,fontSize: 35),),

                Padding(
                  padding:   EdgeInsets.only(left: 50.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Method",style: TextStyle(color: kblue,fontSize: 15),)),
                ),
                Container(
                  height: 300,width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),color:Kdblue,
                  ),
                )




              ],
            ),
          ),
        ),
      ),


    );
  }
}
