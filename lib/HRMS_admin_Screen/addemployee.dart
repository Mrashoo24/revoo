

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/HRMS_admin_Screen/adbranchpg4.dart';
import '../constants/constants.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  var selectedValue = 0;
  var selectedValuea = 0;
  var selectedValueb = 0;
  var selectedValuec = 0;
  var selectedValuee = 0;

  TextEditingController empname = TextEditingController();
  TextEditingController selectBranch = TextEditingController();
  TextEditingController selectManager = TextEditingController();
  TextEditingController selectHr = TextEditingController();
  TextEditingController fullAdsress = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController selectShift = TextEditingController();
  TextEditingController selectRoles = TextEditingController();

  @override
  Widget build(BuildContext context) {

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text('Create Employee',style: TextStyle(color:kblue,fontSize: 30),),

              Divider(
                height: 10,
                thickness: 4,color:Kdblue,endIndent: 90, indent: 90,
              ),
            ],
          ),
          backgroundColor: Colors.white,elevation: 0,automaticallyImplyLeading: true,iconTheme: IconThemeData(color: Kdblue),
        ),
        body: Container(

          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('asset/dpbrCRUD.png')),

          ),


          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text("Employee name"),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                            hintText: 'Emp. Name',

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
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Text("Branch name"),
                        ],
                      ),
                      Container(
                        color: bgGrey,
                        child: Row(
                          children: [
                            Padding(
                              padding:   EdgeInsets.only(left: 20.0),
                              child: DropdownButton(
                                value: selectedValue,
                                onChanged: (int? value){
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                },
                                items: [

                                  DropdownMenuItem(child: Text('Branch A'),value: 0,),
                                  DropdownMenuItem(child: Text('Branch B'),value: 1,),
                                  DropdownMenuItem(child: Text('Branch C'),value: 2,)

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Text("Manager name"),
                        ],
                      ),
                      Container(
                        color: bgGrey,
                        child: Row(
                          children: [
                            Padding(
                              padding:   EdgeInsets.only(left: 20.0),
                              child: DropdownButton(
                                value: selectedValuea,
                                onChanged: (int? value){
                                  setState(() {
                                    selectedValuea = value!;
                                  });
                                },
                                items: [

                                  DropdownMenuItem(child: Text('Manager A'),value: 0,),
                                  DropdownMenuItem(child: Text('Manager B'),value: 1,),
                                  DropdownMenuItem(child: Text('Manager C'),value: 2,)

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Text("HR name"),
                        ],
                      ),
                      Container(
                        color: bgGrey,
                        child: Row(
                          children: [
                            Padding(
                              padding:   EdgeInsets.only(left: 20.0),
                              child: DropdownButton(
                                value: selectedValueb,
                                onChanged: (int? value){
                                  setState(() {
                                    selectedValueb = value!;
                                  });
                                },
                                items: [

                                  DropdownMenuItem(child: Text('HR A'),value: 0,),
                                  DropdownMenuItem(child: Text('HR B'),value: 1,),
                                  DropdownMenuItem(child: Text('HR C'),value: 2,)

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Text("Full Address"),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                            hintText: 'Full Address',
                            enabled: true,
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

                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Text("Designation"),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                            hintText: 'Designation',
                            enabled: true,
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
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Text("DOB"),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                            hintText: 'DOB',
                            enabled: true,
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
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Text("Email"),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                            hintText: 'Email',
                            enabled: true,
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
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Text("Password"),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                            hintText: 'Password',
                            enabled: false,
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
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Text("Phone Number"),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                            hintText: 'Phone Number',
                            enabled: true,
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
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Text("Select Shift"),
                        ],
                      ),
                      Container(
                        color: bgGrey,
                        child: Row(
                          children: [
                            Padding(
                              padding:   EdgeInsets.only(left: 20.0),
                              child: DropdownButton(
                                hint: Text("Select Role"),
                                value: selectedValuec,
                                onChanged: (int? value){
                                  setState(() {
                                    selectedValuec = value!;
                                  });
                                },
                                items: [

                                  DropdownMenuItem(child: Text('Role A'),value: 0,),
                                  DropdownMenuItem(child: Text('Role B'),value: 1,),
                                  DropdownMenuItem(child: Text('Role C'),value: 2,)

                                ],
                              ),

                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Text("Select Role"),
                        ],
                      ),
                      Container(
                        color: bgGrey,
                        child: Row(
                          children: [
                            Padding(
                              padding:   EdgeInsets.only(left: 20.0),
                              child: DropdownButton(
                                hint: Text("Select Role"),
                                value: selectedValuee,
                                onChanged: (int? value){
                                  setState(() {
                                    selectedValuee = value!;
                                  });
                                },
                                items: [

                                  DropdownMenuItem(child: Text('Day'),value: 0,),
                                  DropdownMenuItem(child: Text('Night'),value: 1,),
                                  DropdownMenuItem(child: Text('Mid-Day'),value: 2,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                  Text('By clicking continue, you agree to the',style: TextStyle(color:kblue,fontSize: 12),),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        text: ' Terms & Continue ',
                        style: TextStyle(
                          color: kyellow,
                          fontSize: 12,
                        ),children: [
                        TextSpan(
                          text: 'and',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: ' Privacy Policy ',
                          style: TextStyle(
                            color: kyellow,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: 'of Revoo',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                      ),
                    ),

                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(onPressed: (){
                        Get.back();
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
                          child: Center(child: Text('< Back',style: TextStyle(
                              color: kblue,fontSize: 15
                          ),))),
                      SizedBox(width: 25,),
                      InkWell(
                        onTap: () async {
                          await firestore.collection("CreateEmploye").doc("a5zLTXkrjSnYxWeUQBnZ").get();
                          {


                          }

                          Get.to(DBcrud4());
                        },
                        
                        child: Container(
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
                          child: Center(child: Text('Add',style: TextStyle(color: Colors.white),)),
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


