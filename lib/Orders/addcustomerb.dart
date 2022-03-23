import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Addcustomer57 extends StatefulWidget {
  const Addcustomer57({Key? key}) : super(key: key);

  @override
  _Addcustomer57State createState() => _Addcustomer57State();
}

class _Addcustomer57State extends State<Addcustomer57> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,

          child: SingleChildScrollView(
            child: Padding(
              padding:   EdgeInsets.all(20.0),
              child:  Column(
                children: [

                  SizedBox(height: 25),
                  Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Add Customer',style: TextStyle(fontSize: 30,color: kblue),)),
                    ],
                  ),
                  Align(alignment: Alignment.center,
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            width: 140,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Kdblue,
                            ),
                            child: Padding(
                              padding:   EdgeInsets.all(10.0),
                              child: Center(child: Text('Contact Info',style: TextStyle(color: Colors.white,fontSize: 15),)),
                            ),

                          ),SizedBox(width: 20,),
                          Container(
                            width: 135,
                            height: 36,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(border: Border.all(
                              color: Kdblue,
                            )),
                            child: Padding(
                              padding:   EdgeInsets.all (8),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('Sales & purchase',style: TextStyle(fontSize: 15,color: kblue),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                    SizedBox(width: 10),
                      Column(
                        children: [


                        ],
                      ),

                    ],
                  ),

                  SizedBox(height: 10),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Sales person',style: TextStyle(fontSize: 18,color:kblue ),)),


                  Divider(
                    height: 5,thickness: 2,color:Colors.grey,
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

                  SizedBox(height: 15),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Payment Terms',style: TextStyle(fontSize: 18,color:kblue ),)),
                  Divider(
                    height: 5,thickness: 1,color:Colors.grey,
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 32,
                    child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: bgGrey,
                          contentPadding:
                          EdgeInsets.only(left: 20, top: 2, bottom: 3),
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.arrow_drop_down,
                            color: kblue,
                          ),
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

                  SizedBox(height: 15),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Payment Method',style: TextStyle(fontSize: 18,color:kblue ),)),
                  Divider(
                    height: 5,thickness: 1,color: Colors.grey,
                  ),
                  SizedBox(height: 8),
                  Container( height: 35,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: bgGrey,
                        contentPadding:
                        EdgeInsets.only(left: 20, top: 2, bottom: 3),
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: kblue,
                        ),
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

                  SizedBox(height: 20),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Bank Accounts',style: TextStyle(fontSize: 18,color:kblue ),)),
                  Divider(
                    height: 5,thickness: 1,color: Colors.grey,
                  ),
                  SizedBox(height: 7),
                  Container( height: 37,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: bgGrey,
                        hintText: "Bank account",
                        contentPadding:
                        EdgeInsets.only(left: 20, top: 2, bottom: 3),
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: kblue,
                        ),
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

                  SizedBox(height: 7),
                  Container( height: 37,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: bgGrey,
                        hintText: "Account Number",
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
                  SizedBox(height: 7),
                  Container( height: 37,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: bgGrey,
                        hintText: "Acc Type",
                        contentPadding:
                        EdgeInsets.only(left: 20, top: 2, bottom: 3),
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: kblue,
                        ),
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

                  SizedBox(height: 7),
                  Row(
                    children: [
                      Container(
                        height: 37,
                        width: 150,


                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                        child: TextFormField(
                          decoration: InputDecoration(

                              filled: true,
                              fillColor: bgGrey,
                              hintText: "IFSC CODE",


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
                      ), SizedBox(height: 4),
                      SizedBox(width: 15),
                      Container(
                        height: 37,
                        width: 150,

                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                        child: TextFormField(
                          decoration: InputDecoration(

                              filled: true,
                              fillColor: bgGrey,
                              hintText: "MMID",
                              suffixIcon: Icon(
                                Icons.arrow_drop_down,
                                color: kblue,
                              ),

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
                  SizedBox(height: 4),
                  Container( height: 37,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: bgGrey,
                        hintText: "City",
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

                  SizedBox(height: 6),
                  Container( height: 37,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: bgGrey,
                        hintText: "Branch",
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
                  SizedBox(height: 25),

                  Align(alignment: Alignment.centerRight,

                    child: Row(mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          child: ElevatedButton(onPressed: (){
                            // Get.back();
                          },

                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape:RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(13))
                                  ),
                                  side: BorderSide(width: 3.0, color: kblue ),
                                  primary: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 9),
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              child: Center(child: Text('Clear',style: TextStyle(
                                  color: kblue,fontSize: 15
                              ),))),
                        ),
                        SizedBox(width: 15),
                        Container(
                          width: 110,
                          height: 35,
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
                              child: Text('ADD',style: TextStyle(
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
