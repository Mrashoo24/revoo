import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Login/login.dart';
import '../Login/signup.dart';
import '../constants/constants.dart';
import '../constants/constants.dart';
import '../constants/constants.dart';
import '../constants/constants.dart';
import '../constants/constants.dart';
import '../constants/constants.dart';

class SelectPlans extends StatefulWidget {
  final Map cdetails ;
  const SelectPlans({Key? key, required this.cdetails}) : super(key: key);

  @override
  _SelectPlansState createState() => _SelectPlansState();
}

class _SelectPlansState extends State<SelectPlans> {
bool selected = false;
bool selecteda = false;
bool selectedaccounting = false;
bool selectedpurchasing = false;
bool selectedsales = false;
bool selectedinventory = false;
bool selectedproject = false;
bool selectedpos = false;

bool loading = false;


bool valuefirst = false;
bool valuesecond = false;

var selectedApps = [];


@override
  Widget build(BuildContext context) {

var price = 0.0 ;

  selectedApps.forEach((element) {
    price += double.parse(element['price']);
  });

    return SafeArea(
        child:Scaffold(
          body:Container(
            width: Get.width,

            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(0),
               child: Column(

                 children: [
                   Stack(
                     children: [
                       Image.asset('asset/newimg.png'),
                       Padding(
                         padding:  EdgeInsets.only(top: 95.0,left: 12),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Try it with a\n14-day trial',style:  TextStyle(fontSize: 25,color: Colors.grey),),
                             SizedBox(height: 10,),
                             Text('Choose your app now',style: TextStyle(fontSize:15,color:Colors.grey),),
                           ],
                         ),
                       ),
                     ],
                   ),

                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       children: [
                         Container( height: 40,width: 120,decoration: BoxDecoration(
                           gradient: LinearGradient(
                             colors: [
                               Colors.blue.shade900,
                               Colors.blue,
                             ],
                             begin: Alignment.topLeft,
                             end: Alignment.bottomRight,
                           ),



                         ),
                           child: Center(child: Text('SIGN IN',style: TextStyle(fontSize: 14,color:Colors.white))),),

                       ],
                     ),
                   ),
                   SizedBox(height:20),
                   Text('Compare prices by adding apps',style:TextStyle(fontSize: 21,color:kyellow)),
                   SizedBox(height:20),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(color:bgGrey,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                     side: BorderSide(color: kblue)
                    ),
                        child: Column(
                          children: [
                            // Container(
                            //   width: 400,
                            //   height: 400,
                            //   decoration: BoxDecoration(
                            //       border: Border.all(
                            //           width: 2,
                            //           color: kblue
                            //       ),
                            //       borderRadius: BorderRadius.circular(50)
                            //
                            //
                            //   ),
                            //
                            //
                            // ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('Select your Apps',style:TextStyle(fontSize: 22,)),


                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: Get.height*0.4,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child
                                          : ListView.builder(

                                            itemCount: selectedApps.length,
                                            itemBuilder: (context, index) {

                                              return Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: buildSelectedAppRow(selectedApps[index]['title']
                                                ,selectedApps[index]['image']
                                                ),
                                              );
                                            }
                                          ),
                                    ),

                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 100,width: 80,color: clo,
                                            child:Column(
                                              children: [
                                                Padding(
                                                  padding:  EdgeInsets.only(top: 10.0),
                                                  child: Text(selectedApps.length.toString(),style:TextStyle(fontSize: 30, color:Kdblue),),

                                                ),
                                                Text('  Apps selected \nContinue without\n    credit card',style:TextStyle(fontSize:10,),
                                                ),


                                              ],

                                            ),

                                          ),
                                          SizedBox(height:20),
                                       loading?
                                           kprogressbar
                                           :   InkWell(
                                            onTap: () async {

                                              setState(() {
                                                loading = true;
                                              });
                                          var doc =    await  FirebaseFirestore.instance
                                                  .collection('Registeration').where('email',isEqualTo: widget.cdetails['email']).get();

                                          await  FirebaseFirestore.instance
                                              .collection('Registeration').doc(doc.docs[0].id).update({
                                            'apps':jsonEncode(selectedApps)
                                          });

                                              setState(() {
                                                loading = false;
                                              });

                                              Get.snackbar('Successful', 'Someone will assist you shortly');

                                              Get.offAll(LoginScreen());

                                            },
                                            child
                                                : Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),gradient: LinearGradient(
                                              colors: [
                                                Colors.blue.shade900,
                                                Colors.blue,
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            ),

                                              child:Padding(
                                                padding:  EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text('Continue',style:TextStyle(color:Colors.white)),
                                                    Icon(Icons.chevron_right_sharp,color: Colors.white,)
                                                  ],
                                                ),
                                              ),

                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text('\$ ${price.toPrecision(2)}',style: TextStyle(color: kblue,fontSize: 24),),
                                          SizedBox(height: 10,),
                                          InkWell(
                                            onTap: (){

                                              setState(() {
                                                selectedApps.clear();
                                              });
                                            },
                                            child
                                                : Container(


                                              child:Padding(
                                                padding:  EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text('CLEAR ALL',style:TextStyle(color:kyellow)),
                                                    Icon(Icons.restore_from_trash,color: kyellow,)
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

                          ],
                        ),



                  ),
                ),
                            //Admin
                   ExpansionPanelList(
                     expansionCallback: (int index, bool isExpanded) {
                       setState(() {
                         selected = !isExpanded;
                       });

                     },
                     children: [


                       buildExpansionPanel('Administration',selected,
                       [
                         buildStack('asset/newone.png','Create Branches','Administration'),
                         buildStack('asset/imga.png', 'Create Departments','Administration'),
                         buildStack('asset/imgb.png', 'Audio/Video Meetings','Administration'),
                         buildStack('asset/imgc.png', 'Report','Administration'),
                         buildStack('asset/name1.png', 'Name','Administration'),




                       ]
                   ),
                       // ExpansionPanel(
                       //   headerBuilder: (BuildContext context, bool isExpanded) {
                       //     return ListTile(
                       //         title: Container(height: 20,width:50,
                       //
                       //           child: Text('Administration',style: TextStyle(fontSize: 20) , ),)
                       //     );
                       //   },
                       //   body: ListTile(
                       //     title: Column(
                       //       children: [
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/newone.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Create Branches',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/imga.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Create Departments',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/imgb.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Audio/Video Meetings',style:TextStyle(fontSize: 20,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/imgc.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Report',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/name1.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Name',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //       ],
                       //     ),
                       //
                       //   ),
                       //
                       //
                       //   isExpanded: selected,
                       //
                       // ),




                     ],
                   ),

                   ExpansionPanelList(
                     expansionCallback: (int index, bool isExpanded) {
                       setState(() {
                         selecteda = !isExpanded;
                       });

                     },
                     children: [

                       buildExpansionPanel('HRMS',selecteda,
                           [
                     buildStack('asset/emp.png','Create Employees','HRMS'),
                     buildStack('asset/slot.png', 'Create Shift Slot','HRMS'),
                     buildStack('asset/loc.png', 'Location Based Attendance','HRMS'),
                     buildStack('asset/bio.png', 'Connection And Bio Metric','HRMS'),
                     buildStack('asset/leave.png', 'leave Management','HRMS'),
                     buildStack('asset/meet.png', 'Live Meetings','HRMS'),
                     buildStack('asset/loca.png', 'location Tracking For field Staff','HRMS'),
                     buildStack('asset/rep.png', 'Reports','HRMS'),
                             buildStack('asset/hr.png', 'HR PayRolls','HRMS'),
                             buildStack('asset/face.png', 'Face Attendance','HRMS'),
                             buildStack('asset/cert.png', 'Certificates Management','HRMS'),
                             buildStack('asset/noti.png','personalized Notifications','HRMS'),
                             buildStack('asset/projectmeeting.png', 'Birthday Alerts','HRMS'),
                             buildStack('asset/bdae.png', 'Project Meetings','HRMS'),
                             buildStack('asset/holiday.png', 'Alert On Excess Holidays','HRMS'),



                   ]
                   ),


                   // ExpansionPanel(
                   //       headerBuilder: (BuildContext context, bool isExpanded) {
                   //         return ListTile(
                   //             title: Container(height: 20,width:50,
                   //
                   //               child: Text('HRMS',style: TextStyle(fontSize: 20) , ),)
                   //         );
                   //       },
                   //       body: ListTile(
                   //         title: Column(
                   //           children: [
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/emp.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('Create Employees',style:TextStyle(fontSize: 25,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //             SizedBox(height: 10,),
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/slot.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('Create Shift Slot',style:TextStyle(fontSize: 25,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //             SizedBox(height: 10,),
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/loc.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('Location Based Attendance',style:TextStyle(fontSize: 17,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //             SizedBox(height: 10,),
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/bio.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('Connection And Bio Metric',style:TextStyle(fontSize: 17,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //             SizedBox(height: 10,),
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/leave.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('leave Management',style:TextStyle(fontSize: 25,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //
                   //             SizedBox(height: 10,),
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/meet.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('Live Meetings',style:TextStyle(fontSize: 25,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //             SizedBox(height: 10,),
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/loca.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('location Tracking For field Staff',style:TextStyle(fontSize: 16,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //             SizedBox(height: 10,),
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/rep.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('Reports',style:TextStyle(fontSize: 25,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //             SizedBox(height: 10,),
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/hr.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('HR PayRolls',style:TextStyle(fontSize: 25,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //             SizedBox(height: 10,),
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/face.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('Face Attendance',style:TextStyle(fontSize: 25,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //             SizedBox(height: 10,),
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/cert.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('Certificates Management',style:TextStyle(fontSize: 20,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //             SizedBox(height: 10,),
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/noti.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('personalized Notifications',style:TextStyle(fontSize: 16,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //             SizedBox(height: 10,),
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/bdae.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('Birthday Alerts',style:TextStyle(fontSize: 25,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //             SizedBox(height: 10,),
                   //             Stack(
                   //               children: [
                   //                 Image.asset("asset/bgrect.png"),
                   //                 Padding(
                   //                   padding: const EdgeInsets.all(8.0),
                   //                   child: Row(
                   //                     children: [
                   //                       Image.asset('asset/holiday.png'),
                   //                       SizedBox(width :10),
                   //                       Column(
                   //                         children: [
                   //                           Text('Alert On Excess Holidays',style:TextStyle(fontSize: 16,color: Kdblue) ),
                   //                           Text('\$ 2.99/USD per month ')
                   //                         ],
                   //                       ),
                   //
                   //                     ],
                   //                   ),
                   //                 ),
                   //
                   //               ],
                   //             ),
                   //
                   //           ],
                   //         ),
                   //
                   //       ),
                   //
                   //
                   //       isExpanded: selecteda,
                   //
                   //     ),




                     ],
                   ),




                   ExpansionPanelList(
                     expansionCallback: (int index, bool isExpanded) {
                       setState(() {
                         selectedaccounting = !isExpanded;
                       });

                     },
                     children: [ buildExpansionPanel('Accounting And Finance',selectedaccounting,
                         [
                           buildStack('asset/achart.png', 'Account And Chart ','Accounting And Finance'),
                           buildStack('asset/auto.png','Auto Journal Entries management','Accounting And Finance'),
                           buildStack('asset/pay.png', 'Templates For Recurring payments ','Accounting And Finance'),
                           buildStack('asset/finance.png', 'Financial Report','Accounting And Finance'),
                           buildStack('asset/bill.png', 'Bills Managements','Accounting And Finance'),








                         ]
                     ),

                       // ExpansionPanel(
                       //   headerBuilder: (BuildContext context, bool isExpanded) {
                       //     return ListTile(
                       //         title: Container(height: 20,width:50,
                       //
                       //           child: Text('Accounting And Finance',style: TextStyle(fontSize: 20) , ),)
                       //     );
                       //   },
                       //   body: ListTile(
                       //     title: Column(
                       //       children: [
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/achart.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Account And Chart ',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/auto.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Auto Journal Entries management',style:TextStyle(fontSize: 13,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/pay.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Templates For Recurring payments ',style:TextStyle(fontSize: 11,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/finance.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Financial Report',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/bill.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Bills Managements',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //
                       //       ],
                       //     ),
                       //
                       //   ),
                       //
                       //
                       //   isExpanded: selectedaccounting,
                       //
                       // ),




                     ],
                   ),
//
                   ExpansionPanelList(
                     expansionCallback: (int index, bool isExpanded) {
                       setState(() {
                         selectedpurchasing = !isExpanded;
                       });

                     },
                     children: [
                       buildExpansionPanel('Purchasing & Operations',selectedpurchasing,
                   [
                     buildStack('asset/web.png', 'Web Based RFQ ','Purchasing & Operations'),
                     buildStack('asset/po.png', 'PO Management','Purchasing & Operations'),
                     buildStack('asset/cred.png', 'Credit Memos','Purchasing & Operations'),
                     buildStack('asset/rfq.png', 'RFQ Status','Purchasing & Operations'),
                     buildStack('asset/hist.png', 'Purchase History','Purchasing & Operations'),
                     buildStack('asset/compo.png', 'Components Managements','Purchasing & Operations'),
                     buildStack('asset/report.png', 'Reports','Purchasing & Operations'),
                     buildStack('asset/invoice.png', 'Bill & Invoice','Purchasing & Operations'),
                     buildStack('asset/vendor.png', 'Vendors Management','Purchasing & Operations'),






                   ]
                       ),



                       // ExpansionPanel(
                       //   headerBuilder: (BuildContext context, bool isExpanded) {
                       //     return ListTile(
                       //         title: Container(height: 20,width:50,
                       //
                       //           child: Text('Purchasing And Operations',style: TextStyle(fontSize: 20) , ),)
                       //     );
                       //   },
                       //   body: ListTile(
                       //     title: Column(
                       //       children: [
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/web.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Web Based RFQ ',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/po.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('PO Management',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/cred.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Credit Memos',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/rfq.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('RFQ Status',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/hist.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Purchase History',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/compo.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Components Managements',style:TextStyle(fontSize: 17,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/report.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Reports',style:TextStyle(fontSize: 20,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/invoice.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Bill & Invoice',style:TextStyle(fontSize: 20,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/vendor.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Vendors Management',style:TextStyle(fontSize: 20,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //
                       //       ],
                       //     ),
                       //
                       //   ),
                       //
                       //
                       //   isExpanded: selectedpurchasing,
                       //
                       // ),




                     ],
                   ),
                   ExpansionPanelList(
                     expansionCallback: (int index, bool isExpanded) {
                       setState(() {
                         selectedsales = !isExpanded;
                       });

                     },
                     children: [
                       buildExpansionPanel('Sales',selectedsales,
                           [
                             buildStack('asset/quotation.png', 'Quotation Management ','Sales'),
                             buildStack('asset/order.png', 'Orders Management','Sales'),
                             buildStack('asset/custom.png', 'Customer Management','Sales'),
                             buildStack('asset/product.png', 'products management','Sales'),
                             buildStack('asset/sales.png', 'Sales record','Sales'),
                             buildStack('asset/pipeline.png', 'Opportunity & Pipeline','Sales'),
                             buildStack('asset/campagin.png', 'Sales Campaign','Sales'),
                             buildStack('asset/return.png', 'Return Management','Sales'),
                             buildStack('asset/profit.png', 'Profit Calculation','Sales'),

                           ]
                       ),

                       // ExpansionPanel(
                       //   headerBuilder: (BuildContext context, bool isExpanded) {
                       //     return ListTile(
                       //         title: Container(height: 20,width:50,
                       //
                       //           child: Text('Sales',style: TextStyle(fontSize: 22) , ),)
                       //     );
                       //   },
                       //   body: ListTile(
                       //     title: Column(
                       //       children: [
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/quotation.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Quotation Management ',style:TextStyle(fontSize: 20,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/order.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Orders Management',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/custom.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Customer Management',style:TextStyle(fontSize: 20,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/product.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('products management',style:TextStyle(fontSize: 22,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/sales.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Sales record',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/pipeline.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Opportunity & Pipeline',style:TextStyle(fontSize: 19,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //
                       //         SizedBox(height: 10,),
                       //
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/campagin.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Sales Campaign',style:TextStyle(fontSize: 20,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/return.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Return Management',style:TextStyle(fontSize: 20,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/profit.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Profit Calculation',style:TextStyle(fontSize: 20,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //       ],
                       //     ),
                       //
                       //   ),
                       //
                       //
                       //   isExpanded: selectedsales,
                       //
                       // ),




                     ],
                   ),


                   ExpansionPanelList(
                     expansionCallback: (int index, bool isExpanded) {
                       setState(() {
                         selectedinventory = !isExpanded;
                       });

                     },
                     children: [


                       buildExpansionPanel('Inventory Managemant',selectedinventory,
                           [
                         buildStack('asset/productmgnt.png', 'Product Mngt ','Inventory Management'),
                         buildStack('asset/price.png', 'Price Management','Inventory Management'),
                         buildStack('asset/goods.png', 'Goods Receipts','Inventory Management'),
                             buildStack('asset/issues.png', 'Goods Issues ','Inventory Management'),
                             buildStack('asset/transaction.png', 'Transactions','Inventory Management'),
                             buildStack('asset/transfer.png','Transfer','Inventory Management'),
                             buildStack('asset/inventoryreport.png', 'Inventory Report','Inventory Management'),
                             buildStack('asset/number.png','Serial Number Mngt','Inventory Management'),
                             buildStack('asset/inventcount.png', 'Inventory Counting','Inventory Management'),
                       ]
                       ),

                       // ExpansionPanel(
                       //   headerBuilder: (BuildContext context, bool isExpanded) {
                       //     return ListTile(
                       //         title: Container(height: 20,width:50,
                       //
                       //           child: Text('Inventory Management',style: TextStyle(fontSize: 18) , ),)
                       //     );
                       //   },
                       //   body:
                       //   ListTile(
                       //     title: Column(
                       //       children: [
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/productmgnt.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Product Mngt ',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/price.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Price Management',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/goods.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Goods Receipts',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/issues.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Goods Issues ',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/transaction.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Transactions',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/transfer.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Transfer',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //
                       //         SizedBox(height: 10,),
                       //
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/inventoryreport.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Inventory Report',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/number.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Serial Number Mngt',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/inventcount.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Inventory Counting',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //       ],
                       //     ),
                       //
                       //   ),
                       //
                       //
                       //   isExpanded: selectedinventory,
                       //
                       // ),




                     ],
                   ),


                   ExpansionPanelList(
                     expansionCallback: (int index, bool isExpanded) {
                       setState(() {
                         selectedproject = !isExpanded;
                       });

                     },
                     children: [
                        buildExpansionPanel('Project & Resource Management',selectedproject,[
                          buildStack('asset/projectstage.png', 'Project Stage ','Project & Resource Management'),
                          buildStack('asset/task.png', 'Task Management','Project & Resource Management'),
                          buildStack('asset/teammgnt.png', 'Team Management','Project & Resource Management'),
                          buildStack('asset/gantt.png', 'Gantt Chart ','Project & Resource Management'),
                          buildStack('asset/modules.png', 'Modules/Sprints','Project & Resource Management'),
                          buildStack('asset/resourceplan.png', 'Resource Planning','Project & Resource Management'),
                          buildStack('asset/time.png', 'Time Sheet','Project & Resource Management'),
                          buildStack('asset/projectmeeting.png', 'Project Meetings','Project & Resource Management'),



                        ]
                        ),

                       // ExpansionPanel(
                       //   headerBuilder: (BuildContext context, bool isExpanded) {
                       //     return ListTile(
                       //         title: Container(height: 20,width:50,
                       //
                       //           child: Text('Project & Resource Management',style: TextStyle(fontSize: 18) , ),)
                       //     );
                       //   },
                       //   body: ListTile(
                       //     title: Column(
                       //       children: [
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/projectstage.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Project Stage ',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/task.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Task Management',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/teammgnt.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Team Management',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/gantt.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Gantt Chart ',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/modules.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Modules/Sprints',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/resourceplan.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Resource Planning',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //
                       //         SizedBox(height: 10,),
                       //
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/time.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Time Sheet',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //         SizedBox(height: 10,),
                       //
                       //         Stack(
                       //           children: [
                       //             Image.asset("asset/bgrect.png"),
                       //             Padding(
                       //               padding: const EdgeInsets.all(8.0),
                       //               child: Row(
                       //                 children: [
                       //                   Image.asset('asset/projectmeeting.png'),
                       //                   SizedBox(width :10),
                       //                   Column(
                       //                     children: [
                       //                       Text('Project Meetings',style:TextStyle(fontSize: 25,color: Kdblue) ),
                       //                       Text('\$ 2.99/USD per month ')
                       //                     ],
                       //                   ),
                       //
                       //                 ],
                       //               ),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //
                       //       ],
                       //     ),
                       //
                       //   ),
                       //
                       //
                       //   isExpanded: selectedproject,
                       //
                       // ),





                     ],
                   ),





                   ExpansionPanelList(
                     expansionCallback: (int index, bool isExpanded) {
                       setState(() {
                         selectedpos = !isExpanded;
                       });

                     },
                     children: [

                       buildExpansionPanel('POS',selectedpos,[
                         buildStack('asset/pos.png', 'POS','POS'),

                       ]),




                     ],
                   ),


                 ],




               )

              )
              )
            )
          )

    );
  }

Row buildSelectedAppRow(title,image) {
  return Row(
                                        children: [
                                          Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(6),color: Kdblue, ),
                                            height: 33,
                                            width: 33,
                                            child: ClipRRect(child: Image.asset(image,fit: BoxFit.fill,)),

                                          ),SizedBox(width: 20),
                                          Container(
                                              width: Get.width*0.2,
                                              child: Text(title,style:TextStyle(fontSize: 12,))),

                                        ],

                                      );
}

ExpansionPanel buildExpansionPanel(String title,selection,children) {
  return ExpansionPanel(
                       headerBuilder: (BuildContext context, bool isExpanded) {
                         return ListTile(
                             title: Container(width:50,

                               child: Text(title,style: TextStyle(fontSize: 21) , ),)
                         );
                       },
                       body: ListTile(
                         title: Column(
                           children: children,
                         ),

                       ),


                       isExpanded: selection,

                     );
}

Widget buildStack(icon, String title,String parent) {
  var indexoFSeleceted = selectedApps.indexWhere((element) => element['title'] == title);

  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Stack(
                               children: [
                                 Image.asset("asset/bgrect.png"),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Row(
                                     children: [
                                       Image.asset(icon),
                                       SizedBox(width :10),
                                       Column(
                                         children: [
                                           Row(
                                             children: [
                                               Container(
                                                 width:Get.width * 0.5,
                                                   child: Text(title,style:TextStyle(fontSize: 14,color: Kdblue) )),
                                               Checkbox(
                                                 value: indexoFSeleceted != -1,
                                                 onChanged: (bool? value) {
                                                   setState(() {
                                                   value! ?  selectedApps.add(
                                                       {'title':title , 'image' : icon,
                                                       'price': title == 'POS' ? '10.99' :
                                                       '2.99',
                                                         'app' : parent
                                                       }) :
                                                   selectedApps.removeAt(indexoFSeleceted);

                                                   });
                                                   print(selectedApps);
                                                 },
                                               ),


                                             ],
                                           ),
                                           Text('\$ 2.99/USD per month ')

                                         ],
                                       ),

                                     ],
                                   ),
                                 ),

                               ],
                             ),
  );
}
  // Widget list(BuildContext context) {
  //
  //   return SafeArea(
  //       child:Scaffold(
  //       body:Container(
  //       width: Get.width,
  //
  //       child: SingleChildScrollView(
  //       child: Padding(
  //       padding: EdgeInsets.all(0),
  //   child: Column(
  //
  //   children: [
  //   Stack(
  //   children: [
  //   Image.asset('asset/rect.png'),
  //   Padding(
  //   padding:  EdgeInsets.only(top: 95.0),
  //   child: Column(
  //   mainAxisAlignment: MainAxisAlignment.start,
  //   children: [
  //   Row(
  //   children: [
  //     Icon(Icons.),
  //   Text('Create Branches',style:  TextStyle(fontSize: 25,color: Kdblue),),
  //   ],
  //   ),
  //   SizedBox(height: 10,),
  //   Row(
  //   children: [
  //   Center(child: Text('\$2.99/USD per month',style: TextStyle(fontSize:15,color:Kdblue),)),
  //   ],
  //   ),
  //   ],
  //   ),
  //   ),
  //   ],
  //   ),
  //       ],
  //   ),
  //       ),
  //   ),
  //   ),
  //   ),
  //

}
