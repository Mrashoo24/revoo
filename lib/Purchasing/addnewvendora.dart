import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Addnewvendora extends StatefulWidget {
  const Addnewvendora({Key? key}) : super(key: key);

  @override
  _AddnewvendorState createState() => _AddnewvendorState();
}

class _AddnewvendorState extends State<Addnewvendora> {


  var itemList = [

    'Colombia',
    'Vegas',
    'Ciaro',
    'Ciao',
    'Legasis',

  ];

  var itemLista = [

    'Colombiab',
    'Vegasb',
    'Ciarob',
    'Ciaob',
    'Legasis',

  ];

  int _value = 1;
  int _valuea = 1;
  bool  bvalue = false;

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
                          child: Text('Add New Vendor',style: TextStyle(fontSize: 30,color: kblue),)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Kdblue,
                        ),
                        child: Padding(
                          padding:   EdgeInsets.all(5.0),
                          child: Center(child: Text('Contact Info',style: TextStyle(color: Colors.white,fontSize: 15),)),
                        ),

                      ),SizedBox(width: 20,),
                      Container(
                        width: 140,
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
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,


                        ),
                        child: Icon(
                          Icons.person,
                          size: 50,
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

                              Text('Vendor name',style: TextStyle(fontSize: 16,color:kblue ),),
                              Divider(
                                height: 5,thickness: 1,color: kblue,
                              ),
                              Container(
                                height: 37,
                                width: 180,

                                decoration: BoxDecoration(borderRadius:BorderRadius.circular(0)),

                                child: TextFormField(
                                  decoration: InputDecoration(

                                      filled: true,
                                      fillColor: bgGrey,
                                      hintText: "Vendor Name",

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
                        width: 180,


                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                        child: TextFormField(
                          decoration: InputDecoration(

                              filled: true,
                              fillColor: bgGrey,
                              hintText: "Country",


                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: bgGrey),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              )

                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(

                        height: 37,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),color: bgGrey
                        ),
                        padding: EdgeInsets.only(left: 60),
                        child: DropdownButton(

                            value: _valuea,
                            items: [
                              DropdownMenuItem(
                                child: Text("State",style: TextStyle(color: Colors.grey.shade600),),
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

                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        height: 37,
                        width: 180,

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
                                borderSide: BorderSide(color: bgGrey),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              )

                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(

                        height: 37,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),color: bgGrey
                        ),
                        padding: EdgeInsets.only(left: 60),
                        child: DropdownButton(

                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("Country",style: TextStyle(color: Colors.grey.shade600),),
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

                    ],
                  ),

                  SizedBox(height: 15),
                  Row(
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