import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Charts extends StatefulWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {


  String initialValue = '';

  var itemList = [
    '',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7'
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 12),
                  Text('Charts',style: TextStyle(color: kblue,fontSize: 30),),

                  SizedBox(width: 80,),
                  Container(
                    width: 200,height: 50,
                    decoration: BoxDecoration(
                      color:  bgGrey,
                      borderRadius: BorderRadius.circular(20),


                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SizedBox(width: 8),
                          Image.asset('asset/filterimg.png',color: kyellow,),
                          SizedBox(width: 10),
                          Text('Filter',style: TextStyle(color: kblue,fontSize: 25),),
                          SizedBox(width: 50),

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
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 12),
                  CircleAvatar(
                    backgroundColor: kyellow,
                    radius: 10,//Text
                  ),SizedBox(width: 8),Text('Open',style: TextStyle(color: Colors.grey,fontSize: 20),),
                  SizedBox(width: 25),
                  CircleAvatar(
                    backgroundColor: reddy,
                    radius: 10,//Text
                  ),SizedBox(width: 8),Text('Closed',style: TextStyle(color: Colors.grey,fontSize: 20),),
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
                            DataColumn(label: Text('Name',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),),),
                            DataColumn(label: Text('Type',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),),),
                            DataColumn(label: Text('Code',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),),),
                            DataColumn(label: Text('Entries',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),),),
                            DataColumn(label: Text(' ',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
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
                                  Text('Acc Name')
                              ),
                              DataCell(
                                  Text('CHQ')
                              ),
                              DataCell(
                                  Text('899')
                              ),
                              DataCell(
                                  Text('78',style: TextStyle(color: kyellow),)
                              ),
                              DataCell(
                                Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),


                                  ),
                                  child: Center(
                                    child: Text('Edit',style: TextStyle(
                                        color: Colors.white,fontSize: 15
                                    ),),
                                  ),

                                ),
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
                                  Text('Acc Name')
                              ),
                              DataCell(
                                  Text('CHQ')
                              ),
                              DataCell(
                                  Text('899')
                              ),
                              DataCell(
                                  Text('78',style: TextStyle(color: kyellow),)
                              ),
                              DataCell(
                                Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),


                                  ),
                                  child: Center(
                                    child: Text('Edit',style: TextStyle(
                                        color: Colors.white,fontSize: 15
                                    ),),
                                  ),

                                ),
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
                                  Text('Acc Name')
                              ),
                              DataCell(
                                  Text('CHQ')
                              ),
                              DataCell(
                                  Text('899')
                              ),
                              DataCell(
                                  Text('78',style: TextStyle(color: kyellow),)
                              ),
                              DataCell(
                                Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),


                                  ),
                                  child: Center(
                                    child: Text('Edit',style: TextStyle(
                                        color: Colors.white,fontSize: 15
                                    ),),
                                  ),

                                ),
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
                                  Text('Acc Name')
                              ),
                              DataCell(
                                  Text('CHQ')
                              ),
                              DataCell(
                                  Text('899')
                              ),
                              DataCell(
                                  Text('78',style: TextStyle(color: kyellow),)
                              ),
                              DataCell(
                                Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),


                                  ),
                                  child: Center(
                                    child: Text('Edit',style: TextStyle(
                                        color: Colors.white,fontSize: 15
                                    ),),
                                  ),

                                ),
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
                                  Text('Acc Name')
                              ),
                              DataCell(
                                  Text('CHQ')
                              ),
                              DataCell(
                                  Text('899')
                              ),
                              DataCell(
                                  Text('78',style: TextStyle(color: kyellow),)
                              ),
                              DataCell(
                                Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),


                                  ),
                                  child: Center(
                                    child: Text('Edit',style: TextStyle(
                                        color: Colors.white,fontSize: 15
                                    ),),
                                  ),

                                ),
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
                                  Text('Acc Name')
                              ),
                              DataCell(
                                  Text('CHQ')
                              ),
                              DataCell(
                                  Text('899')
                              ),
                              DataCell(
                                  Text('78',style: TextStyle(color: kyellow),)
                              ),
                              DataCell(
                                Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),


                                  ),
                                  child: Center(
                                    child: Text('Edit',style: TextStyle(
                                        color: Colors.white,fontSize: 15
                                    ),),
                                  ),

                                ),
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
                                  Text('Acc Name')
                              ),
                              DataCell(
                                  Text('CHQ')
                              ),
                              DataCell(
                                  Text('899')
                              ),
                              DataCell(
                                  Text('78',style: TextStyle(color: kyellow),)
                              ),
                              DataCell(
                                Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),


                                  ),
                                  child: Center(
                                    child: Text('Edit',style: TextStyle(
                                        color: Colors.white,fontSize: 15
                                    ),),
                                  ),

                                ),
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
                                  Text('Acc Name')
                              ),
                              DataCell(
                                  Text('CHQ')
                              ),
                              DataCell(
                                  Text('899')
                              ),
                              DataCell(
                                  Text('78',style: TextStyle(color: kyellow),)
                              ),
                              DataCell(
                                Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),


                                  ),
                                  child: Center(
                                    child: Text('Edit',style: TextStyle(
                                        color: Colors.white,fontSize: 15
                                    ),),
                                  ),

                                ),
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
                                  Text('Acc Name')
                              ),
                              DataCell(
                                  Text('CHQ')
                              ),
                              DataCell(
                                  Text('899')
                              ),
                              DataCell(
                                  Text('78',style: TextStyle(color: kyellow),)
                              ),
                              DataCell(
                                Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),


                                  ),
                                  child: Center(
                                    child: Text('Edit',style: TextStyle(
                                        color: Colors.white,fontSize: 15
                                    ),),
                                  ),

                                ),
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
                                  Text('Acc Name')
                              ),
                              DataCell(
                                  Text('CHQ')
                              ),
                              DataCell(
                                  Text('899')
                              ),
                              DataCell(
                                  Text('78',style: TextStyle(color: kyellow),)
                              ),
                              DataCell(
                                Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),


                                  ),
                                  child: Center(
                                    child: Text('Edit',style: TextStyle(
                                        color: Colors.white,fontSize: 15
                                    ),),
                                  ),

                                ),
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
                                  Text('Acc Name')
                              ),
                              DataCell(
                                  Text('CHQ')
                              ),
                              DataCell(
                                  Text('899')
                              ),
                              DataCell(
                                  Text('78',style: TextStyle(color: kyellow),)
                              ),
                              DataCell(
                                Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),


                                  ),
                                  child: Center(
                                    child: Text('Edit',style: TextStyle(
                                        color: Colors.white,fontSize: 15
                                    ),),
                                  ),

                                ),
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
                                  Text('Acc Name')
                              ),
                              DataCell(
                                  Text('CHQ')
                              ),
                              DataCell(
                                  Text('899')
                              ),
                              DataCell(
                                  Text('78',style: TextStyle(color: kyellow),)
                              ),
                              DataCell(
                                Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),


                                  ),
                                  child: Center(
                                    child: Text('Edit',style: TextStyle(
                                        color: Colors.white,fontSize: 15
                                    ),),
                                  ),

                                ),
                              ),



                            ]),
                          ],
                      ),
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
