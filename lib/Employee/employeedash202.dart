import 'package:cell_calendar/cell_calendar.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:revoo/graph/piechart.dart';

import '../Models/attendencmodel.dart';
import '../Timer/count_down.dart';
import '../constants/constants.dart';

class EmployeeDashboard1 extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;
  const EmployeeDashboard1({Key? key, required this.userDoc}) : super(key: key);

  @override
  _EmployeeDashboardState createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard1> {

  bool loading = false;

  final cellCalendarPageController = CellCalendarPageController();

  TextEditingController hourin = TextEditingController();
  TextEditingController minutein = TextEditingController();
  TextEditingController hourout = TextEditingController();
  TextEditingController minuteout = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  CountDownController? _controller;

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

  var shiftTime  = '';
  DateTime? convertedShiftTime ;


  var workinghours = '';

  DateTime? convertedfCheckinTime ;
  DateTime? endtime ;
  Duration? endDifference;



  var currentDate = DateFormat('yyyy/MM/dd').format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;

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

                    shiftTime  = querySnapshot.get('time');

                    convertedShiftTime = DateFormat('hh:mm a').parse(shiftTime);


                    workinghours = querySnapshot.get('hours');


                    if(currentDocument.isNotEmpty){

                      convertedfCheckinTime = DateFormat('hh:mm a').parse(checkinTime);

                      endtime = convertedfCheckinTime!.add(Duration(hours: double.parse(workinghours).round()));

                      endDifference =endtime!.difference( DateTime(1970,01,01,DateTime.now().hour,DateTime.now().minute,DateTime.now().second));

                      print('endtime = ${endtime} convertedfCheckinTime = ${convertedfCheckinTime} Diffreence = ${endDifference!.inHours} Day = ${DateTime(1970,01)}');

                    }


                    return Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: Get.width,
                              height: Get.height*0.7,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [

                                            Container(
                                                width:180,
                                                child: Text('In-Time',style: TextStyle(color: ktextcolor,fontSize: 18),)),
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
                                      SizedBox(height: 10,),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                                width: 200,
                                                child: Padding(
                                                  padding:  EdgeInsets.only(left: Get.width*0.009),
                                                  child: Text('Out Time',style: TextStyle(color: ktextcolor,fontSize: 18),),
                                                )),
                                            SizedBox(width: 15),
                                            Container(
                                              height: Get.height*0.05,
                                              width: Get.width*0.09,
                                              color: Colors.grey.shade400,
                                              child: Center(child: Padding(
                                                padding:  EdgeInsets.only(right: Get.width*0.00098),
                                                child: Text(checkoutHours.isNotEmpty ? checkoutHours[0] : '--',style: TextStyle(color: kblue,fontSize: 18),),
                                              )),
                                            ),
                                            SizedBox(width: 15),
                                            Container(
                                              height: Get.height*0.05,
                                              width: Get.width*0.09,
                                              color: Colors.grey.shade400,
                                              child: Center(child: Padding(
                                                padding:  EdgeInsets.only(right: Get.width*0.00098),
                                                child: Text(checkoutMinutes.isNotEmpty ? checkoutMinutes[0] : '--',style: TextStyle(color: kblue,fontSize: 18),),
                                              )),
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
                                                    Padding(
                                                      padding:  EdgeInsets.only(right: Get.width*0.01),
                                                      child: Text(checkoutMinutes.isNotEmpty ? checkoutMinutes[1] : '--',style: TextStyle(color: kblue,fontSize: 18),),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16,),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 30,),
                                  Text ('Total hours:',style: TextStyle(color: ktextcolor,fontSize: 18),),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding:  EdgeInsets.only(left: Get.width*0.03),
                                    child: Row(
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
                                        Image.asset('asset/dc hrs icon.png'),
                                      ],
                                    ),
                                  ),SizedBox(height: 20,),
                                  Row(
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

                                          var checkDifference =  currentTime.isAfter(convertedShiftTime!.add(Duration(minutes: 15)));

                                          var checkinDifference =  currentTime.difference(convertedShiftTime!);

                                          var convertedDifference =  checkinDifference.toString().split(':');

                                          var differencehoursMinuts = convertedDifference[0] + '.' + convertedDifference[1]

                                          ;
                                          print(convertedShiftTime);
                                          print(currentTime);
                                          print(checkinDifference);

                                          var checkinstatus = checkDifference ? 'late' : currentTime.isBefore(convertedShiftTime!.add(Duration(minutes: 15)))
                                              && currentTime.isAfter(convertedShiftTime!.subtract(Duration(minutes: 15))) ? 'perfect' :

                                          'early';

                                          if(checkinstatus == 'late'){
                                            Get.defaultDialog(
                                                title: 'Reason For Coming Late',
                                                content: Padding(
                                                  padding: const EdgeInsets.all(16.0),
                                                  child: Column(
                                                    children: [
                                                      TextFormField(
                                                        controller: reasonController
                                                        ,decoration: InputDecoration(
                                                          label: Text("Reason for your late login"),
                                                          border: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black)
                                                          )
                                                      ),

                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                onConfirm: (){
                                                  print(checkinstatus);
                                                  firestore.collection('attendence_report')
                                                      .add(AttendencReportModel(
                                                    date : DateFormat('yyyy/MM/dd').format(DateTime.now()),
                                                    reason: reasonController.text,
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
                                                      reasonController.clear();
                                                      Get.back();
                                                    });

                                                    setState(() {
                                                      loading =false;
                                                    });


                                                  });
                                                },

                                                textConfirm: "Submit"

                                            );
                                          }else{
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
                                          }
                                        }
                                        else{

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

                                          ),))),

                                    ],
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
                                  currentDocument.isNotEmpty && checkoutTime == '' ?  Container(

                                      height: 200,
                                      child: CountdownPage(hours:endDifference!.inHours,minutes: endDifference!.inMinutes % 60,seconds: endDifference!.inSeconds % 60,))
                                      : SizedBox(),
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

                              return Padding(
                                padding:  EdgeInsets.only(left: Get.width*0.2),
                                child: Wrap(
                                  children: [
                                    buildCard('View Employees','${empDocs.length}\nEmployees'),
                                    buildCard('View Departments','${depDocs.length}\nDepartments'),
                                    buildCard('Daily Logins','${attendenceDocs.length}\nDaily Logins'),

                                    Container(
                                        margin: EdgeInsets.symmetric(horizontal: 30),
                                        padding: EdgeInsets.only(right: Get.width*0.1),
                                        height: Get.height*0.45,
                                        child: PieChartMine(dataMap: {
                                          "% of employee working":double.parse(attendenceDocs.length.toString()) ,
                                          "% of employee on leave": double.parse(workingEmployees.toString()),

                                        },)),
                                  ],
                                ),
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

  buildCard(String title,String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,bottom: 15),
      child: Container(
        width: 300,
        height: 200,
        child: Card(
          elevation: 10,
          child:Stack(
            children: [
              Container(
                width: 300,

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
      ),
    );

  }


// Widget _countDownTimer () {
//   var report = '';
//   // var timing = snapshot.requireData[1];
//   String checkInTime = "-----";
//   String checkOutTime = "-----";
//   String date = "-----";
//   int endTime = 0;
//   bool checkLoginTimeEarly =true;
//   bool checkLoginTimeLate = true;
//   bool checkLoginTimeBefore = true;
//   int endTime1 = 0;
//
//   int initialTime = 0;
//   if (report != "No Data") {
//     checkInTime = checkinTime;
//     // report["checkin"];
//     checkOutTime = checkoutTime == "" ? "-----" : checkoutTime;
//     // report["checkout"];
//     date = date;
//     // report["date"];
//     var dateAndTime =
//     DateFormat('hh:mm a').parse(checkInTime).toString();
//     var splitDateAndTime = dateAndTime.split(' ');
//     checkInTime = splitDateAndTime[1];
//     // String day = date.substring(0, 2);
//     // String month = date.substring(3, 5);
//     // String year = date.substring(6, 10);
//     date = '2022-05-11';
//         // year + '-' + month + '-' + day;
//     // if (timing.studyPermit == '0' && timing.maternityPermit == '0') {
//
//
//     var dateAndTimetest =
//     DateFormat('hh:mm').parse(shiftTime.replaceAll('PM', '')); /// Reporting time
//
//
//     var reprtingDateTime = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,dateAndTimetest.hour,dateAndTimetest.second);
//
//     print('reportTime $dateAndTimetest');
//
//
//
//     var closinttime = dateAndTimetest.add(Duration(hours:  int.parse(workinghours)));
//     checkLoginTimeBefore = closinttime.isBefore(dateAndTimetest);
//     checkLoginTimeEarly = closinttime.isAfter(DateFormat('hh:mm').parse(DateFormat('hh:mm').format(DateTime(1970,01,01,DateTime.now().hour,DateTime.now().minute,DateTime.now().second))));
//     checkLoginTimeLate = closinttime.isBefore(DateFormat('hh:mm').parse(DateFormat('hh:mm').format(DateTime.now())));
//
//     print('close $closinttime $checkLoginTimeEarly $checkLoginTimeBefore');
//
//     initialTime = checkLoginTimeLate ? closinttime.difference(dateAndTimetest).inHours : DateFormat('hh:mm a').parse(DateFormat('hh:mm a').format(DateTime.now())).difference(dateAndTimetest).inSeconds;
//
//     print('initime ${DateFormat('hh:mm a').parse(DateFormat('hh:mm a').format(DateTime.now()))}');
//
//
//     print(DateTime.now());
//     // endTime = checkOutTime != "-----"?
//     // dateAndTimetest.add(Duration(hours:  int.parse(widget.userModel.hoursOfShift))).hour : 0;
//
//     // endTime =  closinttime.difference(DateFormat('hh:mm').parse(DateFormat('hh:mm').format(DateTime.now()))).inHours;
//
//     closinttime = DateTime(1970,01,01,closinttime.hour,closinttime.hour,closinttime.second);
//
//     print('nerw closin time ${closinttime}');
//
//     endTime =  closinttime.difference(dateAndTimetest).inSeconds;
//
//     endTime1 =
//     //         closinttime.millisecondsSinceEpoch +
//     // (1000 * (int.parse(widget.userModel.hoursOfShift) * 3600));
//
//     checkOutTime == "-----"
//         ? DateTime.parse(date + ' ' + DateFormat('hh:mm:ss.SSS').format(dateAndTimetest))
//         .millisecondsSinceEpoch +
//         (1000 * (int.parse(workinghours) * 3600))
//         : 0;
//
//     print('checvkintime ${DateFormat('hh:mm:ss.SSS').format(dateAndTimetest)}');
//     // if(checkOutTime != "-----"){
//     //   _controller.pause();
//     // }
//     // } else {
//     //   endT.ime = checkOutTime == "-----"
//     //       ? DateTime.parse(date + ' ' + checkInTime)
//     //               .millisecondsSinceEpoch +
//     //           (1000 * (5 * 3600))
//     //       : 0;
//     // }
//     print('endtime $endTime $endTime1');
//   }
//   // _controller.start();
//   print('endtime $endTime');
//   print('initime $initialTime');
//   print('checkoutime $checkOutTime ${checkOutTime != "-----"}');
//
//   // print('${initialTime > int.parse(shiftTime) * 3600} $checkLoginTimeBefore ${checkInTime == "-----" } ${ checkOutTime != "-----" }' );
//
//   CountdownTimerController _controller2 = CountdownTimerController(endTime: 4);
//   return Center(
//     child: Container(
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.center,
//               child: CircularCountDownTimer(
//                 // Countdown duration in Seconds.
//                 duration: 6 ,
//
//                 // Countdown initial elapsed Duration in Seconds.
//                 initialDuration: 1,
//
//                 // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
//                 controller: _controller,
//
//                 // Width of the Countdown Widget.
//                 width: 120,
//
//                 // Height of the Countdown Widget.
//                 height: Get.width*0.4,
//
//                 // Ring Color for Countdown Widget.
//                 ringColor: Colors.grey[300]!,
//
//                 // Ring Gradient for Countdown Widget.
//                 ringGradient: null,
//
//                 // Filling Color for Countdown Widget.
//                 fillColor: Colors.green.shade400,
//
//                 // Filling Gradient for Countdown Widget.
//                 fillGradient: null,
//
//                 // Background Color for Countdown Widget.
//                 backgroundColor: Colors.white.withOpacity(0.8),
//
//                 // Background Gradient for Countdown Widget.
//                 backgroundGradient: null,
//
//                 // Border Thickness of the Countdown Ring.
//                 strokeWidth: 7.0,
//
//                 // Begin and end contours with a flat edge and no extension.
//                 strokeCap: StrokeCap.round,
//
//                 // Text Style for Countdown Text.
//                 textStyle: TextStyle(
//                     fontSize: Get.width*0.4,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//
//                 // Format for the Countdown Text.
//                 textFormat: CountdownTextFormat.S,
//
//                 // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
//                 isReverse: false,
//
//                 // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
//                 isReverseAnimation: false,
//
//                 // Handles visibility of the Countdown Text.
//                 isTimerTextShown: false,
//
//                 // Handles the timer start.
//                 autoStart: true,
//
//                 // This Callback will execute when the Countdown Starts.
//                 onStart: () {
//                   // Here, do whatever you want
//                   print('Countdown Started');
//                 },
//
//                 // This Callback will execute when the Countdown Ends.
//                 onComplete: () {
//                   // Here, do whatever you want
//                   print('Countdown Ended');
//                 },
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 margin: EdgeInsets.only(top: 50),
//                 child: Column(
//                   children: [
//                     CountdownTimer(
//                       endWidget:  Text(''),
//                       endTime: 8,
//                       textStyle:  TextStyle(
//                           color: Colors.black,
//                           fontSize: Get.height*0.02,
//                           fontWeight: FontWeight.bold
//
//                       ),
//                       controller: _controller2,
//                       onEnd: () {
//                         if (checkOutTime == '-----') {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text(
//                                 'Shift over. You can check out now.',
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                     SizedBox(height: 5,),
//                     Text(
//                       DateFormat('dd-MM-yyyy')
//                           .format(DateTime.now()),
//                       style: TextStyle(
//                           fontSize: Get.width*0.027,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//                     SizedBox(height: 5,),
//                     Text(
//                       'ONLINE',
//                       style: TextStyle(
//                           fontSize: Get.width*0.027,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//           ],
//         )
//
//     ),
//   );
// }

}
