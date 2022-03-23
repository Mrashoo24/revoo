import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/graph/piechart.dart';

import '../constants/constants.dart';
import '../graph/linegraph.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
    bool pichart = true;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Reports",style: TextStyle(color: kblue,fontSize: 35),),
                  SizedBox(width: 50),
                  InkWell(
                      onTap: (){
                        setState(() {
                          pichart = true;
                        });
                      },
                      child: Image.asset("asset/clockline.png")),
                  SizedBox(width: 50),
                  InkWell(
                      onTap: (){
                        setState(() {
                          pichart = false;
                        });
                      },
                      child: Image.asset("asset/graphhh.png"))
                ],
              ),

             !pichart ? Container(
                  height: 300,
                  child: DateTimeComboLinePointChart.withSampleData()
              ):

              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PieChartMine(dataMap: {
                  "RFQ SENT": 5,
                  "RFQ RECIEVED": 10,
                  "RFQ PENDING": 10,
                  "RFQ LATE": 10,
                },
                ),
              )),



            ],
          ),
        ),
      ),

    );
  }
}
