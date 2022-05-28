import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import '../constants/constants.dart';

class Component extends StatefulWidget {
  const Component({Key? key}) : super(key: key);

  @override
  State<Component> createState() => _ComponentState();
}

class _ComponentState extends State<Component> {
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
  var updatedresult = [];
  // var newListofUpdates = [];

  TextEditingController compname = TextEditingController();
  TextEditingController compprice = TextEditingController();
  TextEditingController compunit = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController date = TextEditingController();
  // var sz = MediaQuery.of(context).size.height * 1;

  var selectedItem = "All";
  var selectedItem1 = "All";
  var selectedItem2 = "All";
  final formKey = GlobalKey<FormState>();
  var firebase = FirebaseFirestore.instance.collection('Component').snapshots();
  CollectionReference firebase1 =
      FirebaseFirestore.instance.collection('Component');
  var text1, text2, text3, text4;
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    var startd =
        "${(start.year).toString()}/${(start.month).toString()}/${(start.day).toString()}";
    var endd =
        "${(end.year).toString()}/${(end.month).toString()}/${(end.day).toString()}";
    List<String> listitems = ['All', 'In Stock', 'Less Stock', 'Out Stock'];
    List<String> listitems1 = ['All', 'Branch', 'Brancha', 'Branchd'];
    List<String> listitems2 = [
      'All',
      'departmente',
      'departmentr',
      'departmentt'
    ];
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            SizedBox(width: 20),
            Image.asset(
              'asset/filter_icon.png',
              height: 20,
              width: 15,
            ),
            SizedBox(width: 8),
            Text("Filter Result by :",
                style: TextStyle(
                  color: kblue,
                  fontSize: 20,
                )),
            SizedBox(width: 10),
            Container(
              width: 120,
              height: 25,
              decoration: BoxDecoration(
                  color: bgGrey, borderRadius: BorderRadius.circular(10)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      // value: selectedItem,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: listitems.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (items) {
                        setState(() {
                          selectedItem = items!;
                        });
                        // print(selectedItem);
                      },
                      value: selectedItem,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 30),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Add Component"),
                          content: Form(
                              key: formKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10, left: 5, right: 5),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please Fill Require Details';
                                        }
                                        return null;
                                      },
                                      controller: compname,
                                      decoration: InputDecoration(
                                        hintText: 'Comp. Name',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10, left: 5, right: 5),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please Fill Require Details';
                                        }
                                        return null;
                                      },
                                      controller: compprice,
                                      decoration: InputDecoration(
                                        hintText: 'Comp. Price',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10, left: 5, right: 5),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please Fill Require Details';
                                        }
                                        return null;
                                      },
                                      controller: compunit,
                                      decoration: InputDecoration(
                                        hintText: 'Comp. Unit',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10, left: 5, right: 5),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please Fill Require Details';
                                        }
                                        return null;
                                      },
                                      controller: quantity,
                                      decoration: InputDecoration(
                                        hintText: 'Quantity',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10, left: 5, right: 5),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please Fill Require Details';
                                        }
                                        return null;
                                      },
                                      controller: date,
                                      decoration: InputDecoration(
                                        hintText: 'Date',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            final isValid = formKey
                                                .currentState!
                                                .validate();
                                            await firebase1.add({
                                              "name": compname.text,
                                              "price": compprice.text,
                                              "quantity": quantity.text,
                                              "unit": compunit.text,
                                              "date": date.text,
                                              "cid": "",
                                              "bid": "",
                                              "did": "",
                                              "mid": ""
                                            });
                                            compunit.clear();
                                            compname.clear();
                                            compprice.clear();
                                            quantity.clear();
                                            Get.back();
                                          },
                                          child: Text("Add")),
                                      SizedBox(width: 107),
                                      ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text("Cancel")),
                                    ],
                                  ),
                                ],
                              )),
                          // Text("This is an alert message."),
                        );
                      });
                },
                icon: Icon(Icons.add))
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              // margin: EdgeInsets.only(right: 1),
              // padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: pickDateRange,
                child: Text('${start.year}/${start.month}/${start.day}'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF1B57A7)),
                ),
              ),
            ),
            Container(
              // margin: EdgeInsets.only(left: 1),
              // padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: pickDateRange,
                child: Text('${end.year}/${end.month}/${end.day}'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF1B57A7)),
                ),
              ),
            ),
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
        ),
        SizedBox(height: 16),
        StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: firebase,
            builder: (context, snapshot) {
              var documents = snapshot.requireData.docs;
              if (!snapshot.hasData) {
                return Text('No Data');
              }
              if (selectedItem == "In Stock") {
                // var checkStatus = newListofUpdates.where((element) => element.status! == val).toList();
                updatedresult = documents.where((element) {
                  return int.parse(element['quantity']) > 499;
                }).toList();
              }
              if (selectedItem == "Less Stock") {
                // var checkStatus = newListofUpdates.where((element) => element.status! == val).toList();
                updatedresult = documents.where((element) {
                  return int.parse(element['quantity']) < 50;
                }).toList();
              }
              if (selectedItem == "Out Stock") {
                // var checkStatus = newListofUpdates.where((element) => element.status! == val).toList();
                updatedresult = documents.where((element) {
                  return int.parse(element['quantity']) < 1;
                }).toList();
              }
              if (selectedItem == "All") {
                updatedresult = documents;
              }

              var newListofUpdates = updatedresult.where((element) {
                print(element['date']);

                return DateFormat('yyyy/MM/dd')
                        .parse(element['date'])
                        .isAfter(DateFormat('yyyy/MM/dd').parse(startd)) &&
                    DateFormat('yyyy/MM/dd')
                        .parse(element['date'])
                        .isBefore(DateFormat('yyyy/MM/dd').parse(endd));
              }).toList();

              print('lengths of filter item ${newListofUpdates.length}');
              // newListofUpdates.forEach((element) {
              //   // print('elements of filter date ${element.status}');
              // });

              return DataTable(
                horizontalMargin: 18,
                columnSpacing: 22,
                columns: [
                  DataColumn(
                    label: Text(
                      "Date",
                      style:
                          TextStyle(fontSize: 10, color: Colors.grey.shade600),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Name",
                      style:
                          TextStyle(fontSize: 10, color: Colors.grey.shade600),
                    ),
                  ),
                  DataColumn(
                      label: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        "Price",
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade600),
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
                            "Unit",
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
                        "Quantity",
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ),
                  )),
                ],
                rows: newListofUpdates.mapIndexed((index, element) {
                  return DataRow(cells: [
                    DataCell(Text(
                      element['date'],
                      style: TextStyle(fontSize: 12),
                    )),
                    DataCell(Text(
                      element['name'],
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
                                  element['price'],
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
                                  element['unit'],
                                  style: TextStyle(color: Colors.orange),
                                )),
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(element['quantity']),
                      ),
                    ),
                  ]);
                }).toList(),
                border: TableBorder.all(color: kblue),
              );
            }),
      ],
    );
  }
}
