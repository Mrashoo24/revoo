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

  @override
  Widget build(BuildContext context) {
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
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
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

                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Select Branch',

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
                      ),                       SizedBox(height: 12,),

                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Select Manager',
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
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Select HR',
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
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
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
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
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
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
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
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
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
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
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

                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
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

                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
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

                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Select Shift',
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

                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Select Roles',
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



                    ],
                  ),                      Text('By clicking continue, you agree to the',style: TextStyle(color:kblue,fontSize: 12),),

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
                        onTap: (){
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
