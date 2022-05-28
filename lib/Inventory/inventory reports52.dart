import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart';
import 'component.dart';

class Inventory52 extends StatefulWidget {
  const Inventory52({Key? key}) : super(key: key);

  @override
  _Inventory52State createState() => _Inventory52State();
}

class _Inventory52State extends State<Inventory52> {
  var selectedItem1 = "All";
  var selectedItem2 = "All";
  ////////////////////////////////////////////////////////////////////////////////////////
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(1998, 05, 07), end: DateTime(2022, 05, 09));
  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    print(
        'skumar date range ${dateRange}'); ////////////////////////      date range

    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
    });
    var ndate = await newDateRange.toString();
    print(ndate);
  }

  ///////////////////////////////////////////////////////////////////////////////////////
  TextEditingController compname = TextEditingController();
  TextEditingController compprice = TextEditingController();
  TextEditingController compunit = TextEditingController();
  TextEditingController quantity = TextEditingController();
  // var sz = MediaQuery.of(context).size.height * 1;

  var firebase =
      FirebaseFirestore.instance.collection('Inventoryreports').snapshots();
  @override
  Widget build(BuildContext context) {
    List<String> listitems1 = ['All', 'Branch', 'Brancha', 'Branchd'];
    List<String> listitems2 = [
      'All',
      'departmente',
      'departmentr',
      'departmentt'
    ];
    final start = dateRange.start;
    final end = dateRange.end;
    var startd =
        "${(start.year).toString()}/${(start.month).toString()}/${(start.day).toString()}";
    var endd =
        "${(end.year).toString()}/${(end.month).toString()}/${(end.day).toString()}";
    // String initialValue = 'Product category';
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
                            onTap: () {},
                            child: Container(
                              width: 130,
                              height: 36,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Kdblue, width: 2)),
                              child: Container(
                                  child: Center(
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
                                      _value = value!;
                                    });
                                  },
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
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
                          SizedBox(width: 40),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            // margin: EdgeInsets.only(right: 1),
                            // padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: pickDateRange,
                              child: Text(
                                  '${start.year}/${start.month}/${start.day}'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF1B57A7)),
                              ),
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.only(left: 1),
                            // padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: pickDateRange,
                              child:
                                  Text('${end.year}/${end.month}/${end.day}'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF1B57A7)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DropdownButton<String>(
                            // value: selectedItem,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: listitems1.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (items) {
                              setState(() {
                                selectedItem1 = items!;
                              });
                              // print(selectedItem);
                            },
                            value: selectedItem1,
                          ),
                          DropdownButton<String>(
                            // value: selectedItem,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: listitems2.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (items) {
                              setState(() {
                                selectedItem2 = items!;
                              });
                              // print(selectedItem);
                            },
                            value: selectedItem2,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: firebase,
                      builder: (context, snapshot) {
                        var documents = snapshot.requireData.docs;
                        if (!snapshot.hasData) {
                          return Text('No Data');
                        }
                        var newListofUpdates = documents.where((element) {
                          print(element['date']);

                          return DateFormat('yyyy/MM/dd')
                                  .parse(element['date'])
                                  .isAfter(
                                      DateFormat('yyyy/MM/dd').parse(startd)) &&
                              DateFormat('yyyy/MM/dd')
                                  .parse(element['date'])
                                  .isBefore(
                                      DateFormat('yyyy/MM/dd').parse(endd));
                        }).toList();

                        print(
                            'lengths of filter item ${newListofUpdates.length}');
                        return DataTable(
                          horizontalMargin: 18,
                          columnSpacing: 22,
                          columns: [
                            DataColumn(
                              label: Text(
                                "Date",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey.shade600),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "SKU",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey.shade600),
                              ),
                            ),
                            DataColumn(
                                label: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text(
                                  "Name",
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
                                      "Type",
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
                                  "Quantity",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                            )),
                          ],
                          rows: newListofUpdates.mapIndexed((index, element) {
                            print("index for sku $index");
                            return DataRow(cells: [
                              DataCell(Text(
                                element['date'],
                                style: TextStyle(fontSize: 12),
                              )),
                              DataCell(Text(
                                "${index + 1}",
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
                                            element['name'],
                                            style:
                                                TextStyle(color: Colors.orange),
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
                                            element['type'],
                                            style:
                                                TextStyle(color: Colors.orange),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: Text("6734"),
                                ),
                              ),
                            ]);
                          }).toList(),
                          border: TableBorder.all(color: kblue),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
