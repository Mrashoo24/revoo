import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Addnewvendorb extends StatefulWidget {
  const Addnewvendorb({Key? key}) : super(key: key);

  @override
  _AddnewvendorState createState() => _AddnewvendorState();
}

class _AddnewvendorState extends State<Addnewvendorb> {

  int _value = 1;

  int _valuea =  2;

  int _valueb =  3;

  int _valuec =  4;

  int _valued =  5;




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
                          child: Text('Add New Vendor',style: TextStyle(fontSize: 30,color: kblue),)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(border: Border.all(
                            color: Kdblue,
                          )),
                          child: Center(child: Text('Contact Info',style: TextStyle(fontSize: 15,color: kblue),)),
                        ),
                      ),
                      SizedBox(width: 20,),

                      Expanded(

                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: Kdblue,
                          ),
                          child: Center(child: Text('Sales & Purchase',style: TextStyle(color: Colors.white,fontSize: 15),)),

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Sales Person',style: TextStyle(fontSize: 18,color:kblue ),)),
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

                  SizedBox(height: 15),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Payment Terms',style: TextStyle(fontSize: 18,color:kblue ),)
                  ),
                  Divider(
                    height: 5,thickness: 1,color: kblue,
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 37,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),color: bgGrey
                    ),

                    child: Center(
                      child: DropdownButton(

                        icon: Icon(Icons.keyboard_arrow_down,color: Kdblue),
                          value: _value,
                          items: [
                            DropdownMenuItem(
                              child: Text("select",style: TextStyle(color: Colors.grey),),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("Second Item"),
                              value: 2,
                            ),
                            DropdownMenuItem(
                                child: Text("Third Item"),
                                value: 3
                            ),
                            DropdownMenuItem(
                                child: Text("Fourth Item"),
                                value: 4
                            )
                          ],
                          onChanged: (int? value) {
                            setState(() {
                              _value = value!;
                            });
                          }),
                    ),
                  ),

                  SizedBox(height: 15),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Payment Method',style: TextStyle(fontSize: 18,color:kblue ),)),
                  Divider(
                    height: 5,thickness: 1,color: kblue,
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 37,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),color: bgGrey
                    ),

                    child: Center(
                      child: DropdownButton(
                          icon: Icon(Icons.keyboard_arrow_down,color: Kdblue),
                          value: _valuea,
                          items: [
                            DropdownMenuItem(
                              child: Text("select",style: TextStyle(color: Colors.grey),),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("Second Item"),
                              value: 2,
                            ),
                            DropdownMenuItem(
                                child: Text("Third Item"),
                                value: 3
                            ),
                            DropdownMenuItem(
                                child: Text("Fourth Item"),
                                value: 4
                            )
                          ],
                          onChanged: (int? value) {
                            setState(() {
                              _valuea = value!;
                            });
                          }),
                    ),
                  ),

                  SizedBox(height: 15),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Bank Accounts',style: TextStyle(fontSize: 18,color:kblue ),)),
                  Divider(
                    height: 5,thickness: 1,color: kblue,
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 37,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),color: bgGrey
                    ),
                    child: Center(
                      child: DropdownButton(
                          icon: Icon(Icons.keyboard_arrow_down,color: Kdblue),
                          value: _valueb,
                          items: [
                            DropdownMenuItem(
                              child: Text("Bank Name",style: TextStyle(color: Colors.grey),),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("Second Item"),
                              value: 2,
                            ),
                            DropdownMenuItem(
                                child: Text("Third  Item"),
                                value: 3
                            ),
                            DropdownMenuItem(
                                child: Text("Fourth Item"),
                                value: 4
                            )
                          ],
                          onChanged: (int? value) {
                            setState(() {
                              _valueb = value!;
                            });
                          }),
                    ),
                  ),

                  SizedBox(height: 10),
                   Container(

                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                          filled: true,
                          fillColor: bgGrey,
                          hintText: "Acc Type",

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

                  SizedBox(height: 10),
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),color: bgGrey
                    ),
                    child: Center(
                      child: DropdownButton(
                          icon: Icon(Icons.keyboard_arrow_down,color: Kdblue),
                          value: _valuec,
                          items: [
                            DropdownMenuItem(
                              child: Text("Account Type",style: TextStyle(color: Colors.grey.shade500),),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("Account Type"),
                              value: 2,
                            ),
                            DropdownMenuItem(
                                child: Text("Third Item"),
                                value: 3
                            ),
                            DropdownMenuItem(
                                child: Text("Fourth Item"),
                                value: 4
                            )
                          ],
                          onChanged: (int? value) {
                            setState(() {
                              _valuec = value!;
                            });
                          }),
                    ),
                  ),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(


                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                          child: TextFormField(

                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                                filled: true,
                                fillColor: bgGrey,
                                hintText: "IFSC Code",


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
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),color: bgGrey
                          ),
                          child: Center(
                            child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down,color: Kdblue),
                                value: _valued,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("MMID",style: TextStyle(color: Colors.grey.shade500),),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Account Type"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                      child: Text("Third Item"),
                                      value: 3
                                  ),
                                  DropdownMenuItem(
                                      child: Text("Fourth Item"),
                                      value: 5
                                  )
                                ],
                                onChanged: (int? value) {
                                  setState(() {
                                    _valued = value!;
                                  });
                                }),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 10),
                  Container(

                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                          filled: true,
                          fillColor: bgGrey,
                          hintText: "City",

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

                  SizedBox(height: 10),
                  Container(

                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                          filled: true,
                          fillColor: bgGrey,
                          hintText: "Branch",

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


                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,width: 100,
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


                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
