import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:revoo/piechart.dart';

import '../constants/constants.dart';
import 'employeedash1stpg.dart';

class Watchdashboard extends StatefulWidget {
    Watchdashboard({Key? key}) : super(key: key);



  @override
  _EmployeeDashboardState createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<Watchdashboard> {

  final cellCalendarPageController = CellCalendarPageController();

  GlobalKey<ScaffoldState> scafkey = GlobalKey<ScaffoldState>();
  var selectedCard = 'Home'; //for changing name
  var selectedindex = 0; //
  var homepages = [
    EmployeeDashboard1stpg(), //0
    Container(), //1
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [


                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10,),
                          Text('Daily Check-in ',style: TextStyle(color: kblue ,fontSize: 30),),
                          Text(' February 07, 12',style: TextStyle(color: kblue ,fontSize: 18),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: Get.width*0.1,right: Get.width*0.1),
                            child: Divider(color: ktextcolor,),
                          ),

                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:   EdgeInsets.only(left:Get.width*0.125),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('In-Time',style: TextStyle(color: kblue,fontSize: 18),),
                                      SizedBox(width: 15),
                                      Container(
                                        height: Get.height*0.05,
                                        width: Get.width*0.09,
                                        color: Colors.indigo.shade50,
                                        child: Center(child: Text('08',style: TextStyle(color: kblue,fontSize: 18),)),
                                      ),
                                      SizedBox(width: 15),
                                      Container(
                                        height: Get.height*0.05,
                                        width: Get.width*0.09,
                                        color: Colors.indigo.shade50,
                                        child: Center(child: Text('20',style: TextStyle(color: kblue,fontSize: 18),)),
                                      ),

                                      SizedBox(width: 15),
                                      Container(
                                        height: Get.height*0.05,
                                        width: Get.width*0.18,
                                        color: Colors.indigo.shade50,
                                        child: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('AM',style: TextStyle(color: kblue,fontSize: 18),),
                                              SizedBox(width: 10,),
                                              Image.asset('asset/smallarrowdown.png'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15,),
                                      Image.asset('asset/bluepencil.png'),
                                    ],





                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:   EdgeInsets.only(left:Get.width*0.09),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Out Time',style: TextStyle(color: kblue,fontSize: 18),),
                                  SizedBox(width: 15),
                                  Container(
                                    height: Get.height*0.05,
                                    width: Get.width*0.09,
                                    color: Colors.indigo.shade50,
                                    child: Center(child: Text('--',style: TextStyle(color: kblue,fontSize: 18),)),
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                    height: Get.height*0.05,
                                    width: Get.width*0.09,
                                    color: Colors.indigo.shade50,
                                    child: Center(child: Text('--',style: TextStyle(color: kblue,fontSize: 18),)),
                                  ),

                                  SizedBox(width: 15),
                                  Container(
                                    height: Get.height*0.05,
                                    width: Get.width*0.18,
                                    color: Colors.indigo.shade50,
                                    child: Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('--',style: TextStyle(color: kblue,fontSize: 18),),
                                          SizedBox(width: 10,),
                                          Image.asset('asset/smallarrowdown.png'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16,),
                                  Image.asset('asset/bluepencil.png'),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),

                          Text ('Total hours:',style: TextStyle(color: kblue,fontSize: 18,),textAlign: TextAlign.right,),
                          Row(
                            mainAxisSize: MainAxisSize.min
                            ,
                            children: [
                              Container(
                                height: Get.height*0.05,
                                width: Get.width*0.20,
                                color: Colors.indigo.shade50,
                                child: Center(child: Text('05: 00',style: TextStyle(color: kblue,fontSize: 18),textAlign: TextAlign.right,)),

                              ),
                              Center(child: Text(' hrs.',style: TextStyle(color:  kblue,fontSize: 18),)),


                              SizedBox(width: 12,),
                              Image.asset('asset/watch.png')

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 35.0,top: 35),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(onPressed: (){

                                },

                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape:RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10))
                                        ),
                                        side: BorderSide(width: 3.0, color: Colors.white,),
                                        primary: Kdblue,
                                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 11),
                                        textStyle: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                    child: Center(child: Text('Check-in',style: TextStyle(
                                        color: Colors.white,fontSize: 15
                                    ),))),
                                SizedBox(width: 25,),
                                ElevatedButton(onPressed: (){},

                                    style: ElevatedButton.styleFrom(
                                        shape:RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10))
                                        ),
                                        primary: Colors.white,
                                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 11),
                                        textStyle: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                    child: Center(child: Text('Check-out',style: TextStyle(
                                        color: Kdblue,fontSize: 15

                                    ),)))




                              ],



                            ),


                          ),
                          Card(
                            elevation: 10,
                            color: Kdblue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding:   EdgeInsets.symmetric(horizontal: 8.0,vertical: Get.height*0.05),
                              child: Row(
                                children:[

                                  Expanded(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 12,),
                                        Text("In-time Status",
                                          style: TextStyle(
                                              color: Colors.white,fontSize: 12
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text("Late",
                                          style: TextStyle(
                                              color: Colors.yellow.shade700,fontSize: 25
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                                          child: TextField(
                                            decoration: InputDecoration(fillColor: Colors.indigo.shade50, filled: true,hintText: "Type your reason"),

                                          ),

                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 12,),
                                        Text("Out-time Status",
                                          style: TextStyle(
                                              color: Colors.white,fontSize: 12
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text("Late",
                                          style: TextStyle(
                                              color: Colors.yellow.shade700,fontSize: 25
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                                          child: TextField(
                                            decoration: InputDecoration(fillColor: Colors.indigo.shade50, filled: true,hintText: "Type your reason"),

                                          ),

                                        ),
                                      ],
                                    ),
                                  ),


                                ],

                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                child:  Text("Past Logins",
                                  style: TextStyle(
                                      color: kblue,fontSize: 17
                                  ),

                                ),),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0,top: 15,right: 10,left: 10),
                              child: Card(
                                elevation: 10,
                                color: Colors.grey.shade200,

                                child: Column(
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('asset/smallclock.png'),
                                              SizedBox(width: 5,),
                                              Text("Access your pass logins",
                                                style: TextStyle(
                                                    color: kblue,fontSize: 15
                                                ),

                                              ),
                                            ],
                                          ),

                                          Image.asset('asset/bluearow.png')
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],

                      ),

                    ),



                  ],
                ),
              ),
            ),
            Card(
              elevation: 10,
              color: Kdblue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  Container(
                    width:Get.width,
                    child: Center(
                      child: Text("This Week",
                        style: TextStyle(
                            color: Colors.white,fontSize: 25
                        ),

                      ),

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 12,),
                          Text("Total Hours",
                            style: TextStyle(
                                color: Colors.white,fontSize: 10
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text("Late",
                            style: TextStyle(
                                color: Colors.yellow.shade700,fontSize:  20
                            ),
                          ),
                        ],
                      ),

                      Container(
                        height: 80,
                        padding: const EdgeInsets.all(10),
                        child: VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 20,
                          endIndent: 0,
                          width: 5,
                        ),
                      ),

                      Column(
                        children: [
                          SizedBox(height: 12,),
                          Text('Total Absents',style: TextStyle(color: Colors.white,fontSize: 10),),
                          Text("Late",
                            style: TextStyle(
                                color: Colors.yellow.shade700,fontSize:  20
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 80,
                        padding: const EdgeInsets.all(10),
                        child: VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 20,
                          endIndent: 0,
                          width: 5,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 12,),
                          Text('Late Logins',style: TextStyle(color: Colors.white,fontSize: 10),),
                          Text("Late",
                            style: TextStyle(
                                color: Colors.yellow.shade700,fontSize:  20
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 80,
                        padding: const EdgeInsets.all(10),
                        child: VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 20,
                          endIndent: 0,
                          width: 5,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 12,),
                          Text('Early Exits',style: TextStyle(color: Colors.white,fontSize: 10),),
                          Text("Late",
                            style: TextStyle(
                                color: Colors.yellow.shade700,fontSize: 20
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],

        ),

      ),
    );
  }

  Padding buildCard(String title,String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,bottom: 15),
      child: Card(
        elevation: 10,
        child:Stack(
          children: [
            Container(
              width: Get.width,

              child: ClipRect(child: Image.asset("asset/cardbg.png",fit: BoxFit.fill,)),


            ),
            Column(
              children: [
                Align(
                  child: Padding(
                    padding:  EdgeInsets.only(top: 20,right: 25),
                    child: Text (title,style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
                  alignment: Alignment.topRight,

                ),
                Align(
                  child: Padding(
                    padding:  EdgeInsets.only(top: 40,left: 25,bottom: 20),
                    child: Text (subtitle,style: TextStyle(color: kblue,fontSize: 25),),
                  ),
                  alignment: Alignment.bottomLeft,

                ),

              ],

            ),



          ],
        ),


      ),
    );

  }
}
