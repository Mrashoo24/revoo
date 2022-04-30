import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/constants/constants.dart';

import '../home/homepage.dart';

class EmployeeCheckin extends StatefulWidget {
  const EmployeeCheckin({Key? key}) : super(key: key);

  @override
  _EmployeeCheckinState createState() => _EmployeeCheckinState();
}

class _EmployeeCheckinState extends State<EmployeeCheckin> {
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
                'Emp Name',
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
                'Arsalan',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: Text(
                'Software En.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: AutoSizeText(
                'IT',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: AutoSizeText(
                'IT',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                    InkWell(
                      onTap: (){
                          Get.to(HomePageMain());
                      },
                      child: Card(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: InkWell(
                          child: Container(
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
                                child: Text('Your\nLogin',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                              ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Kdblue,bluess]),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ),
                    )
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
