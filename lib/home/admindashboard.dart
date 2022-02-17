import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:revoo/constants/constants.dart';
import 'package:cell_calendar/cell_calendar.dart';


import '../piechart.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key key= const Key('AdminDashboard')}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {

  final cellCalendarPageController = CellCalendarPageController();

  var sampleEvents = [
    CalendarEvent(eventName: "Event 1",eventDate: DateTime.now(),eventBackgroundColor: Colors.black),
    CalendarEvent(eventName: "Event 2",eventDate: DateTime.now()),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
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
                      Text('Daily Check-in, February 07, 12',style: TextStyle(color: ktextcolor,fontSize: 18),),
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
                                    child: Center(child: Text('08',style: TextStyle(color: kblue,fontSize: 18),)),
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                    height: Get.height*0.05,
                                    width: Get.width*0.09,
                                    color: Colors.grey.shade400,
                                    child: Center(child: Text('20',style: TextStyle(color: kblue,fontSize: 18),)),
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
                                          Text('AM',style: TextStyle(color: kblue,fontSize: 18),),
                                          SizedBox(width: 10,),
                                          Image.asset('asset/smallarrowdown.png'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  Image.asset('asset/pencilicon.png'),
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
                                child: Center(child: Text('--',style: TextStyle(color: kblue,fontSize: 18),)),
                              ),
                              SizedBox(width: 15),
                              Container(
                                height: Get.height*0.05,
                                width: Get.width*0.09,
                                color: Colors.grey.shade400,
                                child: Center(child: Text('--',style: TextStyle(color: kblue,fontSize: 18),)),
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
                                      Text('--',style: TextStyle(color: kblue,fontSize: 18),),
                                      SizedBox(width: 10,),
                                      Image.asset('asset/smallarrowdown.png'),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 16,),
                              Image.asset('asset/pencilicon.png'),

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
                            child: Center(child: Text('05: 00',style: TextStyle(color: kblue,fontSize: 18),)),

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
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10),
                            child: Card(
                              elevation: 5,
                              color: Colors.grey.shade200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50.0,left: 8,right: 8),
                                    child: Text('You have 2 new request/approvals from the finance department,HR department,and the accounting department ',
                                      style: TextStyle(
                                          color: kblue
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0,left: 8,right: 0),
                                        child: Text('Click here to',
                                          style: TextStyle(
                                              color: kblue,
                                            fontSize: 16
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0,right: 2),
                                        child: Text(' View Now!',
                                          style: TextStyle(
                                              color: kyellow,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),

                                    ],
                                  ),
                                  Image.asset('asset/rightarrow.png',width: 30,),
                                  SizedBox(height: 20,),

                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                margin: EdgeInsets.only(right: 25),
                                child: Image.asset('asset/wrongyellow.png',width: 30,height: 30,)),
                          )

                        ],
                      ),





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

            buildCard('Veiw Employees','40\nEmployees'),
            buildCard('Veiw Departments','40\nDepartments'),
            buildCard('Daily Logins','40\nDaily Logins'),

            Container(
              height: Get.height*0.4,
                child: HomePage()),

            Padding(
                padding: const EdgeInsets.only(bottom: 35.0,top: 15,),
              child: Card(
                elevation: 10,
                color: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)
                ),
                child: Padding(
                  padding:   EdgeInsets.symmetric(horizontal: 8.0,vertical: Get.height*0.05),
                  child: Column(
                    children: [
                      SizedBox(height: 12,),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 8,right: 8),
                        child: Text("Department Progress",
                          style: TextStyle(
                              color: kblue,fontSize: 25
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: Get.height*0.06,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 12,),
                          Container(
                            width: Get.width*0.20,
                            child: Text("HR",
                              style: TextStyle(
                                  color: Colors.grey.shade700,fontSize: 18
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            child: LinearPercentIndicator(
                              // width: MediaQuery.of(context).size.width*0.4,
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2500,
                              percent: 0.8,
                              // center: Text("\₹ ${widget.urgentcase.raised}",style: TextStyle(color: kwhite,letterSpacing: 2),),
                              linearStrokeCap: LinearStrokeCap.roundAll ,

                              linearGradient: LinearGradient(
                                colors: [
                                  Kdblue,
                                  Colors.lightBlueAccent
                                ]
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Get.height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 12,),
                          Container(
                            width: Get.width*0.20,
                            child: Text("Finance",
                              style: TextStyle(
                                  color: Colors.grey.shade700,fontSize: 18
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            child: LinearPercentIndicator(
                              // width: MediaQuery.of(context).size.width*0.4,
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2500,
                              percent: 0.8,
                              // center: Text("\₹ ${widget.urgentcase.raised}",style: TextStyle(color: kwhite,letterSpacing: 2),),
                              linearStrokeCap: LinearStrokeCap.roundAll ,

                              linearGradient: LinearGradient(
                                  colors: [
                                    Kdblue,
                                    Colors.lightBlueAccent
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height*0.02,),

                      Row(
                        children: [
                          SizedBox(height: 12,),
                          Container(
                            width: Get.width*0.20,
                            child: Text("Account",
                              style: TextStyle(
                                  color: Colors.grey.shade700,fontSize: 18
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            child: LinearPercentIndicator(
                              // width: MediaQuery.of(context).size.width*0.4,
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2500,
                              percent: 0.8,
                              // center: Text("\₹ ${widget.urgentcase.raised}",style: TextStyle(color: kwhite,letterSpacing: 2),),
                              linearStrokeCap: LinearStrokeCap.roundAll ,

                              linearGradient: LinearGradient(
                                  colors: [
                                    Kdblue,
                                    Colors.lightBlueAccent
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),




                    ],
                  ),
                ),
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
