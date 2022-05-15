import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constants/constants.dart';

class BudgetMgmt extends StatefulWidget {
  const BudgetMgmt({Key? key}) : super(key: key);

  @override
  _BudgetMgmtState createState() => _BudgetMgmtState();
}

class _BudgetMgmtState extends State<BudgetMgmt> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text("Budget Management",style: TextStyle(color: kblue,fontSize: 30),)),
            ),

            Card(

              color: Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Padding(
                padding:   EdgeInsets.symmetric(horizontal: 8.0,vertical: Get.height*0.05),
                child: Column(
                  children: [
                    SizedBox(height: 12,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [

                            Text("Sales Made",
                              style: TextStyle(
                                  color: Kdblue,fontSize: 18
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        LinearPercentIndicator(
                          // width: MediaQuery.of(context).size.width*0.4,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2500,
                          percent: 0.8,
                          // center: Text("\₹ ${widget.urgentcase.raised}",style: TextStyle(color: kwhite,letterSpacing: 2),),
                          linearStrokeCap: LinearStrokeCap.roundAll ,

                          linearGradient: LinearGradient(
                              colors: [
                                Kdblue,
                                Kdblue
                              ]
                          ),
                        ),
                      ],
                    ),


                    SizedBox(height: Get.height*0.02,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [

                            Text("Income Generated",
                              style: TextStyle(
                                  color: Kdblue,fontSize: 18
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        LinearPercentIndicator(
                          // width: MediaQuery.of(context).size.width*0.4,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2500,
                          percent: 0.6,
                          // center: Text("\₹ ${widget.urgentcase.raised}",style: TextStyle(color: kwhite,letterSpacing: 2),),
                          linearStrokeCap: LinearStrokeCap.roundAll ,

                          linearGradient: LinearGradient(
                              colors: [
                                Kdblue,
                                Kdblue
                              ]
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height*0.02,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [

                            Text("Bills Due",
                              style: TextStyle(
                                  color: Kdblue,fontSize: 18
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        LinearPercentIndicator(
                          // width: MediaQuery.of(context).size.width*0.4,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2500,
                          percent: 0.4,
                          // center: Text("\₹ ${widget.urgentcase.raised}",style: TextStyle(color: kwhite,letterSpacing: 2),),
                          linearStrokeCap: LinearStrokeCap.roundAll ,

                          linearGradient: LinearGradient(
                              colors: [
                                Kdblue,
                                Kdblue
                              ]
                          ),
                        ),
                      ],
                    ),






                  ],
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }
}
