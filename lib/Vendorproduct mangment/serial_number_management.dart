import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';
import '../constants/constants.dart';
import '../constants/constants.dart';
import '../models/serial_number_model.dart';
import 'package:collection/collection.dart';


// class Item{
//   String serialNumber;
//   String product;
//   Item({required this.serialNumber,required this.product});
// }

class Serialnumber48 extends StatefulWidget {


  @override
  _Serialnumber48State createState() => _Serialnumber48State();
}

class _Serialnumber48State extends State<Serialnumber48> {
  final fireStore = FirebaseFirestore.instance;
  List<SerialModel> item =[];
  bool sort = false;
  var itemList = ['', 'Std1', 'Std2', 'Std3', 'Std4', 'Std5', 'Std6', 'Std7'];

  var itemList1 = [
    '',
    'in',
    'out',
  ];

  String initialValue = 'Product category';
  TextEditingController serialNumber = TextEditingController();
  TextEditingController product = TextEditingController();

  int _value = 2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          child: SingleChildScrollView(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic >>>(
              stream: fireStore.collection('Inventory').doc('Zfm6VjimQ1BCDroRad2L').collection('Serial_number_management').snapshots(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return kprogressbar;
                }
                var documents = snapshot.requireData.docs;

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          
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
                                  'Serial Number\n Mangment'
                                  ,
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
                      DataTable(
                        horizontalMargin: 20,
                        columnSpacing: 20,
                        columns: [
                          DataColumn(
                              label: Text(
                                  "SerialNo.",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey.shade600),
                              )),
                          DataColumn(
                              label: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(


                                    "Product",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey.shade600),
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
                                        fontSize: 15, color: Colors.grey.shade600),
                                  ),
                                ),
                              )),
                        ],

                        rows:documents.map.
                        [


                          DataRow(cells: [

                            DataCell(
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Center(
                                    child: Container(
                                      width: 65,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: bgGrey,
                                      ),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Text(snapshot.data!.docs[0]['serial_number'],
                                            style: TextStyle(color: Colors.orange),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            DataCell(Center(
                              child: Text(
                            snapshot.data!.docs[0]['product'],
                                style: TextStyle(fontSize: 12),
                              ),
                            )),
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
                                  child: Center(
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
                            ),
                          ]),
                        ],
                        border: TableBorder.all(color:kblue,),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // terable<DataRow>mapItemDataRows(List<SerialModel>items){
  //   Iterable<DataRow> dataRows = items.map((item){
  //     return DataRow(cells: [
  //       DataCell(Text(item.serialNo.toString()),),
  //       DataCell(Text(item.productName.toString()))
  //     ]);
  //   });
  //   return dataRows;
  // } I
}
