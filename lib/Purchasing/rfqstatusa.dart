import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import '../constants/constants.dart';

class RFQsStatusa extends StatefulWidget {
  const RFQsStatusa({Key? key}) : super(key: key);

  @override
  _RFQsStatusState createState() => _RFQsStatusState();
}

class _RFQsStatusState extends State<RFQsStatusa> {
  var firebase = FirebaseFirestore.instance;

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
   //            StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
   //              stream: firebase.collection('RFQform').doc('VVtqGoTlpkGn6rMMFXB9').collection('vendorform').snapshots(),
   //              builder: (context, snapshot) {
   //                if (!snapshot.hasData){
   //                return Text('No Data');
   //                }
   //                 var documents = snapshot.requireData.docs;
   //                  print('documents = ${documents.length}');
   //                return Container(
   //                 height: Get.height,
   //                  width: Get.width,
   //
   //                  child: Center(
   //                    child: ListView(
   //                      shrinkWrap: true,
   //                      scrollDirection: Axis.horizontal,
   //                      children: [
   //                        DataTable(
   //                            columns: [
   //                              DataColumn(label: Text(''),),
   //                              DataColumn(label: Text('RFQs',style: TextStyle(
   //                                  fontSize: 15,
   //                                  fontWeight: FontWeight.w400,
   //                                  color: Colors.red
   //                              ),),),
   //                              DataColumn(label: Text('Price',style: TextStyle(
   //                                  fontSize: 15,
   //                                  fontWeight: FontWeight.w400,
   //                                  color: Colors.red
   //                              ),),),
   //                              DataColumn(label: Text('Vendor',style: TextStyle(
   //                                  fontSize: 15,
   //                                  fontWeight: FontWeight.w400,
   //                                  color: Colors.red
   //                              ),),),
   //                              DataColumn(label: Text('Status',style: TextStyle(
   //                                  fontSize: 15,
   //                                  fontWeight: FontWeight.w400,
   //                                  color: Colors.red
   //                              ),),),
   //                            ],
   //                            rows:documents.mapIndexed((index, element) {
   //                              return DataRow(cells: [
   //                                DataCell(
   //                                  CircleAvatar(
   //                                    backgroundColor: kyellow,
   //                                    radius: 10,//Text
   //                                  ),
   //                                ),
   //                                DataCell(
   //                                    Text(
   //                                        element['rfqtitle'])
   //                                ),
   //                                DataCell(
   //                                    Text(element['status'])
   //                                ),
   //                                DataCell(
   //                                    Text(element['totalcost'])
   //                                ),
   //                                DataCell(
   //                                    Text(element['status'])
   //                                ),
   //
   //
   //
   //
   //                              ]);
   //                             }).toList(),
   //
   //
   //
   // );
   //                      ],
   //                    ),
   //                  ),
   //
   //                );
   //              }
   // )
   //
   //              }

              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream:firebase.collection('RFQform').doc('VVtqGoTlpkGn6rMMFXB9').collection('vendorform').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text('No Data');
                    }
                    var documents = snapshot.requireData.docs;
                    print('documents = ${documents.length}');

                    return DataTable(
                      horizontalMargin: 18,
                      columnSpacing: 22,
                      columns: [

                        DataColumn(
                          label: Text(
                            "Remark",
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "RFQs",
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade600),
                          ),
                        ),
                        DataColumn(
                            label: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text(
                                  "Price",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                            )),
                        DataColumn(
                            label: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Center(
                                  child: Center(
                                    child: Text(
                                      "Vendor",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        DataColumn(
                            label: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Center(
                                child: Text(
                                  "Status",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                            )),
                      ],
                      rows: documents.mapIndexed((index, element) {
                        return DataRow(cells: [

                          DataCell(
                            CircleAvatar(
                              backgroundColor: jsonDecode(element['status']) == 0 ? Colors.red : Colors.yellow,
                              radius: 10,//Text
                            ),
                          ),
                          DataCell(
                              Text(
                            element['rfqtitle'],
                            style: TextStyle(fontSize: 12),
                          )),
                          DataCell(
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  element['totalcost'],
                                  style:
                                  TextStyle(color: Colors.orange),
                                )),
                          ),
                          DataCell(
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  element['vendorname'],
                                  style:
                                  TextStyle(color: Colors.orange),
                                )),
                          ),
                          DataCell(
                            Text(
                            element['status'],
                            style: TextStyle(fontSize: 12),
                          ),


                          ),


                        ]);
                      }).toList(),
                      border: TableBorder.all(color: kblue),

                    );
                  }
              ),


            ],
          ),
        ),
      ),
    );
  }

}
