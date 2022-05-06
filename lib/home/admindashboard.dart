import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:revoo/constants/constants.dart';
import 'package:cell_calendar/cell_calendar.dart';


import '../Models/attendencmodel.dart';
import '../graph/piechart.dart';

class AdminDashboard extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;
  const AdminDashboard({Key key= const Key('AdminDashboard'), required this.userDoc}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {

  bool loading = false;

  final cellCalendarPageController = CellCalendarPageController();

  TextEditingController hourin = TextEditingController();
  TextEditingController minutein = TextEditingController();
  TextEditingController hourout = TextEditingController();
  TextEditingController minuteout = TextEditingController();

  var sampleEvents = [
    CalendarEvent(eventName: "Event 1",eventDate: DateTime.now(),eventBackgroundColor: Colors.black),
    CalendarEvent(eventName: "Event 2",eventDate: DateTime.now()),
  ];

  var checkinTime  = '';
  List checkinHours  = [];
  var checkInMinutes = [];

  var checkoutTime  = '';
  var checkoutHours  = [];
  var checkoutMinutes =  [];
  var difference = '';

  var currentDate = DateFormat('yyyy/MM/dd').format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    var firestore =  FirebaseFirestore.instance;

    print('curentDate = $currentDate');
    print('uid = ${widget.userDoc.id}');

    return Scaffold(

      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: firestore.collection('attendence_report')
              .where('uid',isEqualTo: widget.userDoc.id).where('date',isEqualTo: currentDate)
              .snapshots(),

          builder: (context, snapshot) {

            if(!snapshot.hasData){

              return kprogressbar;

            }

            var documents = snapshot.requireData.docs ; // to get all documetn from collection



            var currentDocument = documents; // get single doc of current date

            if(currentDocument.isNotEmpty){
              AttendencReportModel attendencModel =
              AttendencReportModel.fromJson(currentDocument[0].data());

              print(attendencModel.checkin ?? 'null');

               checkinTime  = attendencModel.checkin.toString();
               checkinHours  = checkinTime.split(':');

              print(checkinTime);
              print(checkinHours);

               checkInMinutes =  checkinHours[1].split(' ');
              print(checkInMinutes);



              checkoutTime  = attendencModel.checkout.toString() == '' ? '' : attendencModel.checkout.toString();
              checkoutHours  = attendencModel.checkout.toString() == '' ? [] : checkoutTime.split(':');
              checkoutMinutes = attendencModel.checkout.toString() == '' ? [] :  checkoutHours[1].split(' ');

              difference = attendencModel.checkout.toString() == '' ? '' : attendencModel.difference.toString();

            }


            return FutureBuilder<List>(
              future: Future.wait([firestore.collection('Shifts').doc(widget.userDoc.get('shiftid')).get(),

              ]),
              builder: (context, future) {


                if(!future.hasData){
                  return kprogressbar;

                }


                DocumentSnapshot querySnapshot  = future.requireData[0] as DocumentSnapshot;

                var shiftTime  = querySnapshot.get('time');

                var convertedShiftTime = DateFormat('hh:mm a').parse(shiftTime);


                var workinghours = querySnapshot.get('hours');


                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: Get.width,
                          height: Get.height*0.5,
                          child: ClipRect(
                            child: Image.asset(
                            'asset/dcbg.png',fit: BoxFit.fill,),
                          ),

                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 10,),
                              Text('Daily Check-in, ${currentDate}',style: TextStyle(color: ktextcolor,fontSize: 18),),
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

                                          Text('In-Time',style: TextStyle(color: ktextcolor,fontSize: 18),),
                                          SizedBox(width: 15),
                                          Container(
                                            height: Get.height*0.05,
                                            width: Get.width*0.09,
                                            color: Colors.grey.shade400,
                                            child: Center(child: Text(checkinHours.isNotEmpty ? checkinHours[0] : '--',style: TextStyle(color: kblue,fontSize: 18),)),
                                          ),
                                          SizedBox(width: 15),
                                          Container(
                                            height: Get.height*0.05,
                                            width: Get.width*0.09,
                                            color: Colors.grey.shade400,
                                            child: Center(child: Text(checkInMinutes.isNotEmpty ? checkInMinutes[0] : '--',style: TextStyle(color: kblue,fontSize: 18),)),
                                          ),

                                          SizedBox(width: 15),
                                          Container(
                                            height: Get.height*0.05,
                                            width: Get.width*0.18,
                                            color: Colors.grey.shade400,
                                            child: Center(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(checkInMinutes.isNotEmpty ? checkInMinutes[1] : '--',style: TextStyle(color: kblue,fontSize: 18),),
                                                  SizedBox(width: 10,),
                                                  Image.asset('asset/smallarrowdown.png'),
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
                              SizedBox(height: 10,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:   EdgeInsets.only(left:Get.width*0.09),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Out Time',style: TextStyle(color: ktextcolor,fontSize: 18),),
                                      SizedBox(width: 15),
                                      Container(
                                        height: Get.height*0.05,
                                        width: Get.width*0.09,
                                        color: Colors.grey.shade400,
                                        child: Center(child: Text(checkoutHours.isNotEmpty ? checkoutHours[0] : '--',style: TextStyle(color: kblue,fontSize: 18),)),
                                      ),
                                      SizedBox(width: 15),
                                      Container(
                                        height: Get.height*0.05,
                                        width: Get.width*0.09,
                                        color: Colors.grey.shade400,
                                        child: Center(child: Text(checkoutMinutes.isNotEmpty ? checkoutMinutes[0] : '--',style: TextStyle(color: kblue,fontSize: 18),)),
                                      ),

                                      SizedBox(width: 15),
                                      Container(
                                        height: Get.height*0.05,
                                        width: Get.width*0.18,
                                        color: Colors.grey.shade400,
                                        child: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(checkoutMinutes.isNotEmpty ? checkoutMinutes[1] : '--',style: TextStyle(color: kblue,fontSize: 18),),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 16,),


                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 30,),
                              Text ('Total hours:',style: TextStyle(color: ktextcolor,fontSize: 18),),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: Get.height*0.05,
                                    width: Get.width*0.20,
                                    color: Colors.grey.shade400,
                                    child: Center(child: Text('$difference',style: TextStyle(color: kblue,fontSize: 18),)),

                                  ),
                                  Center(child: Text(' hrs.',style: TextStyle(color: Colors.white,fontSize: 18),)),


                                  SizedBox(width: 12,),
                                  Image.asset('asset/dc hrs icon.png')

                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 35.0,top: 35),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                 loading ? kprogressbar
                                     :
                                 ElevatedButton(onPressed: () async {


                                      if(checkinTime == ''){

                                        setState(() {
                                          loading =true;
                                        });


                                        var currentCheckinTime =   DateFormat('hh:mm a').format(DateTime.now());

                                        var currentTime = DateFormat('hh:mm a').parse(DateFormat('hh:mm a').format(DateTime.now()));

                                        var checkDifference =  currentTime.isAfter(convertedShiftTime.add(Duration(minutes: 15)));

                                        var checkinDifference =  currentTime.difference(convertedShiftTime);

                                        var convertedDifference =  checkinDifference.toString().split(':');

                                        var differencehoursMinuts = convertedDifference[0] + '.' + convertedDifference[1]

                                        ;
                                        print(convertedShiftTime);
                                        print(currentTime);
                                        print(checkinDifference);

                                        var checkinstatus = checkDifference ? 'late' : currentTime.isBefore(convertedShiftTime.add(Duration(minutes: 15)))
                                            && currentTime.isAfter(convertedShiftTime.subtract(Duration(minutes: 15))) ? 'perfect' :

                                        'early';

                                        print(checkinstatus);
                                        firestore.collection('attendence_report')
                                            .add(AttendencReportModel(
                                          date : DateFormat('yyyy/MM/dd').format(DateTime.now()),
                                          reason: '',
                                          mid: widget.userDoc.get('mid'),
                                          uid:widget.userDoc.id,
                                          checkin:currentCheckinTime,
                                          workingHours: '',
                                          workingStatus: '',
                                          id: '',
                                          bid: widget.userDoc.get('bid'),
                                          checkout: '',
                                          did: widget.userDoc.get('did'),
                                          status: checkinstatus,
                                          difference: differencehoursMinuts,
                                          timestamp: DateTime.now().toString(),
                                          cid: widget.userDoc.get('cid'),
                                        ).toJson()).then((value) async {

                                          await  firestore.collection('attendence_report').doc(value.id).update(
                                              {'id':value.id});

                                          setState(() {
                                            loading =false;
                                          });


                                        });

                                      } else{

                                        Get.snackbar('SORRY', 'YOU ALREADY CHECKEDIN',snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: kblue.withOpacity(0.8),colorText: Colors.white
                                        );

                                      }




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
                                    ElevatedButton(
                                        onPressed: () async {


                                          if(checkoutTime == ''){
                                            setState(() {
                                              loading =true;
                                            });

                                            var currentCheckOutTime =   DateFormat('hh:mm a').format(DateTime.now());

                                            var currentTime = DateFormat('hh:mm a').parse(DateFormat('hh:mm a').format(DateTime.now()));


                                            //Convert string to date

                                            print(DateFormat('hh:mm a').format(DateTime.now()));

                                            var convertedCheckinTime =  DateFormat('hh:mm a').parse(checkinTime);


                                            print(convertedCheckinTime);
                                            print(currentCheckOutTime);

                                            //calculating difference
                                            var difference1 =   currentTime.difference(convertedCheckinTime);

                                            var convertedDifference = difference1.toString().split(':');

                                            var differencehoursMinuts =  convertedDifference[0] + '.' + convertedDifference[1];

                                            print('date : ${convertedDifference[0] + ':' + convertedDifference[1] }');


                                            //next

                                            var checkDifference =  double.parse(differencehoursMinuts) > double.parse(workinghours);
                                            print(convertedShiftTime);
                                            print(currentTime);
                                            print(checkDifference);

                                            var checkoutstatus = checkDifference ? 'overtime' : double.parse(differencehoursMinuts) == double.parse(workinghours)  ? 'perfect' :

                                            'early';

                                            print(checkoutstatus);

                                            await  firestore.collection('attendence_report').doc(currentDocument[0].id)
                                                .update(
                                                {
                                                  'reason': '',
                                                  'working_hours': differencehoursMinuts,
                                                  'working_status': checkoutstatus,
                                                  'checkout': currentCheckOutTime,
                                                });

                                            setState(() {
                                              loading =false;
                                            });





                                          }else{
                                            Get.snackbar('SORRY', 'YOU ALREADY CHECKEDOUT',snackPosition: SnackPosition.BOTTOM,
                                                backgroundColor: kblue.withOpacity(0.8),colorText: Colors.white
                                            );
                                          }

                                        },

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
                              // Stack(
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10),
                              //       child: Card(
                              //         elevation: 5,
                              //         color: Colors.grey.shade200,
                              //         shape: RoundedRectangleBorder(
                              //             borderRadius: BorderRadius.circular(0)
                              //         ),
                              //         child: Column(
                              //           children: [
                              //             Padding(
                              //               padding: const EdgeInsets.only(top: 50.0,left: 8,right: 8),
                              //               child: Text('You have 2 new request/approvals from the finance department,HR department,and the accounting department ',
                              //                 style: TextStyle(
                              //                     color: kblue
                              //                 ),
                              //                 textAlign: TextAlign.center,
                              //               ),
                              //             ),
                              //             Row(
                              //               mainAxisSize: MainAxisSize.min,
                              //               children: [
                              //                 Padding(
                              //                   padding: const EdgeInsets.only(top: 20.0,left: 8,right: 0),
                              //                   child: Text('Click here to',
                              //                     style: TextStyle(
                              //                         color: kblue,
                              //                       fontSize: 16
                              //                     ),
                              //                     textAlign: TextAlign.center,
                              //                   ),
                              //                 ),
                              //                 Padding(
                              //                   padding: const EdgeInsets.only(top: 20.0,right: 2),
                              //                   child: Text(' View Now!',
                              //                     style: TextStyle(
                              //                         color: kyellow,
                              //                       fontWeight: FontWeight.bold,
                              //                       fontSize: 16
                              //                     ),
                              //                     textAlign: TextAlign.center,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             Image.asset('asset/rightarrow.png',width: 30,),
                              //             SizedBox(height: 20,),
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //     Align(
                              //       alignment: Alignment.topRight,
                              //       child: Container(
                              //           margin: EdgeInsets.only(right: 25),
                              //           child: Image.asset('asset/wrongyellow.png',width: 30,height: 30,)),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60,),
                    Text ('My Calendar',style: TextStyle(color: Kdblue,fontSize: 20),),
                    SizedBox(height: 30,),

                Container(
                  height: Get.height*0.5,
                  child: CellCalendar(
                    cellCalendarPageController: cellCalendarPageController,
                      events: sampleEvents,
                    monthYearLabelBuilder: (datetime) {
                      final year = datetime?.year.toString();
                      final month = datetime?.month.monthName;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Text(
                              "$month  $year",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                cellCalendarPageController.animateToDate(
                                  DateTime.now(),
                                  curve: Curves.linear,
                                  duration: Duration(milliseconds: 300),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                    daysOfTheWeekBuilder: (dayIndex) {
                      final labels = ["S", "M", "T", "W", "T", "F", "S"];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          labels[dayIndex],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                    onCellTapped: (date) {
                      final eventsOnTheDate = sampleEvents.where((event) {
                        final eventDate = event.eventDate;
                        return eventDate.year == date.year &&
                            eventDate.month == date.month &&
                            eventDate.day == date.day;
                      }).toList();
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title:
                            Text(date.month.monthName + " " + date.day.toString()),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: eventsOnTheDate
                                  .map(
                                    (event) => Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(4),
                                  margin: EdgeInsets.only(bottom: 12),
                                  color: event.eventBackgroundColor,
                                  child: Text(
                                    event.eventName,
                                    style: TextStyle(color: event.eventTextColor),
                                  ),
                                ),
                              )
                                  .toList(),
                            ),
                          ));
                    },
                  ),

                ),

                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('asset/bluecalender.png'),
                        SizedBox(width: 10,),
                        Text('Meetings',style: TextStyle(fontSize: 18),),
                        SizedBox(width: 30,),
                        Image.asset('asset/browncalender.png'),
                        SizedBox(width: 10,),
                        Text('Leaves',style: TextStyle(fontSize: 18),),


                      ],
                    ),
                    SizedBox(height: 30,),

                    FutureBuilder <List<QuerySnapshot<Map<String, dynamic>>>>(
                      future: Future.wait([
                        firestore.collection('Employee').where('cid',isEqualTo: widget.userDoc.get('cid')).get(),
                        firestore.collection('Department').where('cid',isEqualTo: widget.userDoc.get('cid')).get(),
                        firestore.collection('attendence_report').where('cid',isEqualTo: widget.userDoc.get('cid'))
                            .where('date',isEqualTo: currentDate)
                            .get()
                      ]),
                      builder: (context, empSnap) {

                        if(!empSnap.hasData){
                          return kprogressbar;
                        }

                        var empDocs = empSnap.requireData[0].docs;
                        var depDocs = empSnap.requireData[1].docs;

                        var attendenceDocs = empSnap.requireData[2].docs;

                       var workingEmployees = empDocs.length - attendenceDocs.length;

                        return Column(
                          children: [
                            buildCard('View Employees','${empDocs.length}\nEmployees'),
                            buildCard('View Departments','${depDocs.length}\nDepartments'),
                            buildCard('Daily Logins','${attendenceDocs.length}\nDaily Logins'),

                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 30),
                                height: Get.height*0.45,
                                child: PieChartMine(dataMap: {
                                  "% of employee working":double.parse(attendenceDocs.length.toString()) ,
                                  "% of employee on leave": double.parse(workingEmployees.toString()),

                                },)),
                          ],
                        );
                      }
                    ),




                    // Padding(
                    //     padding: const EdgeInsets.only(bottom: 35.0,top: 15,),
                    //   child: Card(
                    //     elevation: 10,
                    //     color: Colors.grey.shade200,
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(0)
                    //     ),
                    //     child: Padding(
                    //       padding:   EdgeInsets.symmetric(horizontal: 8.0,vertical: Get.height*0.05),
                    //       child: Column(
                    //         children: [
                    //           SizedBox(height: 12,),
                    //           Padding(
                    //             padding: const EdgeInsets.only(top: 10.0,left: 8,right: 8),
                    //             child: Text("Department Progress",
                    //               style: TextStyle(
                    //                   color: kblue,fontSize: 25
                    //               ),
                    //               textAlign: TextAlign.center,
                    //             ),
                    //           ),
                    //           SizedBox(height: Get.height*0.06,),
                    //           Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               SizedBox(height: 12,),
                    //               Container(
                    //                 width: Get.width*0.20,
                    //                 child: Text("HR",
                    //                   style: TextStyle(
                    //                       color: Colors.grey.shade700,fontSize: 18
                    //                   ),
                    //                   textAlign: TextAlign.left,
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: LinearPercentIndicator(
                    //                   // width: MediaQuery.of(context).size.width*0.4,
                    //                   animation: true,
                    //                   lineHeight: 20.0,
                    //                   animationDuration: 2500,
                    //                   percent: 0.8,
                    //                   // center: Text("\₹ ${widget.urgentcase.raised}",style: TextStyle(color: kwhite,letterSpacing: 2),),
                    //                   linearStrokeCap: LinearStrokeCap.roundAll ,
                    //
                    //                   linearGradient: LinearGradient(
                    //                     colors: [
                    //                       Kdblue,
                    //                       Colors.lightBlueAccent
                    //                     ]
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //
                    //           SizedBox(height: Get.height*0.02,),
                    //           Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               SizedBox(height: 12,),
                    //               Container(
                    //                 width: Get.width*0.20,
                    //                 child: Text("Finance",
                    //                   style: TextStyle(
                    //                       color: Colors.grey.shade700,fontSize: 18
                    //                   ),
                    //                   textAlign: TextAlign.left,
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: LinearPercentIndicator(
                    //                   // width: MediaQuery.of(context).size.width*0.4,
                    //                   animation: true,
                    //                   lineHeight: 20.0,
                    //                   animationDuration: 2500,
                    //                   percent: 0.8,
                    //                   // center: Text("\₹ ${widget.urgentcase.raised}",style: TextStyle(color: kwhite,letterSpacing: 2),),
                    //                   linearStrokeCap: LinearStrokeCap.roundAll ,
                    //
                    //                   linearGradient: LinearGradient(
                    //                       colors: [
                    //                         Kdblue,
                    //                         Colors.lightBlueAccent
                    //                       ]
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(height: Get.height*0.02,),
                    //
                    //           Row(
                    //             children: [
                    //               SizedBox(height: 12,),
                    //               Container(
                    //                 width: Get.width*0.20,
                    //                 child: Text("Account",
                    //                   style: TextStyle(
                    //                       color: Colors.grey.shade700,fontSize: 18
                    //                   ),
                    //                   textAlign: TextAlign.left,
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: LinearPercentIndicator(
                    //                   // width: MediaQuery.of(context).size.width*0.4,
                    //                   animation: true,
                    //                   lineHeight: 20.0,
                    //                   animationDuration: 2500,
                    //                   percent: 0.8,
                    //                   // center: Text("\₹ ${widget.urgentcase.raised}",style: TextStyle(color: kwhite,letterSpacing: 2),),
                    //                   linearStrokeCap: LinearStrokeCap.roundAll ,
                    //
                    //                   linearGradient: LinearGradient(
                    //                       colors: [
                    //                         Kdblue,
                    //                         Colors.lightBlueAccent
                    //                       ]
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //
                    //
                    //
                    //
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),




                  ],

                );
              }
            );
          }
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
