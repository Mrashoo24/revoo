import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:revoo/Controllers/myempcontroller.dart';
import 'package:revoo/Models/creatempmodel.dart';

import '../constants/constants.dart';
import '../model/Createrfqmodel.dart';

class CreatRQF extends StatefulWidget {
  const CreatRQF({Key? key}) : super(key: key);


  @override
  _CreatRQFState createState() => _CreatRQFState();
}

class _CreatRQFState extends State<CreatRQF> {
  List<Map<String,String>>? selectedItems = [];
  bool loading = false;
  TextEditingController createrfq = TextEditingController();
  TextEditingController quotationnumber = TextEditingController();
  TextEditingController expirydate = TextEditingController();
  TextEditingController customerdate = TextEditingController();
  TextEditingController totalamount = TextEditingController();

  var rnd = new Random();
  String dateSelected  = DateFormat('yyyy/MM/dd').format(DateTime.now().subtract(Duration(days: 1)));



  @override
  Widget build(BuildContext context) {
    print("random number tanishq $rnd");
    var firestore = FirebaseFirestore.instance;

    return SafeArea(
      child: Scaffold(
        body:  Container(
          padding: EdgeInsets.only(top: 15,bottom: 10,left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Create RFQ',style: TextStyle(color: kblue, fontSize: 35),)),
                SizedBox(height: 25,),
                Align(
                    alignment: Alignment.centerLeft,
                child: Text('Request Title',style: TextStyle(color: kblue, fontSize: 20),)),
                Divider(
                  color: kblue,indent: 5,endIndent: 5,thickness: 2,
                ),
                TextField(
                  autocorrect: true,
                  controller: createrfq,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: greytxtbx,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Quotation Number',style: TextStyle(color: kblue, fontSize: 20),)),
                Divider(
                  color: kblue,indent: 5,endIndent: 5,thickness: 2,
                ),
                TextField(
                  controller: quotationnumber,
                  autocorrect: true,
                  decoration: InputDecoration(

                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: greytxtbx,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 15),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Expiry Date',style: TextStyle(color: kblue, fontSize: 20),)),
                Divider(
                  color: kblue,indent: 5,endIndent: 5,thickness: 2,
                ),
                InkWell(
                  onTap: (){
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now()
                            .subtract(const Duration(days: 120)),
                        maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                          print('change $date');
                          setState(() {
                            dateSelected = DateFormat('yyyy/MM/dd').format(date);
                          });
                        }, onConfirm: (date) {
                          print('confirm $date');
                          setState(() {
                            dateSelected = DateFormat('yyyy/MM/dd').format(date);
                          });
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.en);
                  },
                  child: TextField(
                    enabled: false,
                    controller: expirydate,

                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: dateSelected,
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: greytxtbx,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                //
                //
                // SizedBox(height: 15),
                // Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text('Customer Date',style: TextStyle(color: kblue, fontSize: 20),)),
                // Divider(
                //   color: kblue,indent: 5,endIndent: 5,thickness: 2,
                // ),
                // TextField(
                //   controller: customerdate,
                //   autocorrect: true,
                //   decoration: InputDecoration(
                //
                //     hintStyle: TextStyle(color: Colors.white),
                //     filled: true,
                //     fillColor: greytxtbx,
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //       borderSide: BorderSide(color: Colors.white, width: 2),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //       borderSide: BorderSide(color: Colors.white),
                //     ),
                //   ),
                // ),


                // SizedBox(height: 15),
                // Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text('Total Amount',style: TextStyle(color: kblue, fontSize: 20),)),
                // Divider(
                //   color: kblue,indent: 5,endIndent: 5,thickness: 2,
                // ),
                // TextField(
                //   controller: totalamount,
                //   autocorrect: true,
                //   decoration: InputDecoration(
                //
                //     hintStyle: TextStyle(color: Colors.white),
                //     filled: true,
                //     fillColor: greytxtbx,
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //       borderSide: BorderSide(color: Colors.white, width: 2),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //       borderSide: BorderSide(color: Colors.white),
                //     ),
                //   ),
                // ),


                SizedBox(height: 15,),
                InkWell(
                  onTap: (){

                    _showMultiSelect(context);

                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return StatefulBuilder(
                    //           builder: (context,
                    //               setDialogState) {
                    //             return AlertDialog(
                    //               title:
                    //               Text('Component List'),
                    //               content: AddComponents(
                    //                 name: ProductModel().name,
                    //                 price: ProductModel().purchaseprice,
                    //                 quantity: ProductModel().quantity,
                    //                 type: 'edit',
                    //                 id: ProductModel().id,
                    //
                    //                 // selecteditems: newlist,
                    //               ),
                    //             );
                    //           },
                    //           );
                    //     }
                    //     );
                  },
                  child: Container(
                    color: Kdblue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Select Components',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 5,),
                Container(
                  width: 200,
                  child: Row(
                    children: selectedItems!.map((e) {
                      return Text('${e['name']}, ');
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 100,
                  width: 400,
                  child: ListView.builder(
                      shrinkWrap: true,

                      itemCount: selectedItems!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Container(
                                  width:100,
                                  child: Text(selectedItems![index]['name']!)),
                              SizedBox(width: 10,),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: 30,
                                  child: Text(selectedItems![index]['unit']!,style: TextStyle(fontSize: 10),),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      filled: true,

                                      labelText: 'Quantity',
                                      labelStyle: TextStyle(color: Colors.grey[800],fontSize: 8),
                                      hintStyle: TextStyle(color: Colors.grey[800],fontSize: 8),
                                      hintText: 'Quantity',
                                      fillColor: Colors.white70),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value1){
                                    print('previo = ${selectedItems![index]}');
                                    print('value = $value1');

                                    selectedItems![index].update('quantity', (value) => value1.toString());

                                    print('updated = ${selectedItems![index]}');

                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  ),
                ),


                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 15),
                      InkWell(
                        onTap: ()async {
                          if (createrfq.text.isEmpty || quotationnumber.text.isEmpty || selectedItems!.isEmpty ) {
                            print('not good1');
                            Get.snackbar('Error', 'Please Enter All Details');
                          } else {
                            print('all good');
                            setState(() {
                              loading = true;
                            });

                            /// for getting cid and allids
                         MyEmpController myempcontroller =   MyEmpController.instance;

                            CreatEmpModel empModel = myempcontroller.myepmlist.value;
                            /// for getting cid and all id's
                            ///

                            FirebaseFirestore.instance.collection('RFQform').add(
                                CreateRfqModel(
                                    createrfq: createrfq.text,
                                    created:DateFormat('yyyy/MM/dd').format(DateTime.now()),
                                    expirydate:dateSelected,
                                    components: jsonEncode(selectedItems),
                                    quotationnumber:quotationnumber.text,
                                    totalamount: '',
                                    cid: empModel.cid,
                                    bid: empModel.bid,
                                    did: empModel.did,
                                    mid: empModel.mid,
                                    status: '0',
                                    uid: empModel.uid,
                                    recievedforms: '0',
                                    vendors: '0',


                                    date:DateFormat('yyyy/MM/dd').format(DateTime.now())).toJson()).then((value) {
                              FirebaseFirestore.instance.collection('Products').doc(value.id).update({'cid':value.id});

                              setState(() {
                                loading = false;
                              });
                              Get.back();
                            });
                          }

                        },

                        child: Container(
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                            child: Center(
                              child: Text('ADD',style: TextStyle(
                                  color: Colors.white,fontSize: 15
                              ),
                              ),
                            ),
                          ),

                        ),
                      ), SizedBox(width: 10),
                      InkWell(
                        child: Container(

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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                            child: Center(
                              child: Text('Clear',style: TextStyle(
                                  color: Colors.white,fontSize: 15
                              ),),
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,)
              ],
            ),
          ),

        ),
      ),
    );
  }

  void _showMultiSelect(BuildContext context) async {
    QuerySnapshot<Map<String, dynamic>> ProductDocs = await FirebaseFirestore
        .instance.collection('Component').get();


    List<MultiSelectItem<Map<String, String>>> allProduct = [];


    ProductDocs.docs.forEach((element) {
      Map<String, dynamic> newList = element.data();
      Map<String, String> newList1 = {

        // "costprice":  costprice.text,
        // "productname": productname.text,
        // "sellprice": sellprice.text,
        // "producttype":producttype.text,
        "name": newList['name'],
        'price': newList['price'],
        'quantity': newList['quantity'],
        'unit': newList['unit'],
      };


      allProduct.add(MultiSelectItem(newList1, element.get('name')));
    });

    print('valueofitems = $allProduct');


    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(searchable: true,
          items: allProduct,

          initialValue: selectedItems!,
          onConfirm: (List<Map<String, String>>values) {
            setState(() {
              selectedItems = values;
            });
            print('confiremd : $values');
          },
        );
      },
    );
}


}