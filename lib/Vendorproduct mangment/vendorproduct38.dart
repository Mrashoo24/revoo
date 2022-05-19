import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/Vendorproduct%20mangment/vendoraddproduct39.dart';
import 'package:collection/collection.dart';
import '../HRMS_admin_Screen/adbranchpg2.dart';
import '../constants/constants.dart';

class Addproduct38 extends StatefulWidget {
  const Addproduct38({Key? key}) : super(key: key);

  @override
  _Addproduct38State createState() => _Addproduct38State();
}

class _Addproduct38State extends State<Addproduct38> {
  var filtervalue = 'Std1';
  var firebase = FirebaseFirestore.instance.collection("Products");
  String initialValue = '';

  var itemList = [
    '',
    'Std1',
    'Std2',
    'Std3',
    'Std4',
    'Std5',
    'Std6',
    'Std7'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,

          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child:  Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Product',style: TextStyle(color:kblue,fontSize: 35),
                            ),

                          ),
                          InkWell(onTap: (){
                            Get.to(Addproduct39());
                          },child: Image.asset('asset/addnew.png')),

                        ],
                      ),

                      SizedBox( height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'asset/filter_icon.png',height: 20,width: 15,

                          ),



                          Text("Filter Result by :",style: TextStyle(color:kblue,fontSize: 20,

                          )
                          ),
                          Container(
                            width:110 ,
                            height:25,
                            decoration: BoxDecoration(
                                color:  bgGrey,
                                borderRadius: BorderRadius.circular(10)

                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [

                                  SizedBox( width: 40),
                                  DropdownButton<String?>(
                                    value:filtervalue,

                                    icon: Icon(Icons.keyboard_arrow_down,color: Kdblue,),

                                    items: itemList.map((String items) {

                                      return DropdownMenuItem(value: items, child: Text(items));

                                    }).toList(), onChanged: (String? value) {
                                   setState(() {
                                     filtervalue = value!;
                                   });
                                  },
                                  ),


                                ],
                              ),
                            ),



                          ),

                        ],

                      ),
                      SizedBox(height: 20,),


                      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: firebase.snapshots() ,
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
                                    "Date",
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
                                DataColumn(
                                    label: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Center(
                                        child: Text(
                                          "Sellprice",
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
                                          "CostPrice",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade600),
                                        ),
                                      ),
                                    )),
                                DataColumn(
                                  label: Text(
                                    "Add",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey.shade600),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Delete",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey.shade600),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Add Stock",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey.shade600),
                                  ),
                                ),

                              ],
                              rows: documents.mapIndexed((index, element) {
                                return DataRow(cells: [
                                  DataCell(Text(
                                    element['date'],
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
                                                element['productname'],
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
                                                element['producttype'],
                                                style:
                                                TextStyle(color: Colors.orange),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(Text(
                                    element['quantity'],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  ),
                                  DataCell(Text(
                                    element['sellprice'],
                                    style: TextStyle(fontSize: 12),
                                  )),
                                  DataCell(Text(
                                    element['costprice'],
                                    style: TextStyle(fontSize: 12),
                                  )),
                                  DataCell(
                                    Column(
                                        children:[
                                     IconButton(onPressed: (){

                                     }, icon: Icon(Icons.add)),
                                        ])
                                  ),
                                  DataCell(
                                      Column(
                                          children:[
                                            IconButton(onPressed: (){
                                              setState(() {
                                             FirebaseFirestore.instance.collection('Products').doc(snapshot.data!.docs[index]['cid']).delete();
                                              });
                                            }, icon: Icon(Icons.delete_forever),
                                            ),
                                          ])
                                  ),
                                  DataCell(
                                      Column(
                                          children:[
                                            IconButton(onPressed: (){
                                              Get.defaultDialog(
                                                content: Column(
                                                  children: [

                                                  ],
                                                )
                                              );
                                            }, icon: Icon(Icons.edit)),
                                          ])
                                  ),


                                ]);
                              }).toList(),
                              border: TableBorder.all(color: kblue),

                            );
                          }),
                    ],
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
