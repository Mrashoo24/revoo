import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../HRMS_admin_Screen/adbranchpg2.dart';
import '../constants/constants.dart';

class Vendorgoods extends StatefulWidget {
  const Vendorgoods({Key? key}) : super(key: key);

  @override
  _VendorgoodsState createState() => _VendorgoodsState();
}

class _VendorgoodsState extends State<Vendorgoods> {
  var itemList = ['', 'Std1', 'Std2', 'Std3', 'Std4', 'Std5', 'Std6', 'Std7'];

  var itemList1 = [
    '',
    'in',
    'out',
  ];

  String initialValue = 'Product category';

  int _value = 2;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [



                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Goods',
                              style: TextStyle(color: kblue, fontSize: 35),

                            ),

                          ),
                          InkWell(
                              onTap: () {


                              },child:  Container(
                            width: 130,
                            height: 36,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(border: Border.all(
                                color: Kdblue,width: 2
                            )),
                            child: Container(

                              child:Center(
                                child: DropdownButton(

                                  value: _value,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("Print Pdf"),
                                      value: 1,
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Print Excel"),
                                      value: 2,
                                    )
                                  ],
                                  onChanged: (int? value) {
                                    setState(() {
                                      _value=value!;
                                    });

                                  },

                                ),
                              )
                              ),
                          ),
                              ),

                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'asset/filter_icon.png',
                            height: 20,
                            width: 15,
                          ),
                          Text("Filter Result by :",
                              style: TextStyle(
                                color: kblue,
                                fontSize: 20,
                              )),
                          SizedBox(width: 10),
                          Container(
                            width: 110,
                            height: 25,
                            decoration: BoxDecoration(
                                color: bgGrey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(width: 40),
                                  DropdownButton(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList.map((String items) {
                                      return DropdownMenuItem(
                                          value: items, child: Text(items));
                                    }).toList(),
                                    onChanged: (String? value) {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  DataTable(
                    horizontalMargin: 20,
                    columnSpacing: 20,
                    columns: [
                      DataColumn(
                          label: Text(
                        "Goods Name",
                        style: TextStyle(
                            fontSize: 10, color: Colors.grey.shade600),
                      )),
                      DataColumn(
                          label: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Qty",
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade600),
                          ),
                        ),
                      )),
                      DataColumn(
                          label: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Center(
                          child: Text(
                            "Action",
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade600),
                          ),
                        ),
                      )),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text(
                          "Goods Name 1",
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          "Goods Name 1",
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          "Goods Name 1",
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          "Goods Name 1",
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          "Goods Name 1",
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          "Goods Name 1",
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          "Goods Name 1",
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          "Goods Name 1",
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          "Goods Name 1",
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          "Goods Name 1",
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          "Goods Name 1",
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          "Goods Name 1",
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '30',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                    border: TableBorder.all(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
