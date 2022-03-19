import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/HRMS_admin_Screen/adbranchpg2.dart';

import '../constants/constants.dart';
import 'adbranchpg2.dart';

class DBcrud1 extends StatefulWidget {
  const DBcrud1({Key? key}) : super(key: key);

  @override
  _DBcrudState createState() => _DBcrudState();
}

class _DBcrudState extends State<DBcrud1> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(

          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('asset/dpbrCRUD.png'))
          ),
          child: Column(

            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Create Branch',style: TextStyle(color:kblue,fontSize: 30),),

                  Divider(
                    height: 10,
                    thickness: 4,color:Kdblue,endIndent: 90, indent: 90,
                  ),
                  Center(
                    child: Padding(

                      padding:  EdgeInsets.all(40.0),
                      child: Card(
                        color: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)
                        ),
                        child: Padding(
                          padding:   EdgeInsets.only(right: 40,left: 40,top: 30,bottom: 30),
                          child: InkWell(
                            onTap: (){
                              Get.to(DBcrud2());
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                ClipRect(child: Image.asset('asset/adbrmidimage.png',width: 60,)),

                                Text('Create',style: TextStyle(color: kblue,fontSize: 30),),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text ('Create your first branch to add your\nemployees and staff, assign\nroles and communicate between\ndepartments',style: TextStyle(color: Colors.grey,fontSize: 20),),
                  SizedBox(height: 15,),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(

          height: 100,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(

                  child: Stack(
                    children: [
                      Align(
                        child: Container(
                          height: Get.height*0.08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                            color: Kdblue,

                          ),
                          child: Align(
                            alignment: Alignment.center,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ClipRect(child: Image.asset('asset/share.png')),
                                ClipRect(child: Image.asset('asset/homedash.png')),
                                Opacity(
                                    opacity: 0.01,
                                    child: ClipRect(child: Image.asset('asset/share.png'))
                                ),
                                ClipRect(child: Image.asset('asset/groupdash.png')),
                                ClipRect(child: Image.asset('asset/pathdash.png')),

                              ],
                            ),
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),

                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset('asset/bnbAdd.png'),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}



