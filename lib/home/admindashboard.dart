import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/constants/constants.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key key= const Key('AdminDashboard')}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Image.asset('asset/navicon.png'),
        ),
        actions: [
              Image.asset('asset/bellicon.png'),
          Image.asset('asset/settingsicon.png'),
          Image.asset('asset/usericon.png'),
          SizedBox(width: 12,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: Get.width,
                  child: ClipRect(
                    child: Image.asset(
                    'asset/dcbg.png',fit: BoxFit.fill,),
                  ),

                ),

                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text('Daily Check-in, February 07, 12',style: TextStyle(color: ktextcolor,fontSize: 18),),
                      Padding(
                        padding:  EdgeInsets.only(left: Get.width*0.1,right: Get.width*0.1),
                        child: Divider(color: ktextcolor,),
                      ),

                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:   EdgeInsets.only(left:Get.width*0.125),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('In-Time',style: TextStyle(color: ktextcolor,fontSize: 18),),
                                  SizedBox(width: 15),
                                  Container(
                                    height: Get.height*0.05,
                                    width: Get.width*0.09,
                                    color: Colors.grey.shade400,
                                    child: Center(child: Text('08',style: TextStyle(color: kblue,fontSize: 18),)),
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                    height: Get.height*0.05,
                                    width: Get.width*0.09,
                                    color: Colors.grey.shade400,
                                    child: Center(child: Text('20',style: TextStyle(color: kblue,fontSize: 18),)),
                                  ),

                                  SizedBox(width: 15),
                                  Container(
                                    height: Get.height*0.05,
                                    width: Get.width*0.18,
                                    color: Colors.grey.shade400,
                                    child: Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('AM',style: TextStyle(color: kblue,fontSize: 18),),
                                          SizedBox(width: 10,),
                                          Image.asset('asset/smallarrowdown.png'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  Image.asset('asset/pencilicon.png'),
                                ],





                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding:   EdgeInsets.only(left:Get.width*0.09),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Out Time',style: TextStyle(color: ktextcolor,fontSize: 18),),
                              SizedBox(width: 15),
                              Container(
                                height: Get.height*0.05,
                                width: Get.width*0.09,
                                color: Colors.grey.shade400,
                                child: Center(child: Text('--',style: TextStyle(color: kblue,fontSize: 18),)),
                              ),
                              SizedBox(width: 15),
                              Container(
                                height: Get.height*0.05,
                                width: Get.width*0.09,
                                color: Colors.grey.shade400,
                                child: Center(child: Text('--',style: TextStyle(color: kblue,fontSize: 18),)),
                              ),

                              SizedBox(width: 15),
                              Container(
                                height: Get.height*0.05,
                                width: Get.width*0.18,
                                color: Colors.grey.shade400,
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('--',style: TextStyle(color: kblue,fontSize: 18),),
                                      SizedBox(width: 10,),
                                      Image.asset('asset/smallarrowdown.png'),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 16,),
                              Image.asset('asset/pencilicon.png'),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text ('Total hours:',style: TextStyle(color: ktextcolor,fontSize: 18),),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: Get.height*0.05,
                            width: Get.width*0.20,
                            color: Colors.grey.shade400,
                            child: Center(child: Text('05: 00',style: TextStyle(color: kblue,fontSize: 18),)),

                          ),
                          Center(child: Text(' hrs.',style: TextStyle(color: Colors.white,fontSize: 18),)),


                          SizedBox(width: 12,),
                          Image.asset('asset/dc hrs icon.png')

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(onPressed: (){

                            },

                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape:RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                    side: BorderSide(width: 3.0, color: Colors.white,),
                                    primary: Kdblue,
                                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 11),
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                child: Center(child: Text('Check-in',style: TextStyle(
                                    color: Colors.white,fontSize: 15
                                ),))),
                            SizedBox(width: 25,),
                            ElevatedButton(onPressed: (){},

                                style: ElevatedButton.styleFrom(
                                    shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    primary: Colors.white,
                                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 11),
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                child: Center(child: Text('Check-out',style: TextStyle(
                                    color: Colors.blueAccent,fontSize: 15

                                ),)))




                          ],



                        ),

                      ),

                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0,right: 25.0),
                            child: Card(
                              elevation: 5,
                              color: Colors.grey.shade200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50.0,left: 8,right: 8),
                                    child: Text('You have 2 new request/approvals from the finance department,HR department,and the accounting department ',
                                      style: TextStyle(
                                          color: kblue
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0,left: 8,right: 0),
                                        child: Text('Click here to',
                                          style: TextStyle(
                                              color: kblue,
                                            fontSize: 16
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0,right: 2),
                                        child: Text(' View Now!',
                                          style: TextStyle(
                                              color: kyellow,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),

                                    ],
                                  ),
                                  Image.asset('asset/rightarrow.png',width: 30,),
                                  SizedBox(height: 20,),

                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                margin: EdgeInsets.only(right: 25),
                                child: Image.asset('asset/wrongyellow.png',width: 30,height: 30,)),
                          )
                        ],
                      ),





                    ],


                  ),





                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}
