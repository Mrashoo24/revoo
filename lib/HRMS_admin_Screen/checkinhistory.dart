import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:revoo/constants/constants.dart';
import 'package:collection/collection.dart';


import '../home/homepage.dart';
class CheckinHistory extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;
  const CheckinHistory({Key? key, required this.userDoc}) : super(key: key);

  @override
  _CheckinHistoryState createState() => _CheckinHistoryState();
}

class _CheckinHistoryState extends State<CheckinHistory> {
  var selectedValue = 0;
  String? dateSelected = DateFormat('yyyy/MM/dd').format(DateTime.now());
  String? todateSelected= DateFormat('yyyy/MM/dd').format(DateTime.now().add(Duration(days: 1)));


  @override
  Widget build(BuildContext context) {

    List<TableRow> tableRow = [
      TableRow(
        children: [
          Container(
            height: 30,
            child: Center(
              child: Text(
                'Date',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: Text(
                'Status',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: Text(
                'In time',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: AutoSizeText(
                'Out time',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: AutoSizeText(
                'Hours worked',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),

        ],
      ),
      TableRow(
        children: [
          Container(
            height: 30,
            child: Center(
              child: Text(
                'Status',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: Text(
                'In time',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: AutoSizeText(
                'Out time',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: AutoSizeText(
                'Hours worked',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),

        ],
      ),
      TableRow(

        children: [
          Container(
            height: 60,

            child: Center(
              child: Text(
                'Late',
                style: TextStyle(fontSize: 12,color: Colors.red),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: Text(
                '8:00AM',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: AutoSizeText(
                '9:00PM',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: AutoSizeText(
                '8',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),

        ],
      ),
      TableRow(

        children: [
          Container(
            height: 60,

            child: Center(
              child: Text(
                'Perfect',
                style: TextStyle(fontSize: 12,color: Colors.green),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: Text(
                '8:00AM',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: AutoSizeText(
                '9:00PM',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: AutoSizeText(
                '8',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),

        ],
      ),
    ];

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      'Daily Checkins',
                      style: TextStyle(color: kblue, fontSize: 25),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15.0),
                    //   child: Text(
                    //     '<Feb 07, 22>',
                    //     style: TextStyle(color: kblue, fontSize: 14),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now()
                            .subtract(const Duration(days: 120)),
                        maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                          print('change $date');
                          setState(() {
                            dateSelected = DateFormat('yyyy/MM/dd').format(date);
                          });
                        }, onConfirm: (date) {
                          print('confirm $date');
                          setState(() {
                            dateSelected = DateFormat('yyyy/MM/dd').format(date);
                          });
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.en);
                  },
                  child: Container(
                    color: Colors.yellow,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(dateSelected == null
                          ? "From Date"
                          : DateFormat("yyyy/MM/dd")
                          .parse(dateSelected!)
                          .day
                          .toString() +
                          "-" +
                          DateFormat("yyyy/MM/dd")
                              .parse(dateSelected!)
                              .month
                              .toString() +
                          "-" +
                          DateFormat("yyyy/MM/dd")
                              .parse(dateSelected!)
                              .year
                              .toString()),
                    ),
                  ),
                ),
                 InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime:  DateTime.now(),
                        maxTime: DateTime(2050, 6, 7),
                        onChanged: (date) {
                          print('change $date');
                          setState(() {
                            todateSelected = DateFormat('yyyy/MM/dd').format(date);
                          });
                        }, onConfirm: (date) {
                          print('confirm $date');
                          setState(() {
                            todateSelected = DateFormat('yyyy/MM/dd').format(date);
                          });
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.en);
                  },
                  child: Container(
                    color: Colors.yellow,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(todateSelected == null
                          ? "To Date"
                          : DateFormat("yyyy/MM/dd")
                          .parse(todateSelected!)
                          .day
                          .toString() +
                          "-" +
                          DateFormat("yyyy/MM/dd")
                              .parse(todateSelected!)
                              .month
                              .toString() +
                          "-" +
                          DateFormat("yyyy/MM/dd")
                              .parse(todateSelected!)
                              .year
                              .toString()),
                    ),
                  ),
                ),
              ],
            ),

            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance.collection('attendence_report')
                    .where('uid',isEqualTo: widget.userDoc.get('uid'))
                    .where('date',isGreaterThanOrEqualTo: dateSelected,
                    isLessThanOrEqualTo: todateSelected
                )
                    .snapshots(),
              builder: (context, snapshot) {

                if(!snapshot.hasData){
                  return kprogressbar;

                }

                var bDocs = snapshot.requireData.docs;

                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: Get.width,
                height: Get.height,
                    child:   Column(
                      children: [
                        Table(
                            border: TableBorder.symmetric(inside:BorderSide(color: Kdblue),outside:BorderSide(color: Colors.white)),
                            children: [
                              tableRow[0],

                            ]



                        ),
                        Table(
                            border: TableBorder.symmetric(inside:BorderSide(color: Kdblue),outside:BorderSide(color: Colors.white)),
                            children: bDocs.map((e) {

                              return       TableRow(
                                children: [
                                  Container(
                                    height: 60,

                                    child: Center(
                                      child: Text(
                                        e.get('date').toString().toUpperCase(),
                                        style:TextStyle(fontSize: 12)
                                        ,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 60,

                                    child: Center(
                                      child: Text(
                                        e.get('status').toString().toUpperCase(),
                                        style: e.get('status') == 'late' ?   TextStyle(fontSize: 12,color: Colors.red)
                                        :  TextStyle(fontSize: 12,color: Colors.green)
                                        ,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    child: Center(
                                      child: Text(
                                        e.get('checkin'),
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    child: Center(
                                      child: AutoSizeText(
                                        e.get('checkout'),
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    child: Center(
                                      child: AutoSizeText(
                                        e.get('working_hours'),
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList()



                        ),
                      ],
                    ),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
