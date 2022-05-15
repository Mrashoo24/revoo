import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class RFQsStatusa extends StatefulWidget {
  const RFQsStatusa({Key? key}) : super(key: key);

  @override
  _RFQsStatusState createState() => _RFQsStatusState();
}

class _RFQsStatusState extends State<RFQsStatusa> {

  String initialValue = '';

  var itemList = [
    '',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
  ];



 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('RFQs Status',style: TextStyle(color: kblue,fontSize: 30),),
                    Container(

                      decoration: BoxDecoration(
                        color:  bgGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 8),
                              Row(
                                children: [
                                  Image.asset('asset/filterimg.png',color: kyellow,),
                                  Text('Filter',style: TextStyle(color: kblue),),
                                ],
                              ),

                              DropdownButton(

                                icon: Icon(Icons.keyboard_arrow_down,color: Kdblue,),

                                items: itemList.map((String items) {

                                  return DropdownMenuItem(value: items, child: Text(items));

                                }).toList(), onChanged: (String? value) {  },
                              ),
                            ],
                          ),
                      ),
                    ),
                  ],
                ),
              ),
SizedBox(height: 20),
               Row(
                 children: [
                   SizedBox(width: 12),
                   CircleAvatar(
                      backgroundColor: kyellow,
                      radius: 10,//Text
                    ),SizedBox(width: 8),Text('Sent',style: TextStyle(color: kblue,fontSize: 20),),
                   SizedBox(width: 25),
                   CircleAvatar(
                     backgroundColor: reddy,
                     radius: 10,//Text
                   ),SizedBox(width: 8),Text('Pending',style: TextStyle(color: kblue,fontSize: 20),),
                 ],
               ),
              SizedBox(height: 15),
              Container(
  height: Get.height,
                width: Get.width,

                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      DataTable(
                          columns: [
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text('RFQs',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.red
                            ),),),
                            DataColumn(label: Text('Prize',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.red
                            ),),),
                            DataColumn(label: Text('Vendor',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.red
                            ),),),
                            DataColumn(label: Text('Status',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.red
                            ),),),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(
                                CircleAvatar(
                                  backgroundColor: kyellow,
                                  radius: 10,//Text
                                ),
                              ),
                              DataCell(
                                  Text('RFQ Name')
                              ),
                              DataCell(
                                  Text('8000')
                              ),
                              DataCell(
                                  Text('SQL Engine')
                              ),
                              DataCell(
                                  Text('On-Time')
                              ),



                            ]),
                            DataRow(cells: [
                              DataCell(
                                CircleAvatar(
                                  backgroundColor: reddy,
                                  radius: 10,//Text
                                ),
                              ),
                              DataCell(
                                  Text('RFQ Name')
                              ),
                              DataCell(
                                  Text('8000')
                              ),
                              DataCell(
                                  Text('SQL Engine')
                              ),
                              DataCell(
                                  Text('Late')
                              ),



                            ]),
                            DataRow(cells: [
                              DataCell(
                                CircleAvatar(
                                  backgroundColor: kyellow,
                                  radius: 10,//Text
                                ),
                              ),
                              DataCell(
                                  Text('RFQ Name')
                              ),
                              DataCell(
                                  Text('8000')
                              ),
                              DataCell(
                                  Text('SQL Engine')
                              ),
                              DataCell(
                                  Text('On-Time')
                              ),



                            ]),
                            DataRow(cells: [
                              DataCell(
                                CircleAvatar(
                                  backgroundColor: reddy,
                                  radius: 10,//Text
                                ),
                              ),
                              DataCell(
                                  Text('RFQ Name')
                              ),
                              DataCell(
                                  Text('8000')
                              ),
                              DataCell(
                                  Text('SQL Engine')
                              ),
                              DataCell(
                                  Text('Late')
                              ),



                            ]),
                            DataRow(cells: [
                              DataCell(
                                CircleAvatar(
                                  backgroundColor: kyellow,
                                  radius: 10,//Text
                                ),
                              ),
                              DataCell(
                                  Text('RFQ Name')
                              ),
                              DataCell(
                                  Text('8000')
                              ),
                              DataCell(
                                  Text('SQL Engine')
                              ),
                              DataCell(
                                  Text('On-Time')
                              ),



                            ]),
                            DataRow(cells: [
                              DataCell(
                                CircleAvatar(
                                  backgroundColor: reddy,
                                  radius: 10,//Text
                                ),
                              ),
                              DataCell(
                                  Text('RFQ Name')
                              ),
                              DataCell(
                                  Text('8000')
                              ),
                              DataCell(
                                  Text('SQL Engine')
                              ),
                              DataCell(
                                  Text('Late')
                              ),



                            ]),
                            DataRow(cells: [
                              DataCell(
                                CircleAvatar(
                                  backgroundColor: kyellow,
                                  radius: 10,//Text
                                ),
                              ),
                              DataCell(
                                  Text('RFQ Name')
                              ),
                              DataCell(
                                  Text('8000')
                              ),
                              DataCell(
                                  Text('SQL Engine')
                              ),
                              DataCell(
                                  Text('On-Time')
                              ),



                            ]),
                            DataRow(cells: [
                              DataCell(
                                CircleAvatar(
                                  backgroundColor: reddy,
                                  radius: 10,//Text
                                ),
                              ),
                              DataCell(
                                  Text('RFQ Name')
                              ),
                              DataCell(
                                  Text('8000')
                              ),
                              DataCell(
                                  Text('SQL Engine')
                              ),
                              DataCell(
                                  Text('Late')
                              ),



                            ]),
                            DataRow(cells: [
                              DataCell(
                                CircleAvatar(
                                  backgroundColor: kyellow,
                                  radius: 10,//Text
                                ),
                              ),
                              DataCell(
                                  Text('RFQ Name')
                              ),
                              DataCell(
                                  Text('8000')
                              ),
                              DataCell(
                                  Text('SQL Engine')
                              ),
                              DataCell(
                                  Text('On-Time')
                              ),



                            ]),
                            DataRow(cells: [
                              DataCell(
                                CircleAvatar(
                                  backgroundColor: reddy,
                                  radius: 10,//Text
                                ),
                              ),
                              DataCell(
                                  Text('RFQ Name')
                              ),
                              DataCell(
                                  Text('8000')
                              ),
                              DataCell(
                                  Text('SQL Engine')
                              ),
                              DataCell(
                                  Text('Late')
                              ),



                            ]),
                            DataRow(cells: [
                              DataCell(
                                CircleAvatar(
                                  backgroundColor: kyellow,
                                  radius: 10,//Text
                                ),
                              ),
                              DataCell(
                                  Text('RFQ Name')
                              ),
                              DataCell(
                                  Text('8000')
                              ),
                              DataCell(
                                  Text('SQL Engine')
                              ),
                              DataCell(
                                  Text('On-Time')
                              ),



                            ]),

                          ])
                    ],
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
