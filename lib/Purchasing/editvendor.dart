import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/Purchasing/addnewvendorb.dart';
import 'package:revoo/Purchasing/vendors.dart';
import '../constants/constants.dart';


class Editvendors extends StatefulWidget {

 final String? name;
 final String? email;
 final String? phone;
 final String? website;
 final String? address;
 final String? vcountry;
 final String? vstate;
 final String? vcity;
 final String? vzipcode;
 final String? sales;
 final String? banknumber;
 final String? ifsc;
 final String? city;
 final String? branch;
 final String? pmethod;
 final String? indID;


  const Editvendors({Key? key,this.name,this.email,this.phone,this.website,this.address,this.sales,this.banknumber,this.ifsc,this.city,this.branch,this.pmethod,this.indID,this.vcountry,this.vstate,this.vcity,this.vzipcode}) : super(key: key);
  @override
  State<Editvendors> createState() => _EditvendorsState();
}

class _EditvendorsState extends State<Editvendors> {

  //////

  //////

  String? id1;
  var firebase = FirebaseFirestore.instance.collection("vendors");




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

  @override
  void initState(){
    setState(() {
      namecontroller = widget.name == null ? TextEditingController() : TextEditingController(text: widget.name);
      emailcontroller = widget.email == null ? TextEditingController() : TextEditingController(text: widget.email);
      phonecontroller = widget.phone == null ? TextEditingController() : TextEditingController(text: widget.phone);
      websitecontroller = widget.website == null ? TextEditingController() : TextEditingController(text: widget.website);
      addresscontroller = widget.address == null ? TextEditingController() : TextEditingController(text: widget.address);
      vcountryController = widget.vcountry == null ? TextEditingController() : TextEditingController(text: widget.vcountry);
      vstateController = widget.vstate == null ? TextEditingController() : TextEditingController(text: widget.vstate);
      vcityController = widget.vcity == null ? TextEditingController() : TextEditingController(text: widget.vcity);
      vzipcodeController = widget.vzipcode == null ? TextEditingController() : TextEditingController(text: widget.vzipcode);


      salescontroller = widget.sales == null ? TextEditingController() : TextEditingController(text: widget.sales);
      banknumbercontroller = widget.banknumber == null ? TextEditingController() : TextEditingController(text: widget.banknumber);
      ifsccontroller = widget.ifsc == null ? TextEditingController() : TextEditingController(text: widget.ifsc);
      citycontroller = widget.city == null ? TextEditingController() : TextEditingController(text: widget.city);
      branchcontroller = widget.branch == null ? TextEditingController() : TextEditingController(text: widget.branch);
      pmethodcontroller = widget.pmethod == null ? TextEditingController() : TextEditingController(text: widget.pmethod);
    });
  }


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

  Form firstscreen() {
    return Form(
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
                        child: Text('Edit Vendor',style: TextStyle(fontSize: 30,color: kblue),)),          //add new vendor
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
                            Text("Company",style: TextStyle(color: kblue,fontSize: 12),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),                //individual checkbox

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
                        ),
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
                        setState(() {
                          nextPage = true;
                        });

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
          child:  Column(
            children: [
              SizedBox(height: 25),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Edit Vendor',style: TextStyle(fontSize: 30,color: kblue),)),
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
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                      filled: true,
                      fillColor: bgGrey,
                      hintText: "Branch",                                              //branch

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
                      firebase.doc(widget.indID).update(
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
                            "paymentmethod":pmethodcontroller.text
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
                      });
                      Get.to(Vendorsa());
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
                          child: Text('Update',style: TextStyle(
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
    );
  }

}
