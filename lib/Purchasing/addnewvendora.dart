import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/Purchasing/addnewvendorb.dart';
import 'package:revoo/Purchasing/vendors.dart';
import '../constants/constants.dart';


class Addnewvendora extends StatefulWidget {
  const Addnewvendora({Key? key}) : super(key: key);
  @override
  _AddnewvendorState createState() => _AddnewvendorState();
}
class _AddnewvendorState extends State<Addnewvendora> {
  String? id1;
  CollectionReference firebase = FirebaseFirestore.instance.collection("vendors");
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();





  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController websitecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController vcountryController = TextEditingController();
  TextEditingController vstateController = TextEditingController();
  TextEditingController vcityController = TextEditingController();
  TextEditingController vzipcodeController = TextEditingController();




  TextEditingController salescontroller = TextEditingController();
  TextEditingController banknumbercontroller = TextEditingController();
  TextEditingController ifsccontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController branchcontroller = TextEditingController();
  TextEditingController pmethodcontroller = TextEditingController();


  int _value = 1;
  int _valuea =  2;
  int _valueb =  3;
  int _valuec =  4;
  int _valued =  5;


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

  int selectefdTerms = 1;
  int selectedPayment = 1;
  bool  bvalue = false;
  bool  dvalue = false;
  bool nextPage = false;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: nextPage  ? buildSecondCard()  : firstscreen(),
      ),
    );
  }

  Form firstscreen(){
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
        child: Container(
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
                          child: Text('Add New Vendor',style: TextStyle(fontSize: 30,color: kblue),)),          //add new vendor
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(

                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: Kdblue,
                          ),
                          child: Center(child: Text('Contact Info',style: TextStyle(color: Colors.white,fontSize: 15),)),

                        ),
                      ),SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(border: Border.all(
                              color: Kdblue,
                          )),
                          child: Center(child: Text('Sales & Purchase',style: TextStyle(fontSize: 15,color: kblue),)),
                        ),
                      ),
                    ],
                  ),          // contact info
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 10),
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
                        ],
                      ),

                    ],
                  ),                 //individual checkbox

                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Vendor Name',style: TextStyle(fontSize: 18,color:kblue ),)),
                  Divider(
                    height: 5,thickness: 1,color: kblue,
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 37,
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                    child: TextFormField(
                      validator: (val) => val!.length < 1 ? 'please enter vendor name' : null,
                      controller: namecontroller,
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
                  ),                        //vendor name

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
                      validator: (val) => val!.length < 1 ? 'please enter gmail' : null,
                      controller: emailcontroller,
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
                  ),                         //email

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
                      validator: (val) => val!.length < 1 ? 'please phone-number' : null,
                      keyboardType: TextInputType.number,
                      controller: phonecontroller,
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
                  ),                           //phone

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
                      validator: (val) => val!.length < 1 ? 'please enter websitew' : null,
                      controller: websitecontroller,
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
                  ),                                //website

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
                      validator: (val) => val!.length < 1 ? 'please enter address' : null,
                      controller: addresscontroller,
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
                  ),                          //adress

                  SizedBox(height: 4),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                          child: Center(
                            child: TextFormField(
                              controller: vcountryController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                          child: Center(
                            child: TextFormField(
                              controller: vstateController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 2),
                                  filled: true,
                                  fillColor: bgGrey,
                                  hintText: "State",
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                          child: Center(
                            child: TextFormField(
                              controller: vcityController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                                    borderSide: BorderSide(color: bgGrey),
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  )

                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(



                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                          child: Center(
                            child: TextFormField(
                              controller: vzipcodeController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        child: ElevatedButton(onPressed: (){
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
                            child: Center(child: Text('Back',style: TextStyle(
                                color: kblue,fontSize: 15
                            ),))),
                      ),
                      SizedBox(width: 15),
                      InkWell(
                        onTap: (){
                         var formkey =  _formKey.currentState!.validate();
                         if(formkey == true){
                           setState(() {
                             nextPage = true;
                           });
                         }


                          // // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Addnewvendorb(value:id1)));
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Addnewvendorb(idval: id1!)));
                        },
                        child: Container(
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
                              child: Text('NEXT',style: TextStyle(
                                  color: Colors.white,fontSize: 15
                              ),),
                            ),
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
      );
  }



  Container buildSecondCard() {
    return Container(
      width: Get.width,

      child: SingleChildScrollView(
        child: Padding(
          padding:   EdgeInsets.all(20.0),
          child:  Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey2,
            child: Column(
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
                    validator: (val) => val!.length < 1 ? 'please enter sales personn name' : null,
                    controller: salescontroller,
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
                ),                                     //sales person

              /////////sad


                SizedBox(height: 15),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Payment Method',style: TextStyle(fontSize: 18,color:kblue ),)),
                Divider(
                  height: 5,thickness: 1,color: kblue,
                ),
                SizedBox(height: 4),
                Container(
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                  child: TextFormField(
                    validator: (val) => val!.length < 1 ? 'please enter payment method' : null,
                    controller: pmethodcontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                        filled: true,
                        fillColor: bgGrey,
                        hintText: "payment method",

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
                    child: Text('Bank Accounts',style: TextStyle(fontSize: 18,color:kblue ),)),
                Divider(
                  height: 5,thickness: 1,color: kblue,
                ),
                SizedBox(height: 4),


                SizedBox(height: 10),
                Container(

                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                  child: TextFormField(
                    validator: (val) => val!.length < 1 ? 'please enter bank number' : null,
                    controller: banknumbercontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                        filled: true,
                        fillColor: bgGrey,
                        hintText: "Acc Number",

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
                ),                                               //account number


                SizedBox(height: 10),
                Container(
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                    child: TextFormField(
                      validator: (val) => val!.length < 1 ? 'please enter ifsc code' : null,
                      controller: ifsccontroller,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                          filled: true,
                          fillColor: bgGrey,
                          hintText: "IFSC Code",                                   //ifsc code
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
                  ),                                 //ifsc code


                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                  child: TextFormField(
                    validator: (val) => val!.length < 1 ? 'please enter bank city name' : null,
                    controller: citycontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                        filled: true,
                        fillColor: bgGrey,
                        hintText: "City",                                            //city
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
                //
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                  child: TextFormField(
                    validator: (val) => val!.length < 1 ? 'please enter branch name' : null,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                        filled: true,
                        fillColor: bgGrey,
                        hintText: "Branch",                            //branch
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
                        setState(() {
                          nextPage = false;
                        });// Get.back();
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
                          child: Center(child: Text('back',style: TextStyle(
                              color: kblue,fontSize: 15
                          ),))),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: (){
                        var formkey =  _formKey2.currentState!.validate();
                        if(formkey == true){
                        firebase.add(
                            {
                              "vendor_name": namecontroller.text,
                              "email": emailcontroller.text,
                              "mobile": phonecontroller.text,
                              "website" : websitecontroller.text,
                              "address" : addresscontroller.text,
                              "country": vcountryController.text,
                              "state":vstateController.text,
                              "city":vcityController.text,
                              "zip_code":vzipcodeController.text,
                              "sales_person": salescontroller.text,
                              "bank_account_number":banknumbercontroller.text,
                              "ifsc_code":ifsccontroller.text,
                              "bank_city":citycontroller.text,
                              "bank_branch":branchcontroller.text,
                              "paymentmethod":pmethodcontroller.text,
                              "cid": 'cid',
                              "bid": 'bid',
                              "did": 'did',
                              "uid": 'uid',
                              "mid": 'mid'
                            }
                        );
                        setState(() {
                          namecontroller.clear();
                          emailcontroller.clear();
                          phonecontroller.clear();
                          websitecontroller.clear();
                          addresscontroller.clear();
                          salescontroller.clear();
                          banknumbercontroller.clear();
                          ifsccontroller.clear();
                          citycontroller.clear();
                          branchcontroller.clear();
                          pmethodcontroller.clear();
                          vcityController.clear();
                          vstateController.clear();
                          vcityController.clear();
                          vzipcodeController.clear();
                        });

                        Get.to(Vendorsa());
                        }
                      },
                      child: Container(
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
