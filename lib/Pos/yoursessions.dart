import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Yoursessions extends StatefulWidget {
  const Yoursessions({Key? key}) : super(key: key);

  @override
  _YoursessionsState createState() => _YoursessionsState();
}

class _YoursessionsState extends State<Yoursessions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text("Your Sessions",style: TextStyle(color: kblue,fontSize: 35),
                ),
                SizedBox(height: 30),
                Container(
                  height: 35,
                  width: Get.width,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(15),color: Kdblue
                  ),
                  child: Center(
                      child: Column(
                        children: [
                          Text("Open Your Sessions",style: TextStyle(color: Colors.white),),

                        ],
                      ),),
                ),SizedBox(height: 10,),

                Text("Past sessions",style: TextStyle(color: Colors.blue),),

                SizedBox(height: 20),


                Container(
                  height: 300,
                  width: Get.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.shade900,
                          Colors.white,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),color: Kdblue
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Opening date:",style: TextStyle(color: Colors.white,fontSize: 20),

                            ), SizedBox(width: 40,),
                            Text("Feb 19,22",style: TextStyle(color: Colors.white,fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        Row(
                          children: [
                            Text("Closing date:",style: TextStyle(color: Colors.white,fontSize: 20),

                            ), SizedBox(width: 40,),
                            Text("Feb 19,22",style: TextStyle(color: Colors.white,fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        Row(
                          children: [
                            Text("Cash in:",style: TextStyle(color: Colors.white,fontSize: 20),

                            ), SizedBox(width: 40,),
                            Text("Feb 19,22",style: TextStyle(color: Colors.white,fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        Row(
                          children: [
                            Text("Cash out:",style: TextStyle(color: Colors.white,fontSize: 20),

                            ), SizedBox(width: 40,),
                            Text("Feb 19,22",style: TextStyle(color: Colors.white,fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        Row(
                          children: [
                            Text("Difference:",style: TextStyle(color: Colors.white,fontSize: 20),

                            ), SizedBox(width: 40,),
                            Text("Feb 19,22",style: TextStyle(color: Colors.white,fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
