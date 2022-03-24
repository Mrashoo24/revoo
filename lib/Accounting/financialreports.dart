import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Financialreports extends StatefulWidget {
  const Financialreports({Key? key}) : super(key: key);

  @override
  _FinancialreportsState createState() => _FinancialreportsState();
}

class _FinancialreportsState extends State<Financialreports> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
child: Scaffold(
  body: Container(
    child: Padding(
      padding:   EdgeInsets.all(20.0),
      child:  SingleChildScrollView(
        child: Column(
          children: [



            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text('Finalcial Reports',style: TextStyle(color:kblue,fontSize: 30),),

                          SizedBox(width: 5,),
                          Container(
                            width: 90,
                            height: 30,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(border: Border.all(
                                color: Kdblue,width: 2
                            )),
                            child: Padding(
                              padding:   EdgeInsets.only(left: 12),
                              child: Row(
                                children: [
                                  Text('Print PDF',style: TextStyle(fontSize: 10,color: kblue),),
                                  SizedBox(width: 4,),
                                  Image.asset('asset/dropdwn.png',height: 8,),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(

                width: 180,height: 35,
                decoration: BoxDecoration(
                  color:  bgGrey,
                  borderRadius: BorderRadius.circular(10),


                ),
                child: Center(child: Text('As of March 17,2022',style: TextStyle(color: kblue,fontSize: 15),)),
              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                Text("Assets",style: TextStyle(fontSize: 20,color: kblue),),
              ],
            ),
            Divider(thickness: 5,color: kblue,),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Current Assets",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bank & Cash",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Receivables",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Prepayments",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Non-Current Assets",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Assets",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,)
                ],
              ),
            ),

            SizedBox(height: 40,),
            Row(
              children: [
                Text("Liabilities",style: TextStyle(fontSize: 20,color: kblue),),
              ],
            ),
            Divider(thickness: 5,color: kblue,),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Current Liabilities",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payable",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Non-Payable",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Non-Current Liabilities",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),

                  Divider(thickness: 2,color: kblue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Liabilities",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,)
                ],
              ),
            ),

            SizedBox(height: 40,),
            Row(
              children: [
                Text("Equity",style: TextStyle(fontSize: 20,color: kblue),),
              ],
            ),
            Divider(thickness: 5,color: kblue,),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Unallocated Earnings",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Current Year",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Previous Year",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Retained Earnings",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 2,color: kblue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Equity",style: TextStyle(fontSize: 20,color: kblue),),
                      Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  
                  Divider(thickness: 2,color: kblue,)
                ],
              ),
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

