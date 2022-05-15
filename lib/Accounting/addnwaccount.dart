import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Addnwaccount extends StatefulWidget {
  const Addnwaccount({Key? key}) : super(key: key);

  @override
  _AddnwaccountState createState() => _AddnwaccountState();
}

class _AddnwaccountState extends State<Addnwaccount> {

  String initialValue = 'SBI';

  var itemList  = [
    'SBI',
    'CANARA',
    'AXIS',
    'CBI',
    'Aud',

  ];

  String initialValuea = 'Savings';

  var itemLista  = [
    'Savings',
    'Current',
    'Recurring Deposit',
    'Fixed Deposit',
    'NRI',

  ];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding:   EdgeInsets.all(20.0),
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
                            child: Text('Add New Account',style: TextStyle(color:kblue,fontSize: 35),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 40),

                  Container(
                    child: Column(
                      children: [

                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Select Bank',style: TextStyle(fontSize: 18,color:kblue ),)),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),
                        SizedBox(height: 4),
                        Container(

                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,borderRadius: new BorderRadius.circular(10.0),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          child: DropdownButton(
                            isExpanded: true,
                            iconEnabledColor: Colors.blue ,
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                            dropdownColor: Colors.grey.shade200,
                            focusColor: Colors.black,
                            value: initialValue,
                            icon: Icon(Icons.keyboard_arrow_down,color: kblue,),
                            items: itemList.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(), onChanged: (String? value) {  },

                          ),
                        ),




                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Column(
                      children: [

                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Office',style: TextStyle(fontSize: 18,color:kblue ),)),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 37,

                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                          child: TextFormField(
                            decoration: InputDecoration(

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




                      ],
                    ),
                  ),


                  SizedBox(height: 15),
                  Container(
                    child: Column(
                      children: [

                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Account Number',style: TextStyle(fontSize: 18,color:kblue ),)),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 37,

                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                          child: TextFormField(
                            decoration: InputDecoration(

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




                      ],
                    ),
                  ),

                  SizedBox(height: 15),
                  Container(
                    child: Column(
                      children: [

                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('IFSC Code',style: TextStyle(fontSize: 18,color:kblue ),)),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 37,

                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                          child: TextFormField(
                            decoration: InputDecoration(

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




                      ],
                    ),
                  ),

                  SizedBox(height: 15),
                  Container(
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Acc Types',style: TextStyle(fontSize: 18,color:kblue ),),
                                Divider(
                                  height: 5,thickness: 1,color: kblue,
                                ),
                                SizedBox(height: 4),
                                Container(
                                  height: 30,width: 150,

                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,borderRadius:   BorderRadius.circular(10.0),
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 3),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    iconEnabledColor: Colors.blue ,
                                    style: TextStyle(color: Colors.grey, fontSize: 18),
                                    dropdownColor: Colors.grey.shade200,
                                    focusColor: Colors.black,
                                    value: initialValuea,
                                    icon: Icon(Icons.keyboard_arrow_down,color: kblue,),
                                    items: itemLista.map((String items) {
                                      return DropdownMenuItem(value: items, child: Text(items));
                                    }).toList(), onChanged: (String? value) {  },

                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Acc Code',style: TextStyle(fontSize: 18,color:kblue ),),
                                Divider(
                                  height: 5,thickness: 1,color: kblue,
                                ),
                                SizedBox(height: 4),
                                Container(
                                  height: 37,
                                  width: 160,
                                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(10)),

                                  child: TextFormField(
                                    decoration: InputDecoration(

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
                              ],
                            ),


                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25),
                  Align(
                    alignment: Alignment(1,1),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          child: ElevatedButton(onPressed: (){

                          },

                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape:RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  side: BorderSide(width: 3.0, color: kblue ),
                                  primary: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 11),
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              child: Center(child: Text('Clear',style: TextStyle(
                                  color: kblue,fontSize: 15
                              ),))),
                        ),
                        SizedBox(width: 25,),
                        Container(
                          width: 110,
                          height: 41,
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
                            padding:  EdgeInsets.all(8.0),
                            child: Center(
                              child: Text('Add',style: TextStyle(
                                  color: Colors.white,fontSize: 15
                              ),),
                            ),
                          ),

                        ),


                      ],
                    ),
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
