import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/constants/constants.dart';

import '../home/homepage.dart';
class CheckinHistory extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;
  const CheckinHistory({Key? key, required this.userDoc}) : super(key: key);

  @override
  _CheckinHistoryState createState() => _CheckinHistoryState();
}

class _CheckinHistoryState extends State<CheckinHistory> {
  var selectedValue = 0;



  @override
  Widget build(BuildContext context) {

    List<TableRow> tableRow = [
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
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        '<Feb 07, 22>',
                        style: TextStyle(color: kblue, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: Get.width,
                height: 300,
                child: Table(
                  border: TableBorder.symmetric(inside:BorderSide(color: Kdblue),outside:BorderSide(color: Colors.white)),
                  children: tableRow,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
