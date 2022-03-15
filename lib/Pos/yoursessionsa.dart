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
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text("Your Sessions",style: TextStyle(color: kblue,fontSize: 35),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: (){

                      print('clickedf');


                      showDialog(context: context, builder: (context){
                        return    StatefulBuilder(
                            builder: (context, setState1) {
                              return AlertDialog(
                                contentPadding : EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 400,
                                        height: 400,

                                        child:Padding(
                                          padding:  EdgeInsets.only(top: 0),
                                          child: Column(

                                            children: [

                                              Align(
                                                alignment: Alignment(1.0, 10.0)    ,


                                                child: InkWell(
                                                  onTap: (){
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                    height: 60,
                                                    width: Get.width,
                                                    decoration: BoxDecoration(

                                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
                                                            topRight: Radius.circular(25)),color:Kdblue
                                                    ),
                                                    child: Center(child: Text("Open Cash Control",
                                                      style: TextStyle(color: Colors.white,fontSize:30 ),)),
                                                  ),
                                                ),

                                              ),
                                              Padding(
                                                padding:  EdgeInsets.all(8.0),
                                                child: Container(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text('Open Cash',style: TextStyle(fontSize: 15,color: kblue),),
                                                        ],
                                                      ),
                                                      Divider(
                                                        height: 5,thickness: 1,color: kblue
                                                      ),
                                                      SizedBox(height:5,width: 15,),
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: 45,
                                                              width: 250,

                                                              child: TextFormField(
                                                                decoration: InputDecoration(
                                                                    filled: true,
                                                                    fillColor: bgGrey,

                                                                    border: OutlineInputBorder(
                                                                      borderSide: BorderSide(color: Colors.white),
                                                                      borderRadius: BorderRadius.all(Radius.circular(10)),

                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(color: Colors.white),
                                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                    ),
                                                                    enabledBorder:OutlineInputBorder(
                                                                      borderSide: BorderSide(color: Colors.white),
                                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                    )

                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Image.asset("asset/calc.png")
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 150,
                                                        child: TextFormField(

                                                          decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: bgGrey,


                                                              border: OutlineInputBorder(
                                                                borderSide: BorderSide(color: Colors.white),
                                                                borderRadius: BorderRadius.all(Radius.circular(10)),

                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(color: Colors.white),
                                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              ),
                                                              enabledBorder:OutlineInputBorder(
                                                                borderSide: BorderSide(color: Colors.white),
                                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              )

                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          ElevatedButton(onPressed: (){
                                                            Get.back();
                                                          },

                                                              style: ElevatedButton.styleFrom(
                                                                  elevation: 0,
                                                                  shape:RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                                                  ),
                                                                  side: BorderSide(width: 3.0, color: kblue ),
                                                                  primary: Colors.white,
                                                                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 11),
                                                                  textStyle: TextStyle(
                                                                      fontSize: 30,
                                                                      fontWeight: FontWeight.bold)),
                                                              child: Center(child: Text('< Back',style: TextStyle(
                                                                  color: kblue,fontSize: 15
                                                              ),))),
                                                          SizedBox(width: 25,),
                                                          InkWell(
                                                            onTap: (){

                                                            },
                                                            child: Container(
                                                              width: 110,
                                                              height: 41,
                                                              decoration: BoxDecoration(
                                                                gradient: LinearGradient(
                                                                  colors: [
                                                                    Colors.blue.shade900,
                                                                    Colors.blue,
                                                                  ],
                                                                  begin: Alignment.topLeft,
                                                                  end: Alignment.bottomRight,
                                                                ),
                                                                borderRadius: BorderRadius.circular(10),


                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Center(
                                                                  child: Text('Duplicate',style: TextStyle(
                                                                      color: Colors.white,fontSize: 15
                                                                  ),),
                                                                ),
                                                              ),

                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      });
                    },
                    child: Container(
                      height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),color: Kdblue
                      ),
                      child: Center(
                          child: Center(child: Text("Open Your Sessions",style: TextStyle(color: Colors.white,fontSize: 22),)),),
                    ),
                  ),
                  SizedBox(height: 30,),

                  Row(
                    children: [
                      Text("Past sessions",style: TextStyle(color:kblue,fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 5),
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
