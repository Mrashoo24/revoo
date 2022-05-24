import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:revoo/Controllers/leavecontroller.dart';
import 'package:revoo/HRMS_admin_Screen/plans/calendar.dart';



import '../constants/constants.dart';
import '../constants/constants.dart';
import '../constants/constants.dart';
import '../constants/constants.dart';
import '../constants/constants.dart';
import '../home/homepage.dart';
import '../model/leavemodel.dart';

class AcceptLeave extends StatefulWidget {  final DocumentSnapshot<Map<String, dynamic>> userDoc ;
  const AcceptLeave({Key? key, required this.userDoc}) : super(key: key);

  @override
  _AcceptLeaveState createState() => _AcceptLeaveState();
}

class _AcceptLeaveState extends State<AcceptLeave> {
  Future getCalender() async{
    DateTimeRange? newdaterange = await showDateRangePicker(context: context, firstDate: DateTime(1980), lastDate: DateTime(2100),initialDateRange: dateRange);
    if(newdaterange == null) return;
    setState(() {
      dateRange = newdaterange;
    });
  }

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
    end: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
  );
  @override
  Widget build(BuildContext context) {
    final start = DateFormat('yyyy/MM/dd').format(dateRange.start);
    final end = DateFormat('yyyy/MM/dd').format(dateRange.end);


    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Leave Requests',
                    style: TextStyle(color: kblue, fontSize: 25),
                  ),
                  // InkWell(
                  //   onTap: (){
                  //
                  //     Get.to(Calendar());
                  //   },
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       Container(
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Column(
                  //             children: [
                  //               Text("Check",style: TextStyle(color: Colors.white),),
                  //               Text("leave",style: TextStyle(color: Colors.white),),
                  //             ],
                  //           ),
                  //         ),
                  //
                  //         height: 48,width: 60,
                  //         decoration: BoxDecoration(
                  //           gradient: LinearGradient(colors: [
                  //             Kdblue,
                  //             bluess
                  //           ]),
                  //           borderRadius: BorderRadius.circular(10),
                  //           // border: Border.all(color: Kdblue,width: 3)
                  //         ),
                  //         // decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: Colors.blue),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                     Row(
                       children: <Widget>[
                         Container(
                           child: ElevatedButton(onPressed: getCalender,child: Text("${dateRange.start.year.toString()}/${dateRange.start.month.toString()}/${dateRange.start.day.toString()}"),style: ButtonStyle(
                             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                   (Set<MaterialState> states) {
                                 if (states.contains(MaterialState.pressed))
                                   return Colors.blueGrey;
                                 return Kdblue; // Use the component's default.
                               },
                             ),
                           ),),
                         ),
                         SizedBox(width: 10,),
                         Container(
                           child: ElevatedButton(onPressed: getCalender,child:  Text("${dateRange.end.year.toString()}/${dateRange.end.month.toString()}/${dateRange.end.day.toString()}"),
                             style: ButtonStyle(
                             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                   (Set<MaterialState> states) {
                                 if (states.contains(MaterialState.pressed))
                                   return Colors.blueGrey;
                                 return Kdblue; // Use the component's default.
                               },
                             ),

                           ),
                           ),
                         ),
                       ],
                     ),
                  // InkWell(
                  //   onTap: (){
                  //     // Get.to(Calendar());
                  //   },
                  //   child: Padding(
                  //     padding:  EdgeInsets.only(left: 15.0),
                  //     child: Text(
                  //       '<Feb 07, 22>',
                  //
                  //       style: TextStyle(color: kblue, fontSize: 14),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 15),
                  

                ],
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:FirebaseFirestore.instance.collection('Leaves').snapshots(),
              builder: (context,snapshot) {

                if(!snapshot.hasData){
                  return kprogressbar;
                }


               var  leaveController =  snapshot.requireData.docs;

               var upDatedlist =  leaveController.where((element)  {

                  print(element.get('date'));
                  return DateFormat('yyyy/MM/dd').parse(element.get('date').toString()).isAfter(DateFormat('yyyy/MM/dd').parse(start))
                 &&
                      DateFormat('yyyy/MM/dd').parse(element.get('date').toString()).isBefore(DateFormat('yyyy/MM/dd').parse(end)


                      )

                  ;
                }).toList();

                print('new updated list length${upDatedlist.length}');
                return ListView.builder(


                  shrinkWrap: true,
                  itemCount: upDatedlist.length,
                  itemBuilder: (context,index){

                    var allLeave = [];

                for (var element in upDatedlist) {
                      allLeave.add(LeaveDisplay.fromJson(element.data()));
                    }

                    LeaveDisplay allLeaveList = allLeave[index];




                    return
                     allLeaveList.status == '0' ?

                     buildRequestCard(name: allLeaveList.name.toString()
                       ,department:allLeaveList.department.toString(),date:  allLeaveList.date.toString(),lsitofleaves: allLeaveList,textinput: allLeaveList.textinput.toString())

                         : allLeaveList.status == '1' ?

                     buildAcceptCard(name: allLeaveList.name.toString()
                       ,department:allLeaveList.department.toString(),date:  allLeaveList.date.toString(),lsitofleaves: allLeaveList,textinput: allLeaveList.textinput.toString())

                         :


                     buildRejectCard(name: allLeaveList.name.toString()
                       ,department:allLeaveList.department.toString(),date:  allLeaveList.date.toString(),lsitofleaves: allLeaveList,textinput: allLeaveList.textinput.toString(), designation: '', );



                  },
                  // children:
                  // [
                  //
                  //   buildAcceptCard(name: 'Arsalan', department: 'it', date: '2022-03-04'),
                  //   buildRejectCard(name: 'Arsalan', department: 'it', date:' 2022-03-04'),
                  // ],
                );
              }
            ),
          ),
          // InkWell(
          //   onTap: (){
          //     },
          //
          //   child: Padding(
          //     padding: const EdgeInsets.all(30.0),
          //     child: Container(
          //       child: Center(child: Padding(
          //         padding: const EdgeInsets.symmetric(vertical: 12.0),
          //         child: Text('Back',style: TextStyle(color: Colors.white),),
          //       ),
          //       ),
          //       decoration: BoxDecoration(
          //         gradient: LinearGradient(colors: [
          //           Kdblue,
          //           bluess
          //         ]),
          //         borderRadius: BorderRadius.circular(10),
          //         // border: Border.all(color: Kdblue,width: 3)
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Container buildRejectCard({required String name, required String department,required String designation, required String date,required LeaveDisplay lsitofleaves,required String textinput}) {
    return Container(
                    decoration: BoxDecoration(
                        color: bgGrey,
                        boxShadow: [BoxShadow(color: Colors.red,offset: Offset(0, 1),blurRadius: 10),]
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                name + "${department}",
                                style: TextStyle(color: kblue, fontSize: 12),
                              ),
                              Text(
                                date,
                                style: TextStyle(color: kblue, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: Get.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textinput,
                                  style: TextStyle(color: kblue, fontSize: 12),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text('Rejected',style: TextStyle(color: Colors.red),),
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
  }

  Container buildAcceptCard({required String name,required String department, required String date,required LeaveDisplay  lsitofleaves,required String textinput}) {
    return Container(
                    decoration: BoxDecoration(
                        color: bgGrey,
                        boxShadow: [BoxShadow(color: Colors.green,offset: Offset(0, 1),blurRadius: 10),]
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                name,
                                style: TextStyle(color: kblue, fontSize: 12),
                              ),
                              Text(
                                date,
                                style: TextStyle(color: kblue, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: Get.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dear HR,\n I need holiday for tomorrow',
                                  style: TextStyle(color: kblue, fontSize: 12),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text('Approved',style: TextStyle(color: Colors.green),),
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
  }

  Container buildRequestCard({required String name, required String department, required String date,required LeaveDisplay lsitofleaves, required String textinput,}) {
    return Container(
                    color: bgGrey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                name + department + '',
                                style: TextStyle(color: kblue, fontSize: 12),
                              ),
                              Text(
                               date,
                                style: TextStyle(color: kblue, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: Get.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textinput,
                                  style: TextStyle(color: kblue, fontSize: 12),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () async {
                                          print('deny clicked');
                                          await  FirebaseFirestore.instance.collection('Leaves').doc(lsitofleaves.id).update(
                                              {
                                                'status' : '-1'
                                              }
                                          );
                                          Get.snackbar("Leave Request", "Leave Status",
                                            backgroundColor: Colors.grey,
                                            snackPosition: SnackPosition.BOTTOM,
                                            titleText: Text("Leave Denied Successfully "),
                                          );
                                        },
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal:Get.width*0.15),
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
                                        onTap: () async {
                                              await  FirebaseFirestore.instance.collection('Leaves').doc(lsitofleaves.id).update(
                                                    {
                                                  'status' : '1'
                                                    }
                                                );
                                              Get.snackbar("Leave Request", "Leave Status",
                                                backgroundColor: Colors.grey,
                                                snackPosition: SnackPosition.BOTTOM,
                                                titleText: Text("Leave Accepted Successfully "),
                                              );
                                        },
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal:Get.width*0.15),
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
                                ),
                                  SizedBox(height: 40),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
  }
}
