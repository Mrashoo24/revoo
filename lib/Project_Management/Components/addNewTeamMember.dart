import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Models/AddMemberModel.dart';
import '../../constants/constants.dart';

class AddNewMember extends StatefulWidget {
  const AddNewMember({Key? key}) : super(key: key);

  @override
  _AddNewMemberState createState() => _AddNewMemberState();
}
class _AddNewMemberState extends State<AddNewMember> {

  bool loading = false;
  TextEditingController employeename = TextEditingController();
  TextEditingController employeemanagername = TextEditingController();
  TextEditingController employeehiredate = TextEditingController();
  TextEditingController employeereleasedate = TextEditingController();
  TextEditingController purposeofhire = TextEditingController();

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
                      Text('Add new Members',style: TextStyle(color: kblue,fontWeight: FontWeight.bold,fontSize: 20),),
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
                            child: Text('Employee Name',style: TextStyle(color: kblue),)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            controller: employeename,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                                hintText: 'Emp Name',

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
                            child: Text('Employee Manager name ',style: TextStyle(color: kblue),)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            controller: employeemanagername,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                                hintText: 'Emp Manager Name',

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
                            child: Text('Employee Hire Date',style: TextStyle(color: kblue),)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            controller: employeehiredate,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                                hintText: 'Hire Date',

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
                            child: Text('Employee Release Date',style: TextStyle(color: kblue),)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            controller: employeereleasedate,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                                hintText: 'Release Date',

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
                            child: Text('Purpose of Hire',style: TextStyle(color: kblue),)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            controller: purposeofhire,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                                hintText: 'Purpose',

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
                          if(employeename.text.isEmpty||employeemanagername.text.isEmpty||employeehiredate.text.isEmpty||employeereleasedate.text.isEmpty||purposeofhire.text.isEmpty) {
                            print('not good');
                            Get.snackbar('Error', 'Please Enter All Details');
                          }else{
                            print('all good1');
                            setState((){
                              loading = true;
                            });
                            FirebaseFirestore.instance.collection('My_Project_Team').add(
                              ProjectMember(
                                  employee:employeename.text,
                                  employeeManagerName:employeemanagername.text,
                                  employeeHireDate:employeehiredate.text,
                                  employeeReleaseDate:employeereleasedate.text,
                                  purposeOfHire:purposeofhire.text,

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
