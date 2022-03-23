import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class TaskManagement extends StatefulWidget {
  const TaskManagement({Key? key}) : super(key: key);

  @override
  _TaskManagementState createState() => _TaskManagementState();
}

class _TaskManagementState extends State<TaskManagement> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding:   EdgeInsets.all(20.0),
            child:  SingleChildScrollView(
              child: Column(
                children: [



                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Tax Management',style: TextStyle(color:kblue,fontSize: 35),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 40),
                      Container(
                        child: Column(
                          children: [

                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Vendor Name',style: TextStyle(fontSize: 25,color:kblue ),)),
                            Divider(
                              height: 5,thickness: 1,color: kblue,
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 37,


                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                              child: TextFormField(
                                decoration: InputDecoration(

                                    filled: true,
                                    fillColor: bgGrey,
                                  icon: Icon(Icons.calendar_today_outlined,),


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
                                    ),


                                ),
                              ),
                            ),

                            SizedBox(height: 40),
                            Container(
                              child: Column(

                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Income",style: TextStyle(color: kblue,fontSize: 25),),
                                      Text("\$15,50800",style: TextStyle(color: kyellow,fontSize: 25),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Income",style: TextStyle(color: kblue,fontSize: 25),),
                                      Text("\$15,50800",style: TextStyle(color: kyellow,fontSize: 25),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Province",style: TextStyle(color: kblue,fontSize: 25),),
                                      Text("Toronto",style: TextStyle(color: kyellow,fontSize: 25),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(height: 160,width: Get.width,
                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color: bgGrey,),
                              child: Padding(
                                padding:   EdgeInsets.only(top: 20, left: 10),
                                child: Column(

                                  children: [
                                    Row(
                                      children: [
                                        Text("Revoo",style: TextStyle(color: kblue,fontSize: 25),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("536/20, Mumbai",style: TextStyle(color: kblue,fontSize: 25),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("India",style: TextStyle(color: kblue,fontSize: 25),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("14380",style: TextStyle(color: kblue,fontSize: 25),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),






                          ],
                        ),
                      ),


                    ],
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
