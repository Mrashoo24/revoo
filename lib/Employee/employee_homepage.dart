import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/Controllers/authcontroller.dart';
import 'package:revoo/Employee/dailyupdates.dart';
import 'package:revoo/Employee/employeedash1stpg.dart';
import 'package:revoo/Employee/leaveRequest.dart';
import 'package:revoo/Employee/watchdashboard.dart';
import '../constants/commonWidgets.dart';
import '../constants/constants.dart';
import 'Certificate/certificate.dart';
import 'employeedash202.dart';

class EmployeeHomePage extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;

  const EmployeeHomePage({Key? key, required this.userDoc}) : super(key: key);

  @override
  _EmployeeHomePageState createState() => _EmployeeHomePageState();
}

class _EmployeeHomePageState extends State<EmployeeHomePage> {
  GlobalKey<ScaffoldState> scafkey = GlobalKey<ScaffoldState>();
  var selectedCard = 'Home'; //for changing name
  var selectedindex = 0; //for changing index of page

  late String email;




  @override
  Widget build(BuildContext context) {
    var homepages = [
      EmployeeDashboard1(userDoc: widget.userDoc,), //0
      // Watchdashboard(),
      // Dailyupdates(), //1
      LeaveRequestEmployee(userDoc: widget.userDoc,),
      Certificate(),

    ];



    return Scaffold(
      key: scafkey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            scafkey.currentState?.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),

            child: Image.asset('asset/navicon.png'),
          ),
        ),
        actions: [
          Image.asset('asset/bellicon.png'),
          Image.asset('asset/settingsicon.png'),
          Image.asset('asset/usericon.png'),
          SizedBox(width: 12,),
        ],
      ),
      bottomNavigationBar: commonWidgets.buildBNB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CommonWidgets().kfloatingButton(),

      drawer: Drawer(
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
                  buildNavCard('asset/home.png','Home',0),
                  // SizedBox(height: 5,),
                  // Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                  // buildNavCard('asset/checkgrp.png','Daily Logins',1),
                  // SizedBox(height: 5,),
                  // Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                  // buildNavCard('asset/checkpad.png','Daily Updates',1),
                  SizedBox(height: 5,),
                  Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                  buildNavCard('asset/lvapproval.png','Leave Request/\nApprovals',1),
                  SizedBox(height: 5,),
                  Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                  buildNavCard('asset/lvapproval.png','Certificates',2),
                  SizedBox(height: 5,),
                  Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                  buildNavCard('asset/logoff.png','Logout',2),
                  SizedBox(height: 5,),


                ],
              ),
            ),

          ),

        ),
      ),
      body: homepages[selectedindex],
    );
  }

  buildNavCard(String image,String name,index) {

    return InkWell(
      onTap: (){
        setState(() {
          selectedCard = name;
          selectedindex = index;
        });

        name == "Logout" ?
            AuthController.instance.logout()
            : print('');

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
