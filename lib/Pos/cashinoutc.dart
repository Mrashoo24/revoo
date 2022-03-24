import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Cashinoutc extends StatefulWidget {
  const Cashinoutc({Key? key}) : super(key: key);

  @override
  _CashinoutcState createState() => _CashinoutcState();
}

class _CashinoutcState extends State<Cashinoutc> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:   EdgeInsets.all(8.0),
                  child: Container(
                    height: 41,
                    width: Get.width,
                    color: Kdblue,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Image.asset("asset/dollar.png"),
                        SizedBox(width: 15,),
                        Text("Cash In/Out",style: TextStyle(color: Colors.white,fontSize: 20,),),
                        SizedBox(width: 210),
                        Padding(
                          padding:   EdgeInsets.only(right: 8.0),
                          child: Image.asset("asset/arows .png"),
                        )
                      ],
                    ),
                  ),
                ),
                Text("Rs. 40,000/-",style: TextStyle(color: kyellow,fontSize: 35),),
SizedBox(height: 20),
                Padding(
                  padding:   EdgeInsets.only(left: 20.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Method",style: TextStyle(color: kblue,fontSize: 20),)),
                ),SizedBox(height: 10),
                Padding(
                  padding:   EdgeInsets.only(left: 12,right: 12),
                  child: Container(
                    height: 250,width: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),color:Kdblue,
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 10,right: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding:   EdgeInsets.only(top: 45.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Cash",style: TextStyle(color: Colors.white,fontSize: 30),),
                                Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 40,),

                              ],
                            ),
                          ),
                          Divider(thickness: 2,color: Colors.grey,indent: 10,endIndent: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Bank",style: TextStyle(color: Colors.white,fontSize: 30),),
                              Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 40,),

                            ],
                          ),
                          Divider(thickness: 2,color: Colors.grey,indent: 10,endIndent: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Customer Account",style: TextStyle(color: Colors.white,fontSize: 30),),
                              Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 40,),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Padding(
                  padding:   EdgeInsets.only(left: 20,right:20 ),
                  child: InkWell(
                    child: Container(
                      height: 41,
                      width: Get.width,
                      color: Kdblue,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.perm_identity_outlined,
                            color:Colors.white
                          ),
                          Text("Customer",style: TextStyle(color: Colors.white,fontSize: 20,),),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding:   EdgeInsets.only(left: 20,right:20 ),
                  child: InkWell(
                    child: Container(
                      height: 41,
                      width: Get.width,
                      color: Kdblue,
                      child:Center(
                          child: Text("Generate Invoice",style: TextStyle(color: Colors.white,fontSize: 20,),)),
                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),


    );
  }
}
