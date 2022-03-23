import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Cashinoutb extends StatefulWidget {
  const Cashinoutb({Key? key}) : super(key: key);

  @override
  _CashinoutbState createState() => _CashinoutbState();
}

class _CashinoutbState extends State<Cashinoutb> {
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

                SizedBox(height: 10),
                Padding(
                  padding:   EdgeInsets.only(left: 25,right: 25),
                  child: Container(
                    height: 90,width: Get.width,
                    decoration: BoxDecoration(
                        color: Kdblue,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Padding(
                      padding:   EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Product Name 1",style: TextStyle(color: kyellow,fontSize: 20),),
                              Text("Rs 25/-",style: TextStyle(color: kyellow,fontSize: 20),),
                            ],
                          ),
                          Divider(thickness: 1,color: Colors.grey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Qty: 4",style: TextStyle(color: Colors.white,fontSize: 20),),
                              Text("Rs 100/-",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                        ],
                      ),
                    ),



                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding:   EdgeInsets.only(left: 25,right: 25),
                  child: Container(
                    height: 90,width: Get.width,
                    decoration: BoxDecoration(
                        color: Kdblue,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Padding(
                      padding:   EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Product Name 1",style: TextStyle(color: kyellow,fontSize: 20),),
                              Text("Rs 25/-",style: TextStyle(color: kyellow,fontSize: 20),),
                            ],
                          ),
                          Divider(thickness: 1,color: Colors.grey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Qty: 4",style: TextStyle(color: Colors.white,fontSize: 20),),
                              Text("Rs 1000/-",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                        ],
                      ),
                    ),



                  ),
                ),
                SizedBox(height: 10),
                Padding(
                   padding:EdgeInsets.only(right:20),
                  child: Row(  mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Sub-total",style: TextStyle(color: Kdblue,fontSize: 20),),SizedBox(width: 25),
                            Text("200/-",style: TextStyle(color: Kdblue,fontSize: 20),),
                          ],
                        ),
                ),
                Padding(
                  padding:EdgeInsets.only(right:20),
                  child: Row(  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Taxes",style: TextStyle(color: Kdblue,fontSize: 20),),SizedBox(width: 25),
                      Text("18/-",style: TextStyle(color: Kdblue,fontSize: 20),),
                    ],
                  ),
                ),

                Divider(thickness: 2,color: Colors.grey,indent: 30,endIndent: 30,),
                Padding(
                  padding:   EdgeInsets.only(right:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Total",style: TextStyle(color: Kdblue,fontSize: 25),),
                      SizedBox(width: 25),
                      Text("Rs.200/-",style: TextStyle(color: kyellow,fontSize: 25),),
                    ],
                  ),
                ),
                SizedBox(height: 80),
                Padding(
                  padding:   EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    height: 1000,
                    width: Get.width,
                    color: bgGrey,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,width: 140,
                                child: ElevatedButton(

                                  onPressed: (){

                                },
                                  style: ElevatedButton.styleFrom(


                                      side: BorderSide(  color:kblue),
                                      primary: Colors.white,
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  child: Center(
                                    child: Row(
                                    children: [
                                      Icon(
                                        Icons.info,
                                        color:kblue,
                                      ),
                                      SizedBox(width: 5),
                                      Text('Print Invoice',style: TextStyle(
                                          color:kblue,fontSize: 12
                                      ),
                                      ),
                                    ],
                                  ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                height: 40,width: 140,
                                child: ElevatedButton(

                                  onPressed: (){

                                  },
                                  style: ElevatedButton.styleFrom(


                                      side: BorderSide(  color:kblue),
                                      primary: Colors.white,
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Image.asset("asset/dlrss.png"),
                                        SizedBox(width: 10),
                                        Text('Refund',style: TextStyle(
                                            color:kblue,fontSize: 12
                                        ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 40,width: 295,
                          child: ElevatedButton(

                            onPressed: (){

                            },
                            style: ElevatedButton.styleFrom(


                                side: BorderSide(  color:kblue),
                                primary: Colors.white,
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.perm_identity_outlined,
                                  color:kblue,
                                ),
                                SizedBox(width: 10),
                                Text('Customer',style: TextStyle(
                                    color:kblue,fontSize: 20
                                ),
                                ),
                              ],
                            ),
                          ),
                        ),SizedBox(height: 10),
                        Container(
                          height: 40,width: 295,
                          child: ElevatedButton(

                            onPressed: (){

                            },
                            style: ElevatedButton.styleFrom(


                                side: BorderSide(  color:kblue),
                                primary: Colors.white,
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("asset/scrpg.png"),
                                SizedBox(width: 10),
                                Text('Quotation/Order',style: TextStyle(
                                    color:kblue,fontSize: 20
                                ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,width: 90,
                                child: ElevatedButton(

                                  onPressed: (){

                                  },
                                  style: ElevatedButton.styleFrom(


                                      side: BorderSide(  color:kblue),
                                      primary: Colors.white,
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  child: Text('Qty',style: TextStyle(
                                      color:kblue,fontSize: 20
                                  ),
                                  ),



                                ),
                              ),
                              SizedBox(width: 12),
                              Container(
                                height: 40,width: 90,
                                child: ElevatedButton(

                                  onPressed: (){

                                  },
                                  style: ElevatedButton.styleFrom(


                                      side: BorderSide(  color:kblue),
                                      primary: Colors.white,
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  child: Text('Disc',style: TextStyle(
                                      color:kblue,fontSize: 20
                                  ),
                                  ),



                                ),
                              ),
                              SizedBox(width: 12),
                              Container(
                                height: 40,width: 90,
                                child: ElevatedButton(

                                  onPressed: (){

                                  },
                                  style: ElevatedButton.styleFrom(
                                      side: BorderSide(  color:kblue),
                                      primary: Colors.white,
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  child: Text('Price',style: TextStyle(
                                            color:kblue,fontSize: 20
                                        ),
                                        ),



                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:   EdgeInsets.only(left: 20,right:20 ),
                  child: InkWell(
                    child: Container(
                      height: 41,
                      width: Get.width,
                      color: Kdblue,
                      child:Center(child: Text("Pay",style: TextStyle(color: Colors.white,fontSize: 20,),)),
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
