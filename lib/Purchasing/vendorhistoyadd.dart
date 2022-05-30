

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart';
class AddHistory extends StatefulWidget {
  const AddHistory({Key? key}) : super(key: key);

  @override
  State<AddHistory> createState() => _AddHistoryState();
}

class _AddHistoryState extends State<AddHistory> {
  DateTime initialDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  var firebase = FirebaseFirestore.instance.collection("purchase_history");


  TextEditingController rfqnumber = TextEditingController();
  TextEditingController vendorname = TextEditingController();
  TextEditingController component = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('RFQ Numbers',style: TextStyle(fontSize: 18,color:kblue ),)),
                  Divider(
                    height: 5,thickness: 1,color: kblue,
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 37,
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                    child: TextFormField(
                      validator: (val){
                        if(val!.length < 1){
                          return "plesae enter the product name";
                        }
                      },
                      controller: rfqnumber,
                      decoration: InputDecoration(
                        hintText: "RFQ-Number",
                          filled: true,
                          fillColor: bgGrey,
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
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Vendor Name',style: TextStyle(fontSize: 18,color:kblue ),)),
                  Divider(
                    height: 5,thickness: 1,color: kblue,
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 37,
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                    child: TextFormField(
                      validator: (val){
                        if(val!.length < 1){
                          return "plesae enter the product name";
                        }
                      },
                      controller: vendorname,
                      decoration: InputDecoration(
                          hintText: "Vendor name",
                          filled: true,
                          fillColor: bgGrey,
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
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Compoenent Name',style: TextStyle(fontSize: 18,color:kblue ),)),
                  Divider(
                    height: 5,thickness: 1,color: kblue,
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 37,
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                    child: TextFormField(
                      validator: (val){
                        if(val!.length < 1){
                          return "plesae enter the product name";
                        }
                      },
                      controller: component,
                      decoration: InputDecoration(
                          hintText: "Component name",
                          filled: true,
                          fillColor: bgGrey,
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
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Quantity',style: TextStyle(fontSize: 18,color:kblue ),)),
                  Divider(
                    height: 5,thickness: 1,color: kblue,
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 37,
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                    child: TextFormField(
                      validator: (val){
                        if(val!.length < 1){
                          return "plesae enter the product name";
                        }
                      },
                      controller: quantity,
                      decoration: InputDecoration(
                          hintText: "Quantity",
                          filled: true,
                          fillColor: bgGrey,
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
                          )
                      ),
                    ),
                  ),//
                  SizedBox(height: 15),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Amount',style: TextStyle(fontSize: 18,color:kblue ),)),
                  Divider(
                    height: 5,thickness: 1,color: kblue,
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 37,
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                    child: TextFormField(
                      validator: (val){
                        if(val!.length < 1){
                          return "plesae enter the product name";
                        }
                      },
                      controller: amount,
                      decoration: InputDecoration(
                          hintText: "Amount",
                          filled: true,
                          fillColor: bgGrey,
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
                          )
                      ),
                    ),
                  ),////


                  SizedBox(height: 15),
                  Divider(
                    height: 5,thickness: 1,color: kblue,
                  ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Select Date"),
                  ElevatedButton(onPressed: () async{
                    DateTime? newDate = await showDatePicker(context: context,
                        initialDate: initialDate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    if(newDate == null) return;
                    setState(() {
                      initialDate = newDate;
                    });
                  },
                    child: Text("${initialDate.day}/${initialDate.month}/${initialDate.year}"),),
                ],
              ),

                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(child: Text("Back"),onPressed: (){
                        Get.back();
                      },),
                      ElevatedButton(child: Text("Add"),onPressed: (){
                        var validate = _formKey.currentState!.validate();
                        if(validate == true){
                          firebase.add({
                            "rfqnumber": rfqnumber.text,
                            "vendorname": vendorname.text,
                            "componentname": component.text,
                            "quantity" : quantity.text,
                            "amount" : amount.text,
                            "date" : "${initialDate.day}/${initialDate.month}/${initialDate.year}",
                            "uid":"",
                            "bid":"",
                            "cid":"",
                            "did":"",
                            "rid":"",

                          });

                        }

                      },),
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
