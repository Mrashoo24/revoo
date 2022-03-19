import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../home/homepage.dart';

class AcceptLeave extends StatefulWidget {
  const AcceptLeave({Key? key}) : super(key: key);

  @override
  _AcceptLeaveState createState() => _AcceptLeaveState();
}

class _AcceptLeaveState extends State<AcceptLeave> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    'Leave Requests',
                    style: TextStyle(color: kblue, fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      '<Feb 07, 22>',
                      style: TextStyle(color: kblue, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(

              shrinkWrap: true,
              children: [
                Container(
                  color: bgGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Arsalan Khan, ' + 'IT',
                              style: TextStyle(color: kblue, fontSize: 12),
                            ),
                            Text(
                              '2022-03-19',
                              style: TextStyle(color: kblue, fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: Get.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dear HR,\n I need holiday for tomorrow',
                                style: TextStyle(color: kblue, fontSize: 12),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap:(){

                        },
                                      child: Padding(
                                        padding: const EdgeInsets.all(30.0),
                                        child: Container(
                                          child: Center(child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                                            child: Text('Deny',style: TextStyle(color: Kdblue),),
                                          )),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Kdblue,width: 3)
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){

                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(30.0),
                                        child: Container(
                                          child: Center(child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                                            child: Text('Accept',style: TextStyle(color: Colors.white),),
                                          )),
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                Kdblue,
                                                bluess
                                              ]),
                                              borderRadius: BorderRadius.circular(10),
                                              // border: Border.all(color: Kdblue,width: 3)
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: bgGrey,
                    boxShadow: [BoxShadow(color: Colors.green,offset: Offset(0, 1),blurRadius: 10),]
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Arsalan Khan, ' + 'IT',
                              style: TextStyle(color: kblue, fontSize: 12),
                            ),
                            Text(
                              '2022-03-19',
                              style: TextStyle(color: kblue, fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: Get.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dear HR,\n I need holiday for tomorrow',
                                style: TextStyle(color: kblue, fontSize: 12),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text('Approved',style: TextStyle(color: Colors.green),),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: bgGrey,
                      boxShadow: [BoxShadow(color: Colors.red,offset: Offset(0, 1),blurRadius: 10),]
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Arsalan Khan, ' + 'IT',
                              style: TextStyle(color: kblue, fontSize: 12),
                            ),
                            Text(
                              '2022-03-19',
                              style: TextStyle(color: kblue, fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: Get.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dear HR,\n I need holiday for tomorrow',
                                style: TextStyle(color: kblue, fontSize: 12),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text('Rejected',style: TextStyle(color: Colors.red),),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
