import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class PRCalender extends StatefulWidget {
  const PRCalender({Key? key}) : super(key: key);

  @override
  _PRCalenderState createState() => _PRCalenderState();
}

class _PRCalenderState extends State<PRCalender> {

  var sampleEvents = [
    CalendarEvent(eventName: "Event 1",eventDate: DateTime.now(),eventBackgroundColor: Colors.black),
    CalendarEvent(eventName: "Event 2",eventDate: DateTime.now()),

  ];

  get cellCalendarPageController => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:   EdgeInsets.all(20.0),
          child:  Column(
            children: [



              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text('Calendar',style: TextStyle(color:kblue,fontSize: 35),
                    ),
                    Image.asset("asset/plsadd.png"),
                  ],
                ),
              ),

              Container(
                height: 600,
                margin: EdgeInsets.only(left: 10,right: 10),
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
                                color: Colors.yellow,
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

              Row(
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    color: Colors.black,
                  ),SizedBox(width: 8),
                  Text("Vendor Meetings",style: TextStyle(color: Colors.grey,fontSize: 18),),

SizedBox(width: 25),

                  Container(
                    width: 18,
                    height: 18,
                    color: kblue,
                  ),SizedBox(width: 8),
                  Text("Vendor Meetings",style: TextStyle(color: Colors.grey,fontSize: 18),),
                ],
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    color: greytxtbx,
                  ),SizedBox(width: 8),
                  Text("Scheduled",style: TextStyle(color: Colors.grey,fontSize: 18),),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                width: 500,
                height: 90,

                decoration: BoxDecoration(

                  color: Kdblue,


                  borderRadius: BorderRadius.circular(15),

                ),
                child: Align(
                  alignment: Alignment.topLeft,

                  child: Padding(
                    padding:   EdgeInsets.only(left: 18.0,top: 13),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'BIO METRIC',
                              style: TextStyle(
                                color: Colors.yellow.shade600,
                                fontSize: 19,


                              ),
                            ),
                            Padding(
                              padding:   EdgeInsets.only(left: 189.0,bottom: 10),
                              child: InkWell(child: Icon(Icons.more_vert,color: Colors.white)),
                            ),

                          ],
                        ),
                        Padding(
                          padding:   EdgeInsets.only(right: 120),
                          child: Center(
                            child: Text(
                              "Adrees sec 14 kherghr shelter park opp littel world mall  ",
                              style: TextStyle(
                                color: Colors.white,fontSize: 12,
                              ),
                            ),
                          ),
                        )

                      ],
                    ),

                  ),
                ),

              ),

              SizedBox(height: 10,),
              Container(
                width: 500,
                height: 90,

                decoration: BoxDecoration(

                  color: Kdblue,


                  borderRadius: BorderRadius.circular(15),

                ),
                child: Align(
                  alignment: Alignment.topLeft,

                  child: Padding(
                    padding:   EdgeInsets.only(left: 18.0,top: 13),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Task Name 1',
                              style: TextStyle(
                                color: Colors.yellow.shade600,
                                fontSize: 19,


                              ),
                            ),
                            Padding(
                              padding:   EdgeInsets.only(left: 180.0,bottom: 10),
                              child: InkWell(child: Icon(Icons.more_vert,color: Colors.white)),
                            ),

                          ],
                        ),
                        Padding(
                          padding:   EdgeInsets.only(right: 120),
                          child: Center(
                            child: Text(
                              "Adrees sec 14 kherghr shelter park opp littel world mall  ",
                              style: TextStyle(
                                color: Colors.white,fontSize: 12,
                              ),
                            ),
                          ),
                        )

                      ],
                    ),

                  ),
                ),

              ),

              SizedBox(height: 10,),
              Container(
                width: 500,
                height: 90,

                decoration: BoxDecoration(

                  color: Kdblue,


                  borderRadius: BorderRadius.circular(15),

                ),
                child: Align(
                  alignment: Alignment.topLeft,

                  child: Padding(
                    padding:   EdgeInsets.only(left: 18.0,top: 13),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Task Name 1',
                              style: TextStyle(
                                color: Colors.yellow.shade600,
                                fontSize: 19,


                              ),
                            ),
                            Padding(
                              padding:   EdgeInsets.only(left: 180.0,bottom: 10),
                              child: InkWell(child: Icon(Icons.more_vert,color: Colors.white)),
                            ),

                          ],
                        ),
                        Padding(
                          padding:   EdgeInsets.only(right: 120),
                          child: Center(
                            child: Text(
                              "Adrees sec 14 kherghr shelter park opp littel world mall  ",
                              style: TextStyle(
                                color: Colors.white,fontSize: 12,
                              ),
                            ),
                          ),
                        )

                      ],
                    ),

                  ),
                ),

              ),


            ],
          ),
        ),

      ),
    );
  }
}
