import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/constants.dart';

class VeiwMeetings extends StatefulWidget {
  const VeiwMeetings({Key? key}) : super(key: key);

  @override
  State<VeiwMeetings> createState() => _VeiwMeetingsState();
}

class _VeiwMeetingsState extends State<VeiwMeetings> {

  var firestore = FirebaseFirestore.instance.collection('').snapshots();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Kdblue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Padding(
                          padding:   EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Project Meetings',
                                    style: TextStyle(color: Colors.yellow.shade600, fontSize: 22,),),
                                  SizedBox(width: 10,),
                                  Container(width: 120, height: 22, decoration: BoxDecoration(color: kyellow,
                                    borderRadius: BorderRadius.circular(5),
                                  ), child: Center(child: Text('Meeting Details', style: TextStyle(
                                      color: Colors.black, fontSize: 15),),),),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Text("Date:  ",style: TextStyle(fontSize: 15,color: kyellow),),
                                  Text("12/13/2022",style: TextStyle(fontSize: 15,color: Colors.white),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Venue:  ",style: TextStyle(fontSize: 15,color: kyellow),),
                                  Text("Block C -1stfloor",style: TextStyle(fontSize: 15,color: Colors.white),),
                                ],
                              )
                            ],
                          ),
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

    );
  }
}
