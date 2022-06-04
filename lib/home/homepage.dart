import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/Controllers/myempcontroller.dart';
import 'package:revoo/HRMS_admin_Screen/LocationHistory/tripuser.dart';
import 'package:revoo/HRMS_admin_Screen/Reports/reports.dart';
import 'package:revoo/HRMS_admin_Screen/adbranchpg4.dart';
import 'package:revoo/HRMS_admin_Screen/allDepartmetns.dart';
import 'package:revoo/HRMS_admin_Screen/employeecheckin.dart';
import 'package:revoo/Purchasing/reports.dart';
import 'package:revoo/constants/commonWidgets.dart';
import 'package:revoo/home/admindashboard.dart';
import '../HRMS_admin_Screen/SHift/Shifts.dart';
import '../HRMS_admin_Screen/acceptleaverequest.dart';
import '../HRMS_admin_Screen/allEmployee.dart';
import '../HRMS_admin_Screen/allemployeeupdates.dart';
import '../HRMS_admin_Screen/checkinhistory.dart';
import '../HRMS_admin_Screen/plans/myplan.dart';
import '../constants/constants.dart';


class HomePageMain extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;
  const HomePageMain({Key? key,required this.userDoc}) : super(key: key);

  @override
  _HomePageMainState createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {

  GlobalKey<ScaffoldState> scafkey = GlobalKey<ScaffoldState>();
  var selectedCard = 'Home'; //for changing name
  var selectedindex = 0; //for changing index of page



  @override
  Widget build(BuildContext context) {

    var homepages = [
      AdminDashboard(userDoc: widget.userDoc,),//0
      MyPlan(userDoc: widget.userDoc,),//1
      AdminDashboard(userDoc: widget.userDoc,),//2
      Departments(key: Key('department'),userDoc: widget.userDoc,),//3
      AllEmployeePage(userDoc: widget.userDoc,),//4
      ShiftsManagement(userDoc: widget.userDoc,),//5
      CheckinHistory(userDoc: widget.userDoc,),//6
      EmployeeCheckin(userDoc: widget.userDoc,),//7
      AcceptLeave(userDoc: widget.userDoc,),//8
      AllEmployeeUpdates(userDoc: widget.userDoc,), //9

      Container(), //10
HRMSReports(userDoc: widget.userDoc),//11
      TripUsers(userDoc: widget.userDoc),//12

    ];
    return GetX<MyEmpController>(
      init: Get.put(MyEmpController()),
      builder: (empController) {

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: InkWell(
              onTap: (){
                print('clicked');
              scafkey.currentState?.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),

                child: Image.asset('asset/navicon.png'),
              ),
            ),
            actions: [
             Text(empController.myepmlist.value.name!,style: TextStyle(color: Colors.green),),

            ],
          ),
          drawer: empController.myepmlist.value.uid == null ?
              Center(child: CircularProgressIndicator(),)
          : buildDrawer(empController),
          bottomNavigationBar: commonWidgets.buildBNB(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CommonWidgets().kfloatingButton(),

          key: scafkey,
          backgroundColor: Colors.white,
          body: homepages[selectedindex],
        );
      }
    );
  }


  buildDrawer(MyEmpController empController){

    var empmodel =  empController.myepmlist.value;

    print('empmidel = ${empmodel.uid}');

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
                                  child: Text(empmodel.name!,style: TextStyle(fontSize: 20,color: kblue),
                                      textAlign: TextAlign.left
                                  )),
                            ),
                            Container(


                                child: Text(empmodel.designation!,style: TextStyle(fontSize: 18,color: kblue),
                                    textAlign: TextAlign.left
                                )),
                            // InkWell(
                            //   onTap: (){
                            //
                            //   },
                            //   child: Container(
                            //     child: Row(
                            //       children: [
                            //         Container(
                            //             child: Text('Veiw Profile',style: TextStyle(fontSize: 15,color: kyellow),
                            //             )),
                            //         SizedBox(width: 15,),
                            //         Image.asset('asset/rightarrow.png')
                            //       ],
                            //
                            //     ),
                            //
                            //   ),
                            //
                            // ),


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
                buildNavCard('asset/lvapproval.png','My Employees',4),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/lvapproval.png','Shifts Management',5),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                SizedBox(height: 5,),
                buildNavCard('asset/lvapproval.png','Checkin History',6),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                SizedBox(height: 5,),
                buildNavCard('asset/lvapproval.png','Emp. Checkin',7),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                SizedBox(height: 5,),
                buildNavCard('asset/lvapproval.png','Accept Leave',8),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                SizedBox(height: 5,),
                buildNavCard('asset/lvapproval.png','Daily Updates',9),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/lvapproval.png','Reports',11),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/lvapproval.png','Locations History',12),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/logoff.png','Logout',10),
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
        if(index == 10){
          Get.back();
          Get.defaultDialog(title: '',content: Column(
            children: [
              Container(
                  height: 50,
                  width: 50,
                  child: ClipRRect(child: Image.asset('asset/exclamatorybx.png',fit: BoxFit.cover,))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap:(){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          child: Center(child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text('Deny',style: TextStyle(color: Kdblue),),
                          )),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Kdblue,width: 3)
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){



                      },
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          child: Center(child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text('Accept',style: TextStyle(color: Colors.white),),
                          )),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Kdblue,
                              bluess
                            ]),
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Kdblue,width: 3)
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ));

        }else{
          setState(() {
            selectedCard = name;
            selectedindex = index;
          });
          Get.back();
        }

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
