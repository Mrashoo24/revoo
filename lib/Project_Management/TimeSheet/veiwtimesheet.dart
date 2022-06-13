import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/constants.dart';

class VeiwTimesheet extends StatefulWidget {
  const VeiwTimesheet({Key? key}) : super(key: key);

  @override
  _VeiwTimesheetState createState() => _VeiwTimesheetState();
}

class _VeiwTimesheetState extends State<VeiwTimesheet> {

  var firestore = FirebaseFirestore.instance.collection('PmAddTask').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            InkWell(
                onTap: (){

                },
                child: Text("Add Task")),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: firestore,
              builder: (context, snapshot) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.requireData.docs.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(bottom: 15),
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Kdblue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Padding(
                        padding:   EdgeInsets.all(8.0),
                        child: Column(
                          children: [

                            Row(
                              children: [
                                Text("Assign To:  ",style: TextStyle(color: kyellow, fontSize: 15),),
                                Text(
                                  snapshot.data!.docs[index]['assign_to'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Task Title:  ",style: TextStyle(color: kyellow, fontSize: 15),),
                                Text(
                                  snapshot.data!.docs[index]['task_title'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Text("Project Name:  ",style: TextStyle(color: kyellow, fontSize: 15),),
                                Text(
                                  snapshot.data!.docs[index]['project_name'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Module:  ",style: TextStyle(color: kyellow, fontSize: 15),),
                                Text(
                                  snapshot.data!.docs[index]['module_type'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                    },
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
