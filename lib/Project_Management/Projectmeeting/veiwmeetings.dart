import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/Project_Management/Projectmeeting/projectmeetings.dart';

import '../../constants/constants.dart';

class VeiwMeetings extends StatefulWidget {
  const VeiwMeetings({Key? key}) : super(key: key);

  @override
  State<VeiwMeetings> createState() => _VeiwMeetingsState();
}

class _VeiwMeetingsState extends State<VeiwMeetings> {

  var firestore = FirebaseFirestore.instance.collection('Addmeetings').snapshots();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            InkWell(
                onTap: (){
                  Get.to(ProjectMeetings());
                },
                child: Text("Add Meetings")),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: firestore,
                        builder: (context,snapshot) {
                        if(!snapshot.hasData){
                          return Text("no data");
                        }
                      return ListView.builder(

                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.requireData.docs.length,
                          itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 15),
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
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]['project_name'],
                                            style: TextStyle(
                                              color: Colors.yellow.shade600,
                                              fontSize: 22,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.defaultDialog(

                                                radius: 5,
                                                  backgroundColor: Kdblue,
                                                title: "Meeting Details",
                                                titleStyle: TextStyle(color: kyellow),
                                                 content: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          OrderFields('Projecte Name: '),
                                                          Text(
                                                            snapshot.data!.docs[index]['project_name'],

                                                            style: TextStyle(
                                                                color: Colors.white, fontSize: 12),

                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          OrderFields('Prepared By: '),
                                                          Text(
                                                            snapshot.data!.docs[index]['prepared_by'],
                                                            style: TextStyle(
                                                                color: Colors.white, fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          OrderFields('Presenter Name: '),
                                                          Text(
                                                            snapshot.data!.docs[index]['presenter_name'],
                                                            style: TextStyle(
                                                                color: Colors.white, fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          OrderFields('Attendees Name: '),
                                                          Text (
                                                            snapshot.data!.docs[index]['attend_name'],
                                                            style: TextStyle(
                                                                color: Colors.white, fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          OrderFields('Agenda: '),
                                                          Text(
                                                            snapshot.data!.docs[index]['agenda'],
                                                            style: TextStyle(
                                                                color: Colors.white, fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          OrderFields('Meeting: '),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: Get.width*0.8,
                                                            child: Text(
                                                              snapshot.data!.docs[index]['meeting'],
                                                              style: TextStyle(
                                                                  color: Colors.white, fontSize: 12),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          OrderFields('Description: '),

                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          buildText(snapshot, index),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10),
                                                      InkWell(
                                                        onTap: (){
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          width: 80,
                                                          height: 22,
                                                          decoration: BoxDecoration(
                                                            color:clo,
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Back',
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 15),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              );
                                            },
                                            child: Container(
                                              width: 120,
                                              height: 22,
                                              decoration: BoxDecoration(
                                                color: kyellow,
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Meeting Details',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Text(
                                            "Date:  ",
                                            style: TextStyle(
                                                fontSize: 15, color: kyellow),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]['date'],
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Venue:  ",
                                            style: TextStyle(
                                                fontSize: 15, color: kyellow),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]['venue'],
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.white),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );

                      });}
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

  Text buildText(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot, int index) {
    return Text(
                                                          snapshot.data!.docs[index]['description'],
                                                          style: TextStyle(
                                                              color: Colors.white, fontSize: 12),
                                                        );
  }

  Text OrderFields(text) {
    return Text(
      text,
      style: TextStyle(
        color: kyellow,
        fontSize: 12,
      ),
    );
  }
}
