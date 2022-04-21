

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
  var selectedValue = 'Branch A';
  var selectedValuea = 'Manager A';
  var selectedValueb = 'HR A';
  var selectedValuec = "Day";
  var selectedValuee = 'Role A';

  var branchname = [

    DropdownMenuItem(child: Text('Branch A'),value: 'Branch A',),
    DropdownMenuItem(child: Text('Branch B'),value: 'Branch B',),
    DropdownMenuItem(child: Text('Branch C'),value:'Branch C',)

  ];

  var manager  = [

    DropdownMenuItem(child: Text('Manager A'),value: 'Manager A',),
    DropdownMenuItem(child: Text('Manager B'),value: 'Manager B',),
    DropdownMenuItem(child: Text('Manager C'),value: 'Manager C',)

  ];

  var selecthr = [

    DropdownMenuItem(child: Text('HR A'),value: 'HR A',),
    DropdownMenuItem(child: Text('HR B'),value: 'HR B',),
    DropdownMenuItem(child: Text('HR C'),value: 'HR C',)

  ];

  var selectshift =[

    DropdownMenuItem(child: Text('Day'),value: 'Day',),
    DropdownMenuItem(child: Text('Night'),value: 'Night',),
    DropdownMenuItem(child: Text('Mid-Day'),value: 'Mid-Day',),

  ];

  var selectrole = [

    DropdownMenuItem(child: Text('Role A'),value: 'Role A',),
    DropdownMenuItem(child: Text('Role B'),value: 'Role B',),
    DropdownMenuItem(child: Text('Role C'),value: 'Role C',)

  ];



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

                        controller: empname,
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
                              child: DropdownButton<String?>(
                                value: selectedValue,
                                onChanged: (String? value){
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                },
                                items:branchname ,
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
                              child: DropdownButton<String?>(
                                value: selectedValuea,
                                onChanged: (String? value){
                                  setState(() {
                                    selectedValuea = value!;
                                  });
                                },
                                items: manager,
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
                              child: DropdownButton<String?>(
                                value: selectedValueb,
                                onChanged: (String? value){
                                  setState(() {
                                    selectedValueb = value!;
                                  });
                                },
                                items: selecthr,
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
                        controller: fullAdsress,
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
                        controller: designation,
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
                        controller: dob,
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
                        controller: email,
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
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                            hintText: 'Password',


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
                        controller: phoneNumber,
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
                            ),
                        ),
                      ),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Text(
                              "Select Role"),
                        ],
                      ),
                      Container(
                        color: bgGrey,
                        child: Row(
                          children: [
                            Padding(
                              padding:   EdgeInsets.only(left: 20.0),
                              child: DropdownButton<String?>(
                                hint: Text("Select Role"),
                                value: selectedValuec,
                                onChanged: (String? value){
                                  setState(() {
                                    selectedValuec = value!;
                                  });
                                },
                                items:selectrole ,
                              ),

                            ),
                          ],
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
                              child: DropdownButton<String?>(
                                hint: Text("Select Shift"),
                                value: selectedValuee,
                                onChanged: (String? value){
                                  setState(() {
                                    selectedValuee = value!;
                                  });
                                },
                                items: selectshift,
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
                          print('branchnsme = ${selectedValue}');


                          await firestore.collection("Employee").add(
                              {
                                'Branch Name':empname.text,
                                "selectBranch" : selectedValue,
                                "selectManager" : selectedValuea,
                                "selectHr" : selectedValueb,
                                'Address':fullAdsress.text,
                                'Designation' : designation.text,
                                "dob" : dob.text,
                                "email" : email.text,
                                "password" : password.text,
                                "phoneNumber" : phoneNumber.text,
                                "selectShift" : selectedValuec,
                                "selectRoles" : selectedValuee
                              }
                          ).then(
                              (value) async {
                                await firestore.collection('Employee')
                                    .doc(value.id)
                                    .update
                                  ({
                                  'bid': value.id
                                });
                              }
                          );
                                var docSnap =  await firestore.collection('Employee').doc('QOebgqfRn7wqKCpyrRtw').get();
                                print(docSnap.data());
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


