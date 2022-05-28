import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/inventoryreportcontroller.dart';
import '../constants/constants.dart';

class Inventory52 extends StatefulWidget {
  const Inventory52({Key? key}) : super(key: key);

  @override
  _Inventory52State createState() => _Inventory52State();
}

class _Inventory52State extends State<Inventory52> {
  @override
  Widget build(BuildContext context) {
    var itemList = ['', 'Std1', 'Std2', 'Std3', 'Std4', 'Std5', 'Std6', 'Std7','std67'];

    var itemList1 = [
      '',
      'in',
      'out',
    ];
    String initialValue = 'Product category';

    int _value = 2;
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
                              "Inventory\nReports",
                              style: TextStyle(color: kblue, fontSize: 25),

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
                  Container(
                    child: SingleChildScrollView(
                      child: GetX(
                          init: Get.put<Inventoryreportcontroller>(Inventoryreportcontroller()),
                          builder:(Inventoryreportcontroller inventoryreport){
                        return ListView.builder(itemCount:3,itemBuilder: (context, index) {
                          return DataTable (
                            horizontalMargin: 18,
                            columnSpacing: 22,

                            columns: [
                              DataColumn(
                                label: Text(
                                  "SKU",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey.shade600),
                                ),),

                              DataColumn(
                                  label: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20.0),

                                      child: Text(
                                        "Intl\nPricee",
                                        style: TextStyle(
                                            fontSize: 12 , color: Colors.grey.shade600),
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
                                            "Local\nprice",
                                            style: TextStyle(
                                                fontSize: 12, color: Colors.grey.shade600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),

                              DataColumn(
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Center(

                                      child: Text(
                                        "Action",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey.shade600),
                                      ),
                                    ),
                                  )),
                            ],





                            rows: [
                              DataRow(cells: [
                                DataCell(Text(
                                  inventoryreport.inventory[index].productName.toString(),
                                  style: TextStyle(fontSize: 12),
                                )),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 15),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        width: 50,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: bgGrey,
                                        ),
                                        child: Align(
                                            alignment: Alignment.center,

                                            child: Text(
                                              inventoryreport.inventory[index].intlPrice.toString(),
                                              style: TextStyle(color: Colors.orange),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),

                                DataCell(
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 15),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        width: 50,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: bgGrey,
                                        ),
                                        child: Align(
                                            alignment: Alignment.center,

                                            child: Text(
                                              inventoryreport.inventory[index].localPrice.toString(),
                                              style: TextStyle(color: Colors.orange),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),

                                DataCell(
                                  Center(
                                    child: Container(
                                      height: 20,
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
                                ),
                              ]),
                            ],
                            border: TableBorder.all(color:kblue),
                          );

                        });
                      }),
                    ),
                  ),
                  DataTable (
                    horizontalMargin: 18,
                    columnSpacing: 22,

                    columns: [
                      DataColumn(
                        label: Text(
                          "SKU",
                          style: TextStyle(
                              fontSize: 10, color: Colors.grey.shade600),
                        ),),

                      DataColumn(
                          label: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),

                              child: Text(
                                "Intl\nPricee",
                                style: TextStyle(
                                    fontSize: 12 , color: Colors.grey.shade600),
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
                                    "Local\nprice",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey.shade600),
                                  ),
                                ),
                              ),
                            ),
                          )),

                      DataColumn(
                          label: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Center(

                              child: Text(
                                "Action",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade600),
                              ),
                            ),
                          )),
                    ],





                    rows: [
                      DataRow(cells: [
                        DataCell(Text(
                          "Product Name",
                          style: TextStyle(fontSize: 12),
                        )),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 50,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,

                                    child: Text(
                                      'Rs.350',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),

                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 50,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgGrey,
                                ),
                                child: Align(
                                    alignment: Alignment.center,

                                    child: Text(
                                      'Rs.350',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                              ),
                            ),
                          ),
                        ),

                        DataCell(
                          Center(
                            child: Container(
                              height: 20,
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
                        ),
                      ]),
                    ],
                    border: TableBorder.all(color:kblue),
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
