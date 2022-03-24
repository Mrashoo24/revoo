import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class JournalEntries extends StatefulWidget {
  const JournalEntries({Key? key}) : super(key: key);

  @override
  _JournalEntriesState createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries> {

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
        body:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:   EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    Text('Journal Entries',style: TextStyle(color: kblue,fontSize: 28),),

                    SizedBox(width: 30,),
                    Container(
                      width: 160,height: 40,
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
                            SizedBox(width: 10),

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
              Padding(
                padding:   EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset('asset/addnew.png')),
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
                          DataColumn(label: Text('Office'),),
                          DataColumn(label: Text('Curr .',style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                          ),),),
                          DataColumn(label: Text('Type',style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                          ),),),
                          DataColumn(label: Text('Amount',style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color:Colors.grey
                          ),),),
                          DataColumn(label: Text('Payment\nMethod',style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                          ),),),




                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(
                                Text('Sales',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('CHQ',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('Account\nTransfer',style: TextStyle(color: Colors.grey),)
                            ),




                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('Sales',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('CHQ',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('Account\nTransfer',style: TextStyle(color: Colors.grey),)
                            ),




                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('Sales',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('CHQ',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('Account\nTransfer',style: TextStyle(color: Colors.grey),)
                            ),




                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('Sales',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('CHQ',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('Account\nTransfer',style: TextStyle(color: Colors.grey),)
                            ),




                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('Sales',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('CHQ',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('Account\nTransfer',style: TextStyle(color: Colors.grey),)
                            ),




                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('Sales',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('CHQ',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('Account\nTransfer',style: TextStyle(color: Colors.grey),)
                            ),




                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('Sales',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('CHQ',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('Account\nTransfer',style: TextStyle(color: Colors.grey),)
                            ),




                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('Sales',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('CHQ',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('Account\nTransfer',style: TextStyle(color: Colors.grey),)
                            ),




                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('Sales',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('CHQ',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('Account\nTransfer',style: TextStyle(color: Colors.grey),)
                            ),




                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('Sales',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('CHQ',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('Account\nTransfer',style: TextStyle(color: Colors.grey),)
                            ),




                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('Sales',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('CHQ',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('Account\nTransfer',style: TextStyle(color: Colors.grey),)
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
