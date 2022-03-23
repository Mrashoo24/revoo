import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Recurringpayments extends StatefulWidget {
  const Recurringpayments({Key? key}) : super(key: key);

  @override
  _RecurringpaymentsState createState() => _RecurringpaymentsState();
}

class _RecurringpaymentsState extends State<Recurringpayments> {

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


  bool  bvalue = false;

  bool  dvalue = false;

  bool  dvaluea = false;

  bool  dvaluec = false;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:   EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 12),
                    Text('Recurring\nPayments',style: TextStyle(color: kblue,fontSize: 28),),

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

                          DataColumn(label: Text('Vendor .',style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                          ),),),
                          DataColumn(label: Text('Amount',style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                          ),),),
                          DataColumn(label: Text('Due Date',style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color:Colors.grey
                          ),),),
                          DataColumn(label: Text('Status',style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                          ),),),




                        ],
                        rows: [
                          DataRow(cells: [

                            DataCell(
                                Text('Vendor\nName',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('March 17',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                              Row(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  Checkbox(

                                        value: dvalue,
                                        onChanged: (value){

                                          setState(() {

                                          });
                                          this.dvalue = value!;
                                        }
                                    ),
                                  ),
                                  Text("Mark\nfinished",style: TextStyle(color: Colors.grey ,fontSize: 12),),

                                ],
                              ),
                            ),




                          ]),
                          DataRow(cells: [

                            DataCell(
                                Text('Vendor\nName',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('March 17',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                              Row(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  Checkbox(

                                        value: dvaluea,
                                        onChanged: (value){

                                          setState(() {

                                          });
                                          this.dvaluea = value!;
                                        }
                                    ),
                                  ),
                                  Text("Mark\nfinished",style: TextStyle(color: Colors.grey ,fontSize: 12),),

                                ],
                              ),
                            ),




                          ]),
                          DataRow(cells: [

                            DataCell(
                                Text('Vendor\nName',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('\$899',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                                Text('March 17',style: TextStyle(color: Colors.grey),)
                            ),
                            DataCell(
                              Row(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  Checkbox(

                                        value: dvaluec,
                                        onChanged: (value){

                                          setState(() {

                                          });
                                          this.dvaluec = value!;
                                        }
                                    ),
                                  ),
                                  Text("Mark\nfinished",style: TextStyle(color: Colors.grey ,fontSize: 12),),

                                ],
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
