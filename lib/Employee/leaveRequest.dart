import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:revoo/constants/constants.dart';

class LeaveRequestEmployee extends StatefulWidget {
  const LeaveRequestEmployee({Key? key}) : super(key: key);

  @override
  _LeaveRequestEmployeeState createState() => _LeaveRequestEmployeeState();
}

class _LeaveRequestEmployeeState extends State<LeaveRequestEmployee> {
  bool value = false;

  var itemList = [
    'IT',
    'CIVIL'
  ];

  var selectedDepart = 'IT';

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
                    Text(
                      'Past Request',
                      style: TextStyle(
                        fontSize: 22,
                        color: kblue,
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Container(
                      color: bgGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('asset/chat.png',color: kblue,),
                                SizedBox(width: 10,),
                                Text('Track your request here',style: TextStyle(
                                  fontSize: 14,
                                  color: kblue,
                                ),),
                              ],
                            ),

                            Icon(FontAwesomeIcons.arrowRight)
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Send Request',
                          style: TextStyle(
                            fontSize: 22,
                            color: kblue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: Get.width,
                      color: Colors.white,
                      child: DropdownButton(
                      hint: Text('SELECT DEPARTMENT'),
                        icon: Icon(Icons.keyboard_arrow_down,color: Kdblue,),
                          value: selectedDepart,
                         alignment :AlignmentDirectional.center,
                        items: itemList.map((String items) {

                          return DropdownMenuItem(value: items, child: Text(items,style: TextStyle(color: kblue),));

                        }).toList(), onChanged: (String? value) {
                          setState(() {
                                selectedDepart = value!;
                          });
                      },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: Get.width,
                      color: Colors.white,
                      child: DropdownButton(
                        hint: Text('SELECT DEPARTMENT'),
                        icon: Icon(Icons.keyboard_arrow_down,color: Kdblue,),
                        value: selectedDepart,
                        alignment :AlignmentDirectional.center,
                        items: itemList.map((String items) {

                          return DropdownMenuItem(value: items, child: Text(items,style: TextStyle(color: kblue),));

                        }).toList(), onChanged: (String? value) {
                        setState(() {
                          selectedDepart = value!;
                        });
                      },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: Get.width,
                      color: Colors.white,
                      child: DropdownButton(
                        hint: Text('SELECT DEPARTMENT'),
                        icon: Icon(Icons.keyboard_arrow_down,color: Kdblue,),
                        value: selectedDepart,
                        alignment :AlignmentDirectional.center,
                        items: itemList.map((String items) {

                          return DropdownMenuItem(value: items, child: Text(items,style: TextStyle(color: kblue),));

                        }).toList(), onChanged: (String? value) {
                        setState(() {
                          selectedDepart = value!;
                        });
                      },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: Get.width,
                      color: Colors.white,
                      child: DropdownButton(
                        hint: Text('SELECT DEPARTMENT'),
                        icon: Icon(Icons.keyboard_arrow_down,color: Kdblue,),
                        value: selectedDepart,
                        alignment :AlignmentDirectional.center,
                        items: itemList.map((String items) {

                          return DropdownMenuItem(value: items, child: Text(items,style: TextStyle(color: kblue),));

                        }).toList(), onChanged: (String? value) {
                        setState(() {
                          selectedDepart = value!;
                        });
                      },
                      ),
                    ),
                    SizedBox(height: 50,)

                  ],
                ),

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
