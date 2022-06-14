import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:revoo/constants/constants.dart';

import '../projectDashboard.dart';
import 'Addtask.dart';

class AllTasks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _showTasks();
}

class _showTasks extends State<AllTasks> {
  bool value = false;
  var firebase = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            Text(
              'Project Name',
              style: TextStyle(
                fontSize: 22,
                color: kblue,
              ),
            ),
            Text(
              'Your role/Designation',
              style: TextStyle(
                fontSize: 16,
                color: Kdblue,
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 120,
              width: Get.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _dailCard('To-do', 20),
                  _dailCard('Completed', 5),
                  _dailCard('In-Review', 25),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today\'s Tasks',
                      style: TextStyle(
                        fontSize: 22,
                        color: kblue,
                      ),
                    ),
                    IconButton(
                      onPressed: () {Get.to(AddNewTask());},
                      icon: Image.asset(
                        'asset/addicon.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),

                  ],
                ),
                Divider(
                  thickness: 2,
                ),
              ],
            ),
            Container(
              height: Get.height * 0.5,
              //color: Colors.black,
              child: StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
                stream:  firebase.collection('Addtask').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData){
                    return Center(child: Container(child: Text('Loading Data....')));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder:(context, index) {
                     return _TasksCard(snapshot.data!.docs[index]["task_title"],
                     );
                    },
                    // scrollDirection: Axis.vertical,
                    // _TasksCard('Taske name 2'),
                    //   _TasksCard('Taske name 3'),
                    //   _TasksCard('Taske name 5'),
                    //   _TasksCard('Taske name 4'),
                    //   _TasksCard('Taske name 4'),
                    //   _TasksCard('Taske name 4'),

                  );
                }
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget _TasksCard(name) {
    return Container(
      height: 70,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: kblue,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
              value: value,
              checkColor: Colors.black,
              activeColor: Colors.white,
              side: BorderSide(color: Colors.white),
              onChanged: (changevalue) {
                setState(() {
                  value = changevalue!;
                });
              }),
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Text(
                '$name',
                style: TextStyle(color: kyellow, fontSize: 16),
              ),
              Text(
                '\nloersom ipsum fhgugu gugbug ubgualf \n alfur ifuvuv usb oshane',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          ImageIcon(
            AssetImage('asset/threedots.png'),
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _dailCard(name, number) {
    return Container(
      width: 120,
      height: 80,
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/userTEamsbackground.png'),
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$name',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  'asset/EllipseforuserTeams.png',
                  fit: BoxFit.fitWidth,
                ),
                Image.asset('asset/EllipsesmallForuserTeams.png'),
                Text('$number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
    );
  }
}


