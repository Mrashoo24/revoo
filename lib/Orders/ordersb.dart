import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';
import '../constants/constants.dart';
import 'ordersa.dart';

class Addorder23 extends StatefulWidget {
  const Addorder23({Key? key}) : super(key: key);

  @override
  _Addorder23State createState() => _Addorder23State();
}

class _Addorder23State extends State<Addorder23> {
  int groupvalue = 0;
  int yesvslue = 0;
  int novalue = 1;
  int govalue = 2;
  bool value1 = false;
  TextEditingController customername = TextEditingController();
  TextEditingController customernumber = TextEditingController();
  TextEditingController customeraddress = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var firestore = FirebaseFirestore.instance.collection('Addorders');
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              print('clicked');
                            },
                            child: Image.asset(
                              'asset/navicon.png',
                            )),
                        SizedBox(width: 120),
                        Image.asset('asset/bellicon.png'),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset('asset/settingsicon.png'),
                        SizedBox(
                          width: 6,
                        ),
                        Image.asset('asset/usericon.png'),
                        SizedBox(width: 10),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 180),
                      child: Text(
                        "Add order",
                        style: TextStyle(fontSize: 30, height: 3, color: kblue),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Customer Name",
                          style: TextStyle(color: kblue),
                        )),
                    SizedBox(height: 3),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(height: 3),
                    Container(
                      height: 32,
                      child: Container(
                        child: TextFormField(
                          controller: customername,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 2, bottom: 3),
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Customer Number",
                          style: TextStyle(color: kblue),
                        )),
                    SizedBox(height: 3),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(height: 3),
                    Container(
                      height: 32,
                      child: Container(
                        child: TextFormField(
                          controller: customernumber,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding:
                            EdgeInsets.only(left: 20, top: 2, bottom: 3),
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Customer Address",
                          style: TextStyle(color: kblue),
                        )),
                    SizedBox(height: 3),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(height: 3),
                    Container(
                      height: 32,
                      child: Container(
                        child: TextFormField(
                          controller: customeraddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding:
                            EdgeInsets.only(left: 20, top: 2, bottom: 3),
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Date",
                          style: TextStyle(color: kblue),
                        )),
                    SizedBox(height: 3),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(height: 3),
                    Container(
                      height: 32,
                      child: Container(
                        child: TextFormField(
                          controller: date,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding:
                            EdgeInsets.only(left: 20, top: 2, bottom: 3),
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Price",
                          style: TextStyle(color: kblue),
                        )),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(height: 3),
                    Container(
                      height: 32,
                      child: Container(
                        child: TextFormField(
                          controller: price,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding:
                            EdgeInsets.only(left: 20, top: 2, bottom: 3),
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Quantity",
                          style: TextStyle(color: kblue),
                        )),
                    SizedBox(height: 3),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(height: 3),
                    Container(
                      height: 32,
                      child: Container(
                        child: TextFormField(
                          controller: quantity,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding:
                            EdgeInsets.only(left: 20, top: 2, bottom: 3),
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                          ),
                        ),
                      ),
                    ),








                    Column(
                      children: [

                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            firestore.add({
                              "customer_address" : customeraddress.text,
                              "customer_name" : customername.text,
                              "customer_number" : customernumber.text,
                              "date" : date.text,
                              "price" : price.text,
                              "quantity" : quantity.text
                            }).then((value) {
                              firestore.doc(value.id).update({

                                "id" : value.id});});
                            Get.to(Ordera());
                          },
                          child: Container(
                            width: 350,
                            height: 39,
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
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Add product',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
