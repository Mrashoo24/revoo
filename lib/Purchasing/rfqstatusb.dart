import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class RFQsStatusb extends StatefulWidget {
  const RFQsStatusb({Key? key}) : super(key: key);

  @override
  _RFQsStatusState createState() => _RFQsStatusState();
}

class _RFQsStatusState extends State<RFQsStatusb> {
  // var firebase = FirebaseFirestore.instance.collection("RFQform");
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
                    backgroundColor: Colors.green,
                    radius: 10,//Text
                  ),SizedBox(width: 8),
                  InkWell(child: Text('Approved',style: TextStyle(color: kblue,fontSize: 20),)),
                  SizedBox(width: 25),
                  CircleAvatar(
                    backgroundColor: reddy,
                    radius: 10,//Text
                  ),SizedBox(width: 8),
                  InkWell(child: Text('Declined',style: TextStyle(color: kblue,fontSize: 20),)),
                ],
              ),
              SizedBox(height: 15),
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
                            "RfqName",
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Cost",
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade600),
                          ),
                        ),
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
                        DataColumn(
                            label: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Center(
                                child: Text(
                                  "Delivery Status",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                            )),
                        DataColumn(
                            label: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Center(
                                child: Text(
                                  "Accept",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                            )),
                        DataColumn(
                            label: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Center(
                                child: Text(
                                  "Reject",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                            )),
                        // DataColumn(
                        //     label: Padding(
                        //       padding:
                        //       const EdgeInsets.symmetric(horizontal: 5.0),
                        //       child: Center(
                        //         child: Text(
                        //           "Sellprice",
                        //           style: TextStyle(
                        //               fontSize: 12,
                        //               color: Colors.grey.shade600),
                        //         ),
                        //       ),
                        //     )),
                        // DataColumn(
                        //     label: Padding(
                        //       padding:
                        //       const EdgeInsets.symmetric(horizontal: 5.0),
                        //       child: Center(
                        //         child: Text(
                        //           "CostPrice",
                        //           style: TextStyle(
                        //               fontSize: 12,
                        //               color: Colors.grey.shade600),
                        //         ),
                        //       ),
                        //     )),
                        // DataColumn(
                        //   label: Text(
                        //     "Add",
                        //     style: TextStyle(
                        //         fontSize: 10, color: Colors.grey.shade600),
                        //   ),
                        // ),
                        // DataColumn(
                        //   label: Text(
                        //     "Delete",
                        //     style: TextStyle(
                        //         fontSize: 10, color: Colors.grey.shade600),
                        //   ),
                        // ),
                        // DataColumn(
                        //   label: Text(
                        //     "Add Stock",
                        //     style: TextStyle(
                        //         fontSize: 10, color: Colors.grey.shade600),
                        //   ),
                        // ),
                      ],
                      rows: documents.mapIndexed((index, element) {

                        return DataRow(cells: [
                          DataCell(
                            CircleAvatar(
                              backgroundColor:jsonDecode(element['status']) == -1 ? Colors.red : Colors.green,
                              radius: 10,//Text
                            ),
                          ),
                          DataCell(
                              Text(
                            element['rfqtitle'],
                            style: TextStyle(fontSize: 12),
                          )),
                          DataCell(
                            Text(
                              element['totalcost'],
                              style:
                              TextStyle(color: Colors.red),
                            ),
                          ),
                          DataCell(
                            Text(
                              element['vendorname'],
                              style:
                              TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataCell(
                            Text(
                            element['status'],
                            style: TextStyle(fontSize: 12),
                          ),
                          ),
                          DataCell(
                            Text(
                              element['deliverystatus'],
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          DataCell(
                              Column(
                                  children:[
                                    IconButton(
                                      onPressed: (){



                                      }, icon:  Icon(Icons.check),
                                    ),
                                  ])
                          ),
                          DataCell(
                              Column(
                                  children:[
                                    IconButton(onPressed: (){
                                      // setState(() {
                                      //   FirebaseFirestore.instance.collection('RFQform').doc(snapshot.data!.docs[index]['rfqtitle']).delete();
                                      // });
                                    }, icon: Icon(Icons.cancel),
                                    ),
                                  ])
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
