import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:collection/collection.dart';
import 'package:revoo/HRMS_admin_Screen/adbranchpg4.dart';
import '../constants/constants.dart';

class AddEmployee extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;
  const AddEmployee({Key? key, required this.userDoc}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  var selectedValueBranch = '4L3hXNLK08Wwh2fhPEMe';
  var selectedValuemanager = 'bbiC9LlOWdekemISmJFa6cMKNdl1';
  var selectedValueHR = 'bbiC9LlOWdekemISmJFa6cMKNdl1';
  var selectedValuec = '92cF8tnZ4B26MomVAyp6';
  var selectedValuee = 'ktaDFQum0VTncqJVWITk';

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
  TextEditingController professionTaxController = TextEditingController(text: '0');
  TextEditingController basicPayController = TextEditingController(text: '0');
  TextEditingController selectBranch = TextEditingController();
  TextEditingController selectManager = TextEditingController();
  TextEditingController selectHr = TextEditingController();
  TextEditingController fullAdsress = TextEditingController();
  TextEditingController totalDeductions = TextEditingController();
  TextEditingController houseRentAllowanceController = TextEditingController(text: '0');
  TextEditingController designation = TextEditingController();
  TextEditingController medicalAllowanceController = TextEditingController(text: '0');
  TextEditingController dob = TextEditingController();
  TextEditingController conveyanceController = TextEditingController(text: '0');
  TextEditingController email = TextEditingController();
  TextEditingController mealCouponController = TextEditingController(text: '0');
  TextEditingController password = TextEditingController();
  TextEditingController travelAllowanceController = TextEditingController(text: '0');
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController generalProvidentFundController = TextEditingController();
  TextEditingController grossPayController = TextEditingController(text: '0');
  TextEditingController selectShift = TextEditingController();
  TextEditingController selectRoles = TextEditingController();

  bool nextPage = true;
  String total = "0";
  String total2 = "0";
  String basicPay = "0";
  String houseRentAllowance = "0";
  String medicalAllowance = "0";
  String conveyance = "0";
  String mealCoupon = "0";
  String travelAllowance = "0";
  String grossPay = "0";
  String professionTax = "0";
  String generalProvidentFund = "0";
  String totalBalance = "0";


  @override
  Widget build(BuildContext context) {
    total = "0";
    total2 = "0";
    total = (double.parse(basicPay) +
        double.parse(houseRentAllowance) +
        double.parse(medicalAllowance) +
        double.parse(conveyance) +
        double.parse(mealCoupon) +
        double.parse(travelAllowance)).toString();

    total2 = (double.parse(professionTax)
    + double.parse(generalProvidentFund)
    ).toString();

    totalBalance = (double.parse(total) - double.parse(total2)).toString();


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
        body: FutureBuilder(
          future: Future.wait([

            firestore.collection("Employee")
                .where("cid", isEqualTo: widget.userDoc.get("cid")).get(),

            firestore.collection("Branch")
                .where("cid", isEqualTo: widget.userDoc.get("cid")).get(),


            firestore.collection("Shifts")
                .where("cid", isEqualTo: widget.userDoc.get("cid")).get(),

          ]),
          builder: (BuildContext context,  AsyncSnapshot<List<QuerySnapshot<Map<String, dynamic>>>> future) {

            if(!future.hasData){
              return kprogressbar;
            }

            var empDoc = future.requireData[0].docs;

            var branchDoc = future.requireData[1].docs;


            var shiftDoc = future.requireData[2].docs;

            selectedValueBranch = branchDoc[0].id;
            selectedValuemanager = empDoc[0].id;
            selectedValuec = shiftDoc[0].id;
            selectedValuee = empDoc[0].id;

            return nextPage ? Container(

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
                                    value: selectedValueBranch,
                                    onChanged: (String? value){
                                      setState(() {
                                        selectedValueBranch = value!;
                                      });
                                    },
                                    items:branchDoc.mapIndexed((index, element) => DropdownMenuItem(child: Text(element.get("branch_name")),value: element.id,),
                                    ).toList(),
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
                                    value: selectedValuemanager,
                                    onChanged: (String? value){
                                      setState(() {
                                        selectedValuemanager = value!;
                                      });
                                    },
                                    items:empDoc.mapIndexed((index, element) => DropdownMenuItem(child: Text(element.get("name")),value: element.id,),
                                    ).toList(),
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
                                    value: selectedValueHR,
                                    onChanged: (String? value){
                                      setState(() {
                                        selectedValueHR = value!;
                                      });
                                    },
                                    items:empDoc.mapIndexed((index, element) => DropdownMenuItem(child: Text(element.get("name")),value: element.id,),
                                    ).toList(),
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
                                  "Select Shift"),
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
                                    value: selectedValuec,
                                    onChanged: (String? value){
                                      setState(() {
                                        selectedValuec = value!;
                                      });
                                    },
                                    items:shiftDoc.mapIndexed((index, element) => DropdownMenuItem(child: Text(element.get("time")),value: element.id,),
                                    ).toList(),
                                  ),

                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12,),
                          // Row(
                          //   children: [
                          //     Text("Select Shift"),
                          //   ],
                          // ),
                          // Container(
                          //   color: bgGrey,
                          //   child: Row(
                          //     children: [
                          //       Padding(
                          //         padding:   EdgeInsets.only(left: 20.0),
                          //         child: DropdownButton<String?>(
                          //           hint: Text("Select Shift"),
                          //           value: selectedValuee,
                          //           onChanged: (String? value){
                          //             setState(() {
                          //               selectedValuee = value!;
                          //             });
                          //           },
                          //           items:shiftDoc.mapIndexed((index, element) => DropdownMenuItem(child: Text(element.get("time")),value: element.id,),
                          //           ).toList(),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
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
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  nextPage = false;
                                });
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
                                child: Center(child: Text('Next',style: TextStyle(color: Colors.white),)),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ) :
            Container(

              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('asset/dpbrCRUD.png')),

              ),


              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(

                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text("Basic Pay"),
                                    ],
                                  ),
                                  TextFormField(
                                    onChanged: (value){
                                      setState(() {
                                      value == "" ? basicPay = "0" : basicPay = value;
                                      });
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z!@#$%^&*,./;:"-+~`|=]'))
                                    ],
                                    keyboardType: TextInputType.number,
                                    controller: basicPayController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgGrey,
                                        contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                                        hintText: 'Basic pay',

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
                                      Text("House Rent Allowance"),
                                    ],
                                  ),
                                  TextFormField(
                                    onChanged: (value){
                                      setState(() {
                                        value == "" ? houseRentAllowance = "0" : houseRentAllowance = value;
                                      });
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z!@#$%^&*,./;:"-+~`|=]'))
                                    ],
                                    keyboardType: TextInputType.number,
                                    controller: houseRentAllowanceController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgGrey,
                                        contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                                        hintText: 'House rent allowance',
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
                                      Text("Medical Allowance"),
                                    ],
                                  ),
                                  TextFormField(
                                    onChanged: (value){
                                      setState(() {
                                        value == "" ? medicalAllowance = "0" : medicalAllowance = value;
                                      });
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z!@#$%^&*,./;:"-+~`|=]'))
                                    ],
                                    keyboardType: TextInputType.number,
                                    controller: medicalAllowanceController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgGrey,
                                        contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                                        hintText: 'Medical allowance',
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
                                      Text("Conveyance"),
                                    ],
                                  ),
                                  TextFormField(
                                    onChanged: (value){
                                      setState(() {
                                        value == "" ? conveyance = "0" : conveyance = value;
                                      });
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z!@#$%^&*,./;:"-+~`|=]'))
                                    ],
                                    keyboardType: TextInputType.number,
                                    controller: conveyanceController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgGrey,
                                        contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                                        hintText: 'Conveyance',
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
                                      Text("Meal Coupon"),
                                    ],
                                  ),
                                  TextFormField(
                                    onChanged: (value){
                                      setState(() {
                                        value == "" ? mealCoupon = "0" : mealCoupon = value;
                                      });
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z!@#$%^&*,./;:"-+~`=|]'))
                                    ],
                                    keyboardType: TextInputType.number,
                                    controller: mealCouponController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgGrey,
                                        contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                                        hintText: 'Meal coupon',
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
                                      Text("Travel Allowance"),
                                    ],
                                  ),
                                  TextFormField(
                                    onChanged: (value){
                                      setState(() {
                                        value == "" ? travelAllowance = "0" : travelAllowance = value;
                                      });
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z!@#$%^&*,./;:"-+~`=|]'))
                                    ],
                                    keyboardType: TextInputType.number,
                                    controller: travelAllowanceController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgGrey,
                                        contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                                        hintText: 'Travel allowance',


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
                                      Text("Gross Pay"),
                                    ],
                                  ),
                                  TextFormField(
                                    onChanged: (value){
                                      setState(() {
                                        value = total;
                                      });
                                    },
                                    enabled: false,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: bgGrey,
                                      contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                                      hintText: total.toString(),
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
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text("Profession Tax"),
                                    ],
                                  ),
                                  TextFormField(
                                    onChanged: (value){
                                      setState(() {
                                        value == "" ? professionTax = "0" : professionTax = value;
                                      });
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z!@#$%^&*,./;:"-+~`|=]'))
                                    ],
                                    keyboardType: TextInputType.number,
                                    controller: professionTaxController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgGrey,
                                        contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                                        hintText: 'Profession tax',

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
                                      Text("General Provident Fund"),
                                    ],
                                  ),
                                  TextFormField(
                                    onChanged: (value){
                                      setState(() {
                                        value == "" ? generalProvidentFund = "0" : generalProvidentFund = value;
                                      });
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z!@#$%^&*,./;:"-+~`|=]'))
                                    ],
                                    controller: generalProvidentFundController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgGrey,
                                        contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                                        hintText: "General provident fund",
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
                                  SizedBox(height: Get.height*0.26,),
                                  Row(
                                    children: [
                                      Text("Total Deductions"),
                                    ],
                                  ),
                                  TextFormField(
                                    onChanged: (value){
                                      value = total2;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z!@#$%^&*,./;:"-+~`|=]'))
                                    ],
                                    keyboardType: TextInputType.number,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: bgGrey,
                                      contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                                      hintText: total2,
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
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text("Net Pay"),
                                    ],
                                  ),
                                  TextFormField(
                                    onChanged: (value){
                                      value = totalBalance;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z!@#$%^&*,./;:"-+~`|=]'))
                                    ],
                                    keyboardType: TextInputType.number,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: bgGrey,
                                      contentPadding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                                      hintText: totalBalance,
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
                                ],
                              ),
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

                              print('branchnsme = ${selectedValueBranch}');



                              await firestore.collection("Employee").add(
                                  {
                                    'name':empname.text,
                                    "bid" : selectedValueBranch,
                                    "mid" : selectedValuemanager,
                                    "hid" : selectedValueHR,
                                    'Address':fullAdsress.text,
                                    'Designation' : designation.text,
                                    "dob" : dob.text,
                                    "email" : email.text,
                                    "password" : password.text,
                                    "phoneNumber" : phoneNumber.text,
                                    "shiftid" : selectedValuec,
                                    "selectRoles" : selectedValuee,
                                    'cid' : widget.userDoc.get('cid'),
                                    'did' : 'did',
                                    'reporting' : selectedValuemanager,
                                    'uid' : '',
                                    'basic_pay' : basicPayController.text,
                                    'house_rent_allowance' : houseRentAllowanceController.text,
                                    'medical_allowance' : medicalAllowanceController.text,
                                    'conveyance' : conveyanceController.text,
                                    'meal_coupon' : mealCouponController.text,
                                    'travel_allowance' :travelAllowanceController.text,
                                    'gross_pay' : total,
                                    'profession_tax' : professionTaxController.text,
                                    'general_provident_fund' : generalProvidentFund,
                                    'total_deductions' : total2,
                                    'net_pay' : totalBalance

                                  }
                              ).then(
                                      (value) async {
                                    await firestore.collection('Employee')
                                        .doc(value.id)
                                        .update
                                      ({
                                      'uid': value.id,


                                    });
                                  }
                              );

                              // var docSnap =  await firestore.collection('Employee').doc('QOebgqfRn7wqKCpyrRtw').get();
                              //
                              // print(docSnap.data());

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
                              child: Center(child: Text('Add',style: TextStyle(color: Colors.white),)),
                            ),
                          ),


                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
            },
        ),
      ),
    );
  }
}