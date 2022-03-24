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

  DateTime date = DateTime(2022, 12, 24);

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
                                child: Text('Select Accounting Year',style: TextStyle(fontSize: 20,color:kblue ),)),
                            Divider(
                              height: 5,thickness: 1,color: kblue,
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 37,
                              width: Get.width,



                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(5),color: bgGrey,),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${date.day}/${date.month}/${date.year}",
                                    style: TextStyle(fontSize: 20,color: kblue),

                                  ),
                                  InkWell
                                    (
                                      onTap: () async {
                                        DateTime? newDate = await showDatePicker(
                                            context: context, initialDate: date,
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100),

                                        );

                                        if (newDate == null) return;

                                        setState(() => date = newDate );
                                      },
                                      child: Icon(Icons.calendar_today_outlined,color: kblue,))
                                ],

                              ),

                            ),

                            SizedBox(height: 40),
                            Container(
                              child: Column(

                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Income",style: TextStyle(color: kblue,fontSize: 20),),
                                      Text("\$15,50800",style: TextStyle(color: kyellow,fontSize: 20),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Income",style: TextStyle(color: kblue,fontSize: 20),),
                                      Text("\$15,50800",style: TextStyle(color: kyellow,fontSize: 20),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Province",style: TextStyle(color: kblue,fontSize: 20),),
                                      Text("Toronto",style: TextStyle(color: kyellow,fontSize: 20),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(height: 140,width: Get.width,
                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color: bgGrey,),
                              child: Padding(
                                padding:   EdgeInsets.only(top: 20, left: 10),
                                child: Column(

                                  children: [
                                    Row(
                                      children: [
                                        Text("Revoo",style: TextStyle(color: kblue,fontSize: 20),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("536/20, Mumbai",style: TextStyle(color: kblue,fontSize: 20),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("India",style: TextStyle(color: kblue,fontSize: 20),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("14380",style: TextStyle(color: kblue,fontSize: 20),),
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
