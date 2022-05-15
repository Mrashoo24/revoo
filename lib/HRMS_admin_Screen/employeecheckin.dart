import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/constants/constants.dart';
import 'package:collection/collection.dart';


import '../home/homepage.dart';

class EmployeeCheckin extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;
  const EmployeeCheckin({Key? key, required this.userDoc}) : super(key: key);

  @override
  _EmployeeCheckinState createState() => _EmployeeCheckinState();
}

class _EmployeeCheckinState extends State<EmployeeCheckin> {
  var selectedValue = '';



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
                      'Daily Checkins Employees',
                      style: TextStyle(color: kblue, fontSize: 25),
                    ),
                    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream : FirebaseFirestore.instance.collection('Employee')
                            .where('cid',isEqualTo: widget.userDoc.get('cid'))

                            .snapshots(),
                      builder: (context, snapshot) {


                        if(!snapshot.hasData){
                          return kprogressbar;
                        }

                        var  edoc = snapshot.requireData.docs;
print(edoc.length );

                        selectedValue = edoc.first.get('uid');

                        print('gotSelected $selectedValue');

                        return DropdownButton(
                            items: edoc.mapIndexed
                              ((index, element) => DropdownMenuItem(child: Text(element.get('name')),value: element.get('uid'),)).toList(),
                            onChanged: ( value){
                              print(value);
                          setState(() {
                            selectedValue = value as String;
                          });
                        });
                      }
                    )
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

            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance.collection('attendence_report')

                    .where('uid',isEqualTo: selectedValue)
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
                      height: 300,
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
