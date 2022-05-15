import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Yoursessionsb extends StatefulWidget {
  const Yoursessionsb({Key? key}) : super(key: key);

  @override
  _YoursessionsbState createState() => _YoursessionsbState();
}

class _YoursessionsbState extends State<Yoursessionsb> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text("Your Sessions",style: TextStyle(color: kblue,fontSize: 35),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Text("Current sessions",style: TextStyle(color:kblue,fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 150,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/backgrnimgbox.png"), fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text("Opening Date:",style: TextStyle(color: Colors.white,fontSize: 20),),

                              SizedBox(width: 70,),
                              Text("Feb 19, 22",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                          // SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Opening Date:",style: TextStyle(color: Colors.white,fontSize: 20),),

                              SizedBox(width: 70,),
                              Text("Rs.500/-",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 40,
                                width: 130,

                                child: ElevatedButton(onPressed: (){

                                },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape:RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(15))
                                      ),
                                      side: BorderSide(width: 3.0, color: Colors.white ),
                                      primary: sblue,
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  child: Center(child: Text('Print Invoice',style: TextStyle(
                                      color: Colors.white,fontSize: 15
                                  ),
                                  ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                  Row(
                    children: [
                      Text("Past sessions",style: TextStyle(color:kblue,fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 250,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/backgrnimgbox.png"), fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text("Opening Date:",style: TextStyle(color: Colors.white,fontSize: 20),),

                              SizedBox(width: 70,),
                              Text("Feb 19, 22",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                          // SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Opening Date:",style: TextStyle(color: Colors.white,fontSize: 20),),

                              SizedBox(width: 70,),
                              Text("Feb 19, 22",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                          // SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Opening Date:",style: TextStyle(color: Colors.white,fontSize: 20),),

                              SizedBox(width: 70,),
                              Text("Rs.500/-",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                          // SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Opening Date:",style: TextStyle(color: Colors.white,fontSize: 20),),

                              SizedBox(width: 70,),
                              Text("Rs.520/-",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                          // SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Opening Date:",style: TextStyle(color: Colors.white,fontSize: 20),),

                              SizedBox(width: 70,),
                              Text("Rs.20/-",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 40,
                                width: 130,

                                child: ElevatedButton(onPressed: (){

                                },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape:RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(15))
                                      ),
                                      side: BorderSide(width: 3.0, color: Colors.white ),
                                      primary: sblue,
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  child: Center(child: Text('Print Invoice',style: TextStyle(
                                      color: Colors.white,fontSize: 15
                                  ),
                                  ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                  Container(
                    height: 250,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/backgrnimgbox.png"), fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text("Opening Date:",style: TextStyle(color: Colors.white,fontSize: 20),),

                              SizedBox(width: 70,),
                              Text("Feb 19, 22",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                          // SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Opening Date:",style: TextStyle(color: Colors.white,fontSize: 20),),

                              SizedBox(width: 70,),
                              Text("Feb 19, 22",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                          // SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Opening Date:",style: TextStyle(color: Colors.white,fontSize: 20),),

                              SizedBox(width: 70,),
                              Text("Rs.500/-",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                          // SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Opening Date:",style: TextStyle(color: Colors.white,fontSize: 20),),

                              SizedBox(width: 70,),
                              Text("Rs.520/-",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                          // SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Opening Date:",style: TextStyle(color: Colors.white,fontSize: 20),),

                              SizedBox(width: 70,),
                              Text("Rs.20/-",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 40,
                                width: 130,

                                child: ElevatedButton(onPressed: (){

                                },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape:RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(15))
                                      ),
                                      side: BorderSide(width: 3.0, color: Colors.white ),
                                      primary: sblue,
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  child: Center(child: Text('Print Invoice',style: TextStyle(
                                      color: Colors.white,fontSize: 15
                                  ),
                                  ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
