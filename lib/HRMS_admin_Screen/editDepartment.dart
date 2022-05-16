import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/HRMS_admin_Screen/adbranchpg4.dart';
import 'package:revoo/HRMS_admin_Screen/allDepartmetns.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Controllers/branchController.dart';
import '../../constants/constants.dart';


class EditDepartment extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;
  final String? id;
  final String? deptName;
  final String? branchName;
  const EditDepartment({Key? key,  this.deptName,  this.branchName, required this.userDoc, this.id}) : super(key: key);

  @override
  _EditDepartment createState() => _EditDepartment();
}

class _EditDepartment extends State<EditDepartment> {

  var firestore =  FirebaseFirestore.instance;
  TextEditingController deptName = TextEditingController();
  TextEditingController head = TextEditingController();
  TextEditingController noEmployee = TextEditingController();
  var selectedValue = '';

  @override
  void initState() {
    setState(() {
      deptName = TextEditingController(text: widget.deptName);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text('Create Department',style: TextStyle(color:kblue,fontSize: 30),),

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
                        controller: deptName,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Dept. Name',

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
                      SizedBox(height: 10,),
                      InkWell(

                        onTap: (){

                        },
                        child: GetX(

                            init: Get.put<BranchController>(BranchController()),
                            builder: (BranchController branchController) {


                              print('list = ${branchController.branchList}');


                              if(branchController.branchList.value.isEmpty){
                                return Text('No Data');

                              }

                              var firstValue = branchController.branchList.value.first.bid!;
                              return  Container(
                                width: Get.width,
                                height: 65,

                                decoration: BoxDecoration(
                                    color:bgGrey,
                                    borderRadius: BorderRadius.circular(0)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: DropdownButton(
                                      iconSize: 0,
                                      dropdownColor: Colors.grey[200],



                                      borderRadius: BorderRadius.circular(10),
                                      value: selectedValue == '' ? firstValue : selectedValue,
                                      onChanged: (String? value){



                                        setState(() {
                                          selectedValue = value!;
                                          branchController.departmentController.branchId.value = value;
                                        });
                                        print('d =$selectedValue');
                                      },

                                      items: branchController.branchList.value.map((e){

                                        return DropdownMenuItem(child: Text(e.branchName!),value: e.bid!,);

                                      }).toList()

                                  ),
                                ),
                              );
                            }
                        ) ,
                      ),                       SizedBox(height: 12,),

                      // TextFormField(
                      //   enabled: false,
                      //   decoration: InputDecoration(
                      //       filled: true,
                      //       fillColor: bgGrey,
                      //       contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                      //       hintText: 'Select Manager',
                      //       enabled: false,
                      //       hintStyle: TextStyle(
                      //           color: Colors.grey
                      //       ),
                      //       border: OutlineInputBorder(
                      //           borderSide: BorderSide(color: Colors.white)
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(color: Colors.white)
                      //       ),
                      //       enabledBorder:OutlineInputBorder(
                      //           borderSide: BorderSide(color: Colors.white)
                      //       )
                      //
                      //
                      //   ),
                      // ),
                      SizedBox(height: 12,),



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
                        onTap: () async {
                          await  firestore.collection('Department').doc(widget.id).update({

                            "dept_name" : deptName.text,
                            "bid" : selectedValue,

                          });
                          Get.back();
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
                          child: Center(child: Text('Update',style: TextStyle(color: Colors.white),)),
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