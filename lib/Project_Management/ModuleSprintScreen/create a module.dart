import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Models/projectModule.dart';
import '../../constants/constants.dart';

class CreateModule extends StatefulWidget {
  const CreateModule({Key? key}) : super(key: key);


  @override
  _CreateModuleState createState() => _CreateModuleState();
}

class _CreateModuleState extends State<CreateModule> {

  bool loading = false;
  TextEditingController modulename = TextEditingController();
  TextEditingController modulleadename = TextEditingController();
  TextEditingController moduleduration = TextEditingController();
  TextEditingController moduletype = TextEditingController();
  TextEditingController  modulestartdate = TextEditingController();
  TextEditingController moduleenddate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Add new Module',style: TextStyle(color: kblue,fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width:80,
                            child: Text('Module Name',style: TextStyle(color: kblue),)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            controller: modulename,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                                hintText: 'Enter module name',

                                hintStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                enabledBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width:80,
                            child: Text('Module Lead Name',style: TextStyle(color: kblue),)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            controller: modulleadename,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                                hintText: 'Enter module name',

                                hintStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                enabledBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width:80,
                            child: Text('Module Duration ',style: TextStyle(color: kblue),)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            controller: moduleduration,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                                hintText: 'Duration',

                                hintStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                enabledBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width:80,
                            child: Text('Module Type',style: TextStyle(color: kblue),)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            controller: moduletype,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                                hintText: 'Add Type',

                                hintStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                enabledBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30,),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width:80,
                            child: Text('Module Start Date',style: TextStyle(color: kblue),)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            controller: modulestartdate,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                                hintText: 'Start Date',

                                hintStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                enabledBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width:80,
                            child: Text('Module End Date',style: TextStyle(color: kblue),)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            controller: moduleenddate,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                                hintText: 'EndDate',

                                hintStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                enabledBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Kdblue)
                      ),
                      onPressed: () {
                        Get.back();
                      }, child: Text('Cancel'),
                    ),
                    SizedBox(width: 10,),

                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Kdblue),
                      ),
                      onPressed: (){
                        if(modulename.text.isEmpty||moduleduration.text.isEmpty||moduletype.text.isEmpty||modulestartdate.text.isEmpty||moduleenddate.text.isEmpty||modulleadename.text.isEmpty) {
                          print('not good');
                          Get.snackbar('Error', 'Please Enter All Details');
                        }else{
                          print('all good1');
                          setState((){
                            loading = true;
                          });
                          FirebaseFirestore.instance.collection('Create_module').add(
                            CreateNewModule(
                              moduleName:modulename.text,
                              moduleDuration:moduleduration.text,
                              moduleType:moduletype.text,
                              moduleStartDate:modulestartdate.text,
                              moduleEndDate:moduleenddate.text,
                                mouleleadname:modulleadename.text,

                            ).toJson(),

                          );
                          Get.back();
                        }
                      }, child: Text('ADD'),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
