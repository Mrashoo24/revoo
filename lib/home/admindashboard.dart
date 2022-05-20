import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:revoo/constants/constants.dart';
import 'package:cell_calendar/cell_calendar.dart';


import '../HRMS_admin_Screen/adbranchpg2.dart';
import '../HRMS_admin_Screen/editbranch.dart';
import '../Models/attendencmodel.dart';
import '../Timer/count_down.dart';
import '../graph/piechart.dart';

class AdminDashboard extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;
  const AdminDashboard({Key key= const Key('AdminDashboard'), required this.userDoc}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int groupvalue = 0;
  int yesvslue = 0;
  int novalue = 1;

  var selectedCard = 'Home'; //for changing name
  var selectedindex = 0; //f
  GlobalKey<ScaffoldState> scafkey = GlobalKey<ScaffoldState>();

  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  var firestore = FirebaseFirestore.instance;

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RelativeRect buttonMenuPosition(BuildContext context) {
      final RenderBox bar = context.findRenderObject() as RenderBox;
      final RenderBox overlay =
      Overlay.of(context)?.context.findRenderObject() as RenderBox;
      const Offset offset = Offset(200, 200);
      final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(
          bar.localToGlobal(bar.size.center(offset), ancestor: overlay),
          bar.localToGlobal(bar.size.centerRight(offset), ancestor: overlay),
        ),
        offset & overlay.size,
      );
      return position;
    }

    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: firestore.collection('Branch').where('cid',isEqualTo: widget.userDoc.get('cid')).snapshots(),
            builder: (context, snapshot) {

              if(!snapshot.hasData){
                return kprogressbar;
              }

              var  bdoc = snapshot.requireData.docs;

              return Stack(
                children: [
                  Container(
                    width: Get.width,
                    child: ClipRRect(
                        child: Image.asset(
                          'asset/dpbrCRUD.png',
                          fit: BoxFit.fill,
                        )),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
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
                                    child: Text(
                                      'All Branches',
                                      style: TextStyle(color: kblue, fontSize: 25),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Get.to(AddBranches());
                                      },
                                      child: Image.asset('asset/addnew.png')),
                                ],
                              ),
                              SizedBox(height: 25),
                              Container(
                                width: 400,
                                height: 500,
                                decoration: BoxDecoration(
                                  color: bgGrey,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 180, top: 30, bottom: 10),
                                        child: Text(
                                          'Branch(s)',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 400,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                kblue,
                                                Kdblue,
                                              ],
                                            ),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(45),
                                                bottomRight: Radius.circular(45)),
                                          ),
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemCount: bdoc.length,
                                              itemBuilder: (context,index){
                                                return   buildListTile(
                                                    buttonMenuPosition, context,
                                                    title: bdoc[index].get('branch_name'),
                                                    tagcolor: kyellow,id:bdoc[index].id,
                                                    bdoc: bdoc[index]
                                                );
                                              }

                                          ),
                                        ),
                                      ),
                                    ],
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
              );
            }
        ),


      ),
    );
  }

  buildListTile(RelativeRect buttonMenuPosition(BuildContext context),
      BuildContext context,
      {required String title, required Color tagcolor,required id,required QueryDocumentSnapshot<Map<String, dynamic>> bdoc}) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

                 Flexible(
                   flex:1,
                   child: Text(
                    title,
                    style: TextStyle(color: Colors.white),
                ),
                 ),

              Row(
                children: [
                  SizedBox(width: 10),
                  CircleAvatar(
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: tagcolor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: AutoSizeText(
                          '1',
                          style: TextStyle(color: Colors.white, fontSize: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Employees',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      SizedBox(width: 10,),
                      IconButton(icon:Icon(Icons.edit),color: Colors.white, onPressed: () async {
                        GeoPoint geopoint = bdoc.get('location.geopoint');

                        Get.to(EditBranches(latlist:[geopoint.latitude,geopoint.longitude], name: title, address: bdoc.get('address'), id: id, locality: bdoc.get('locality')));

                      },)
                    ],
                  ),
                ],
              )


            ],
          ),

        ),
        Divider(
          height: 10,
          thickness: 4,
          color: Kdblue,
          endIndent: 10,
          indent: 10,
        ),
      ],
    );
  }


  buildDrawer(){
    return  Drawer(
      child:  Card(
        color: Colors.grey.shade200,
        shape: Border(
          right: BorderSide(style: BorderStyle.none),


        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: SingleChildScrollView(
            child: Column(

              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('asset/profile.jfif'),
                      radius: 30,
                    ),
                    SizedBox(width: 20,),
                    Align(
                      alignment: Alignment.bottomLeft,

                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text('Name of the person',style: TextStyle(fontSize: 20,color: kblue),
                                      textAlign: TextAlign.left
                                  )),
                            ),
                            Container(


                                child: Text('Role/Designation',style: TextStyle(fontSize: 18,color: kblue),
                                    textAlign: TextAlign.left
                                )),
                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                        child: Text('Veiw Profile',style: TextStyle(fontSize: 15,color: kyellow),
                                        )),
                                    SizedBox(width: 15,),
                                    Image.asset('asset/rightarrow.png')
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

                SizedBox(height: 30,),
                buildNavCard('asset/home.png','My Account',0),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/checkgrp.png','My Plan',1),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/checkpad.png','My Branches',2),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/lvapproval.png','My Departments',3),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/lvapproval.png','My Employees',3),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/lvapproval.png','Shifts Management',3),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                SizedBox(height: 5,),
                buildNavCard('asset/lvapproval.png','Help',3),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),

                buildNavCard('asset/logoff.png','Logout',4),
                SizedBox(height: 5,),


              ],
            ),
          ),

        ),

      ),
    );
  }


  buildNavCard(String image,String name,index) {

    return InkWell(
      onTap: (){
        setState(() {
          selectedCard = name;
          selectedindex = index;
        });
        Get.back();
      },
      child: Card(
        color: selectedCard == name ?  Colors.white : bgGrey,
        elevation: selectedCard == name ? 2 : 0,
        child: Container(
          height: 70,
          child: Padding(

            padding: const EdgeInsets.only(left: 15.0,top: 10,bottom: 10,right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Image.asset(image,color: Kdblue,width: 20,height: 20,),

                SizedBox(width: 10,),

                Text(name,style: TextStyle(color: Colors.grey,fontSize: 20),),

              ],
            ),
          ),
        ),

      ),
    );
  }

}
