import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constants/constants.dart';

class Accountinga extends StatefulWidget {
  const Accountinga({Key? key}) : super(key: key);

  @override
  _AccountingaState createState() => _AccountingaState();
}

class _AccountingaState extends State<Accountinga> {




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,

          padding: EdgeInsets.only(left: 10, right: 10),

          child: ListView(
            children: [
              Center(
                child: Text(
                  'Accounting',
                  style: TextStyle(
                    fontSize: 30,
                    color: kblue,
                  ),
                ),
              ),

              SizedBox(height: 5),
              Container(
                height: 120,
                width: Get.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _dailCard('Customer Invoices', 20),
                    _dailCard('Vendor\nBills', 5),
                    _dailCard('Bank\nAdded', 25),
                  ],
                ),
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
                      Row(
                        children: [
                          Text("Invoices",
                            style: TextStyle(
                                color: kblue,fontSize: 25
                            ),
                            textAlign: TextAlign.center,
                          ),
SizedBox(width: 120,),
                          Text("Past Month",
                            style: TextStyle(
                                color: kblue,fontSize: 25
                            ),
                            textAlign: TextAlign.center,
                          ),Icon(Icons.arrow_drop_down),


                        ],
                      ),
                      SizedBox(height: Get.height*0.06,),
                      SizedBox(height: 12,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text("Rs 1525",
                                    style: TextStyle(
                                        color: kblue,fontSize: 18
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text("Overdue",
                                    style: TextStyle(
                                        color: kyellow,fontSize: 18
                                    ),
                                    textAlign: TextAlign.left,
                                  ),

                                ],
                              ),

                              SizedBox(width: 200,),
                              Column(
                                children: [
                                  Text("Rs 1525",
                                    style: TextStyle(
                                        color: kblue,fontSize: 18
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text("Not Overdue",
                                    style: TextStyle(
                                        color: kyellow,fontSize: 18
                                    ),
                                    textAlign: TextAlign.left,
                                  ),

                                ],
                              ),
                            ],
                          ), LinearPercentIndicator(
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
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text("Rs 1525",
                                    style: TextStyle(
                                        color: kblue,fontSize: 18
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text("Deposited",
                                    style: TextStyle(
                                        color: kyellow,fontSize: 18
                                    ),
                                    textAlign: TextAlign.left,
                                  ),

                                ],
                              ),

                              SizedBox(width: 160,),
                              Column(
                                children: [
                                  Text("Rs 1525",
                                    style: TextStyle(
                                        color: kblue,fontSize: 18
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text("Not Deposited",
                                    style: TextStyle(
                                        color: kyellow,fontSize: 18
                                    ),
                                    textAlign: TextAlign.left,
                                  ),

                                ],
                              ),
                            ],
                          ), LinearPercentIndicator(
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






                    ],
                  ),
                ),
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
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Expenses",
                                style: TextStyle(
                                    color: kblue,fontSize: 25
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text("\$ 6952",
                                style: TextStyle(
                                    color: kyellow,fontSize: 18
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(width: 100,),
                          Text("Past Month",
                            style: TextStyle(
                                color: kblue,fontSize: 20
                            ),
                            textAlign: TextAlign.center,
                          ),Icon(Icons.arrow_drop_down),


                        ],
                      ),







                    ],
                  ),
                ),
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
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Profit & Losses",
                                style: TextStyle(
                                    color: kblue,fontSize: 25
                                ),
                                textAlign: TextAlign.center,
                              ),

                            ],
                          ),
                          SizedBox(width: 40,),
                          Text("Past Month",
                            style: TextStyle(
                                color: kblue,fontSize: 20
                            ),
                            textAlign: TextAlign.center,
                          ),Icon(Icons.arrow_drop_down),


                        ],
                      ),







                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }


}
Widget _bottomNevigationBar() {
  return Container(
    height: 50,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: Get.height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Kdblue,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRect(
                              child: Image.asset('asset/twopeopleicon.png')),
                          ClipRect(child: Image.asset('asset/homeicon.png')),
                          Opacity(
                              opacity: 0.01,
                              child: ClipRect(
                                  child:
                                  Image.asset('asset/twopeopleicon.png'))),
                          ClipRect(child: Image.asset('asset/GroupShare.png')),
                          ClipRect(child: Image.asset('asset/mssage.png')),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Padding(
        //     padding: const EdgeInsets.only(bottom: 20.0),
        //     child: Stack(
        //       alignment: Alignment.center,
        //       children: [
        //         ImageIcon(
        //           AssetImage('asset/addiconforbnb.png'),
        //           size: 1000,
        //           color: Colors.grey,
        //         ),
        //         ImageIcon(
        //           AssetImage('asset/addsymbolforbnb.png'),
        //           color: Color(0xff1B57A7),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    ),
  );
}

Widget _dailCard(name, number) {
  return Container(
    width: 120,
    height: 80,
    margin: EdgeInsets.only(left: 15),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('asset/cardbvvvg.png'),
      ),
    ),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$name',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                'asset/EllipseforuserTeams.png',
                fit: BoxFit.fitWidth,
              ),
              Image.asset('asset/EllipsesmallForuserTeams.png'),
              Text('$number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    ),
  );
}