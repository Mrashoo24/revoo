import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class CreatRQF extends StatefulWidget {
  const CreatRQF({Key? key}) : super(key: key);

  @override
  _CreatRQFState createState() => _CreatRQFState();
}

class _CreatRQFState extends State<CreatRQF> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Container(
          padding: EdgeInsets.only(top: 15,bottom: 10,left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Request Title',style: TextStyle(color: kblue, fontSize: 35),)),
                SizedBox(height: 25,),
                Align(
                    alignment: Alignment.centerLeft,
                child: Text('Create RFQ',style: TextStyle(color: kblue, fontSize: 20),)),
                Divider(
                  color: kblue,indent: 5,endIndent: 5,thickness: 2,
                ),
                TextField(
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
                  ),),

                SizedBox(height: 15),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Quotation Number',style: TextStyle(color: kblue, fontSize: 20),)),
                Divider(
                  color: kblue,indent: 5,endIndent: 5,thickness: 2,
                ),
                TextField(
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
                  ),),

                SizedBox(height: 15),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Expiry Date',style: TextStyle(color: kblue, fontSize: 20),)),
                Divider(
                  color: kblue,indent: 5,endIndent: 5,thickness: 2,
                ),
                TextField(
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
                  ),),

                SizedBox(height: 15),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Customer Date',style: TextStyle(color: kblue, fontSize: 20),)),
                Divider(
                  color: kblue,indent: 5,endIndent: 5,thickness: 2,
                ),
                TextField(
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
                  ),),

                SizedBox(height: 15),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Total Amount',style: TextStyle(color: kblue, fontSize: 20),)),
                Divider(
                  color: kblue,indent: 5,endIndent: 5,thickness: 2,
                ),
                TextField(
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
                  ),),
                SizedBox(height: 10),

                Center(
                  child: Row(
                    children: [
                      Container(

                        child: ElevatedButton(onPressed: (){
                          // Get.back();
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
                      SizedBox(width: 15),
                      Container(

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
                            ),),
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
}
