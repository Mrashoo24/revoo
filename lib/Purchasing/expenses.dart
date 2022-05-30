import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../constants/constants.dart';
import 'editexpenses.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController amount = TextEditingController();
  TextEditingController  product = TextEditingController();
  TextEditingController quantity = TextEditingController();
  var firebase = FirebaseFirestore.instance.collection("expenses").snapshots();
  var firebase1 = FirebaseFirestore.instance.collection("expenses");


  DateTime date = DateTime.now();
  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();

  _startDate() async{
    DateTime? newDate1 = await showDatePicker(context: context,
      initialDate: date1, firstDate: DateTime(1900),
      lastDate: DateTime(2100)) ;
    if(newDate1 == null) return;
    setState(() {
      date1 = newDate1;
    });
  }

  _endDate() async{
    DateTime? newDate2 = await showDatePicker(context: context,
      initialDate: date2,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),) ;
    if(newDate2 == null) return;
    setState(() {
      date2 = newDate2;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(height: 10,),
            Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children: [
              ElevatedButton(child: Text("${date1.day}/${date1.month}/${date1.year}"), onPressed: _startDate,),
              ElevatedButton(child: Text("${date2.day}/${date2.month}/${date2.year}"), onPressed: _endDate,),
            ],),

            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: firebase,
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Center(child: Text(" No Data found"),);
                }

                var startd ="${date1.day}/${date1.month}/${date1.year}";
                var endd ="${date2.day}/${date2.month}/${date2.year}";

                var newListofUpdates = snapshot.data!.docs.where((element) {
                  print(element['date']);

                  return DateFormat('yyyy/MM/dd')
                      .parse(element['date'])
                      .isAfter(DateFormat('yyyy/MM/dd').parse(startd)) &&
                      DateFormat('yyyy/MM/dd')
                          .parse(element['date'])
                          .isBefore(DateFormat('yyyy/MM/dd').parse(endd));
                }).toList();


                return ListView.builder(itemCount:newListofUpdates.length,shrinkWrap:true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                  return Card(
                    child: Container(
                      height: 110,
                      decoration: BoxDecoration(
                        color: Kdblue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children: [
                            Column(children: [
                              SizedBox(height: 10),
                              Text("Date: ${newListofUpdates[index]["date"]}",style: TextStyle(color: Colors.white,),),
                              SizedBox(height: 10),
                              Text("Expense Name: ${newListofUpdates[index]["product"]}",style: TextStyle(color: Colors.white,),),
                              SizedBox(height: 10,),
                              Text("Quantity: ${newListofUpdates[index]["quantity"]}",style: TextStyle(color: Colors.white),),
                              SizedBox(height: 10,),
                              Text("Amount: ${newListofUpdates[index]["amount"]}",style: TextStyle(color: Colors.white),),
                            ],),
                            IconButton(icon:Icon(Icons.edit),onPressed: (){
                              Get.to(EditExpenses(amount: snapshot.data!.docs[index]["amount"],
                              product: snapshot.data!.docs[index]["product"],
                              quantity: snapshot.data!.docs[index]["quantity"],
                              date: snapshot.data!.docs[index]["date"],
                              indId: snapshot.data!.docs[index].id));
                            },),
                            IconButton(icon:Icon(Icons.delete),onPressed: (){
                              var a = snapshot.data!.docs[index].id;
                              FirebaseFirestore.instance.collection('expenses').doc(a).delete();
                            },),
                          ],),
                        ],
                      ),
                    ),
                  );
                });
              }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
        showDialog(context: context, builder:(BuildContext context){
          return AlertDialog(title: Text("Add Product"),content: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
            Form(
              key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: (val){
                    if(val!.length < 1){
                      return "plesae enter the product name";
                    }
                  },
                  controller: product,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                      filled: true,
                      fillColor: bgGrey,
                      hintText: "Expense Name",                                              //branch

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
                SizedBox(height: 15),
                TextFormField(
                  validator: (val){
                    if(val!.length < 1){
                      return "plesae enter the product name";
                    }
                  },
                  controller: quantity,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                      filled: true,
                      fillColor: bgGrey,
                      hintText: "Quantity",                                              //branch

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
                SizedBox(height: 15),
                TextFormField(
                  validator: (val){
                    if(val!.length < 1){
                      return "plesae enter the product name";
                    }
                  },
                  controller: amount,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                      filled: true,
                      fillColor: bgGrey,
                      hintText: "Amount",                                              //branch

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
                SizedBox(height: 15),
                ElevatedButton(onPressed: () async{
                  DateTime? newDate = await showDatePicker(context: context,
                      initialDate: date,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  if(newDate == null) return;
                    setState(() {
                      date = newDate;
                    });
                },
                  child: Text("${date.day}/${date.month}/${date.year}"),),
                // SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: (){
                      var datte = "${date.day}/${date.month}/${date.year}";
                      if(_formKey.currentState!.validate()){
                        firebase1.add({
                          "product":product.text,
                          "amount":amount.text,
                          "quantity":quantity.text,
                          "date":datte,
                          "cid": 'cid',
                          "bid": 'bid',
                          "did": 'did',
                          "uid": 'uid'
                        });
                        product.clear();
                        amount.clear();
                        quantity.clear();
                      Navigator.of(context).pop();
                      }
                    }, child: Text("Add"),
                    ),
                    ElevatedButton(onPressed: (){Navigator.of(context).pop();},
                      child: Text("Cancel"),),
                  ],
                )
              ],
            ) ),
          ],),);
        } );
      },),
    );
  }
}
