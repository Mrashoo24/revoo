import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {

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
          child: SingleChildScrollView(
            child: Padding(
              padding:   EdgeInsets.all(20.0),
              child:  Column(
                children: [
                  Container(
                    child: Column(
                      children: [

                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Vendor Name',style: TextStyle(fontSize: 18,color:kblue ),)),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),
                        SizedBox(height: 4),
                        Container(
                          width: Get.width ,
                          height:37,
                          decoration: BoxDecoration(
                              color:  bgGrey,
                              borderRadius: BorderRadius.circular(10)

                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [

                                SizedBox( width: 300),
                                DropdownButton(

                                  icon: Icon(Icons.keyboard_arrow_down,color: Kdblue,),

                                  items: itemList.map((String items) {

                                    return DropdownMenuItem(value: items, child: Text(items));

                                  }).toList(), onChanged: (String? value) {  },
                                ),


                              ],
                            ),
                          ),



                        ),





                      ],
                    ),
                  ),
                  SizedBox(height: 15),

                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Type/Industry name",style: TextStyle(color: kblue),),
                          Divider(
                            height: 5,thickness: 1,color: kblue,
                          ),
                          Container(
                            height: 37,
                            width: 180,


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
                      SizedBox(width: 10,),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Ref Code",style: TextStyle(color: kblue),),
                              Divider(
                                height: 5,thickness: 1,color: kblue,
                              ),
                              Container(
                                height: 37,
                                width: 180,


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
                        ],
                      ),
                    ],
                  ),



                  SizedBox(height: 15),
                  Container(
                    child: Column(
                      children: [


                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Tags',style: TextStyle(fontSize: 18,color:kblue ),)),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: bgGrey,
                              contentPadding:
                              EdgeInsets.only(left: 20, top: 2, bottom: 3),
                              // hintStyle: TextStyle(color: Colors.grey),
                              // suffixIcon: Icon(
                              //   Icons.arrow_drop_down,
                              //   color: kblue,
                              // ),
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
                        SizedBox(height: 25),
                        Align(
                          alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text("Bill to",style: TextStyle(color: kblue,fontSize: 15),),
                                SizedBox(width: 130),
                                Container(
                                  height: 37,
                                  width: 200,


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
                        SizedBox(height: 3),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text("Email",style: TextStyle(color: kblue,fontSize: 15),),
                              SizedBox(width: 90),
                              Container(
                                height: 37,
                                width: 240,


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
                        SizedBox(height: 3),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text("Phone",style: TextStyle(color: kblue,fontSize: 15),),
                              SizedBox(width: 145),
                              Container(
                                height: 37,
                                width: 180,


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

                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text("Bill to",style: TextStyle(color: kblue,fontSize: 15),),
                              SizedBox(width: 130),
                              Container(
                                height: 37,
                                width: 200,


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
                        SizedBox(height: 3),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text("Email",style: TextStyle(color: kblue,fontSize: 15),),
                              SizedBox(width: 90),
                              Container(
                                height: 37,
                                width: 240,


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
                        SizedBox(height: 3),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text("Phone",style: TextStyle(color: kblue,fontSize: 15),),
                              SizedBox(width: 145),
                              Container(
                                height: 37,
                                width: 180,


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

                        SizedBox(height: 3),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),
                        SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text("Date Issued",style: TextStyle(color: kblue,fontSize: 15),),
                              SizedBox(width: 110),
                              Container(
                                height: 37,
                                width: 180,


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

                        SizedBox(height: 3),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text("Delivery Date",style: TextStyle(color: kblue,fontSize: 15),),
                            SizedBox(width: 100),
                            Container(
                              height: 37,
                              width: 180,


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
                        SizedBox(height: 3),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),

                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("Amount Date",style: TextStyle(color: kblue,fontSize: 15),),
                            SizedBox(width: 10),
                            Container(
                              height: 37,
                              width: 180,


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

                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text("Taxes",style: TextStyle(color: kblue,fontSize: 15),),
                            SizedBox(width: 58),
                            Container(
                              height: 37,
                              width: 180,


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


                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text("Total",style: TextStyle(color: kblue,fontSize: 15),),
                            SizedBox(width: 65),
                            Container(
                              height: 37,
                              width: 180,


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
