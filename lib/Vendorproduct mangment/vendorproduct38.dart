import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/Vendorproduct%20mangment/editProduct.dart';
import 'package:revoo/Vendorproduct%20mangment/vendoraddproduct39.dart';
import 'package:collection/collection.dart';
import '../Controllers/myempcontroller.dart';
import '../HRMS_admin_Screen/adbranchpg2.dart';
import '../constants/constants.dart';

class Addproduct38 extends StatefulWidget {
  const Addproduct38({Key? key}) : super(key: key);

  @override
  _Addproduct38State createState() => _Addproduct38State();
}

class _Addproduct38State extends State<Addproduct38> {
  var selectedValue = 0;
  var selectedBranch ='';
  var firebase = FirebaseFirestore.instance.collection("Products");
  String initialValue = '';

  MyEmpController empController = Get.put(MyEmpController());

  TextEditingController stock = TextEditingController();

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
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('Branch').where('cid',isEqualTo: empController.myepmlist.value.cid).snapshots(),
          builder: (context, snapshot) {

            if(!snapshot.hasData){

              return kprogressbar;

            }

            var bDocs = snapshot.requireData.docs;

            selectedBranch = bDocs.first.get('bid');

            return Container(
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
                              Expanded(
                                child: Container(
                                  height:25,
                                  decoration: BoxDecoration(
                                      color:  bgGrey,
                                      borderRadius: BorderRadius.circular(10)

                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: DropdownButton(
                                          underline: Text(''),

                                          borderRadius: BorderRadius.circular(10),
                                          value: selectedValue,
                                          onChanged: (int? value){



                                            setState(() {
                                              selectedValue = value!;
                                              selectedBranch = bDocs[value].get('bid');
                                            });

                                          },
                                          style: TextStyle(fontSize: 8,color: Colors.black),
                                          items:
                                          bDocs.mapIndexed((index, element) => (DropdownMenuItem(child: Text(element.get('branch_name')),value: index,))).toList()
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),


                          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                              stream: firebase.where('bid',isEqualTo: selectedBranch).snapshots() ,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Text('No Data');
                                }
                                var documents = snapshot.requireData.docs;
                                print('documents = ${documents.length}');

                                return Container(
                                  height: Get.height,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    children: [
                                      DataTable(
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

                                                 Get.defaultDialog(
                                                   title:'Add Stock',
                                                   content:
                                                   TextFormField(
                                                     controller: stock,
                                                     keyboardType: TextInputType.number,
                                                     inputFormatters: [
                                                       FilteringTextInputFormatter(  RegExp(r'^[0-9]+$'),allow: true,)

                                                     ],
                                                     decoration: InputDecoration(

                                                         filled: true,
                                                         fillColor: bgGrey,
                                                         hintText: 'Stock',
                                                         border: OutlineInputBorder(
                                                           borderSide: BorderSide(color: Colors.white),
                                                           borderRadius: BorderRadius.all(Radius.circular(10)),
                                                         ),
                                                         focusedBorder: OutlineInputBorder(
                                                           borderSide: BorderSide(color: Colors.white),
                                                           borderRadius: BorderRadius.all(Radius.circular(10)),
                                                         ),
                                                         enabledBorder:OutlineInputBorder(
                                                           borderSide: BorderSide(color: Colors.white),
                                                           borderRadius: BorderRadius.all(Radius.circular(10)),
                                                         ),

                                                     ),
                                                   ),
                                                   onConfirm: () async {

                                                     var newStock = double.parse(element.get('quantity')) + double.parse(stock.text);

                                                    await  FirebaseFirestore.instance.collection('Products')
                                                         .doc(element.id).update({
                                                       'quantity' : newStock.round().toString()
                                                     });

                                                     Get.back();
                                                   },
                                                   onCancel: (){
                                                     Get.back();
                                                   }
                                                 );

                                               }, icon: Icon(Icons.add)),
                                                  ])
                                            ),
                                            DataCell(
                                                Column(
                                                    children:[
                                                      IconButton(onPressed: (){

                                                        Get.defaultDialog(
                                                          title:  'Are you sure you want to delete?',
                                                          content:
                                                          Container(
                                                            height: 200,
                                                            width: 200,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                InkWell(
                                                                  onTap: (){

                                                                    setState(() {
                                                                      FirebaseFirestore.instance.collection('Products').doc(snapshot.data!.docs[index]['cid']).delete();
                                                                    });
                                                                  },
                                                                    child:
                                                                Text('Yes')),
                                                                InkWell(
                                                                    onTap: (){
                                                                      Get.back();
                                                                    },
                                                                    child: Text('No')),
                                                              ],
                                                            ),


                                                          ),

                                                        );
                                                      },

                                                       icon: Icon(Icons.delete_forever),
                                                      ),
                                                    ])
                                            ),
                                            DataCell(
                                                Column(
                                                    children:[
                                                      IconButton(onPressed: (){
                                                        Get.to(Editproduct(productname: element['productname'], producttype: element['producttype'],
                                                            sellprice: element['sellprice'], costprice: element['costprice'],
                                                            productcategoryvalue: element['productcategory'],
                                                            selectedItems: List.from(jsonDecode(element['components'])))
                                                        );
                                                      }, icon: Icon(Icons.edit)),
                                                    ])
                                            ),
                                          ]);
                                        }).toList(),
                                        border: TableBorder.all(color: kblue),

                                      ),
                                    ],
                                  ),
                                );
                              }
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ),

      ),
    );
  }
}
