import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Addcustomer56 extends StatefulWidget {
  const Addcustomer56({Key? key}) : super(key: key);

  @override
  _AddnewvendorState createState() => _AddnewvendorState();
}

class _AddnewvendorState extends State<Addcustomer56> {


  var itemList = [
    'Product category',
    'product category1',
    'product category2',
    'product category3',
    'product category4',

  ];

  bool  avalue = false;
  bool  bvalue = false;
  bool  cvalue = false;
  bool  dvalue = false;



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
                  Row(
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
                                  Text('Sales & Purchase',style: TextStyle(fontSize: 15,color: kblue),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,


                        ),
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color:  Colors.grey,
                        ),


                      ),SizedBox(width: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child:  Checkbox(

                                    value: dvalue,
                                    onChanged: (value){

                                      setState(() {

                                      });
                                      this.dvalue = value!;
                                    }
                                ),
                              ),
                              Text("Individual",style: TextStyle(color: kblue ,fontSize: 12),),
                              Checkbox(

                                  value: bvalue,

                                  onChanged: (value){

                                    setState(() {

                                    });
                                    this.bvalue = value!;
                                  }
                              ),

                              Text("Company",style: TextStyle(color: kblue ,fontSize: 12),),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text('Customer name',style: TextStyle(fontSize: 16,color:kblue ),),
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
                                      hintText: "Anderson",


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
                  Row(
                    children: [
                      Text('Upload a profile picture',style: TextStyle(color: kblue),),

                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('E-mail',style: TextStyle(fontSize: 18,color:kblue ),)),
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
                      child: Text('Phone/Mobile',style: TextStyle(fontSize: 18,color:kblue ),)),
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
                      child: Text('Website',style: TextStyle(fontSize: 18,color:kblue ),)),
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
                      child: Text('Address',style: TextStyle(fontSize: 18,color:kblue ),)),
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
                          hintText: "Address",

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

                  SizedBox(height: 4),
                  Container(
                    height: 37,

                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                    child: TextFormField(
                      decoration: InputDecoration(

                          filled: true,
                          fillColor: bgGrey,
                          hintText: "Address",

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

                  SizedBox(height: 4),
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
                      SizedBox(width: 15),
                      Container(
                        height: 37,
                        width: 150,

                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                        child: TextFormField(
                          decoration: InputDecoration(

                              filled: true,
                              fillColor: bgGrey,
                              hintText: "State",
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
                              hintText: "Zip Code",


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
                      SizedBox(width: 15),
                      Container(
                        height: 37,
                        width: 150,

                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                        child: TextFormField(
                          decoration: InputDecoration(

                              filled: true,
                              fillColor: bgGrey,
                              hintText: "Country",
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

                  SizedBox(height: 15),

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
