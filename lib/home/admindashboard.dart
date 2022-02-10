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
                      Text('Daily Check-in, February 07, 12',style: TextStyle(color: ktextcolor,fontSize: 18),),
                      Padding(
                        padding:  EdgeInsets.only(left: Get.width*0.1,right: Get.width*0.1),
                        child: Divider(color: ktextcolor,),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('In-Time',style: TextStyle(color: ktextcolor,fontSize: 18),),
                          SizedBox(width: 15),
                          Container(
                            color: Colors.grey.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('08',style: TextStyle(color: kblue,fontSize: 18),),
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            color: Colors.grey.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('20',style: TextStyle(color: kblue,fontSize: 18),),
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            color: Colors.grey.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('AM',style: TextStyle(color: kblue,fontSize: 18),),
                                  SizedBox(width: 10,),
                                  Image.asset('asset/smallarrowdown.png'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Image.asset('asset/pencilicon.png')
                        ],
                      )

                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
