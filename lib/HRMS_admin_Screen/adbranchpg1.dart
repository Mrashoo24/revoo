import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/HRMS_admin_Screen/adbranchpg2.dart';

import '../constants/constants.dart';
import '../home/homepage.dart';

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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Image.asset('asset/bnbAdd.png'),
        ),
        body: Container(

          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('asset/dpbrCRUD.png'))
          ),
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Align(alignment:Alignment.topCenter,child: Text('Create Branch',style: TextStyle(color:kblue,fontSize: 30),)),

                 Divider(
                   height: 10,
                   thickness: 4,color:Kdblue,endIndent: 90, indent: 90,
                 ),
                 Center(
                   child: Column(
                     children: [
                       Padding(

                         padding:  EdgeInsets.only(top: 40.0,left: 40,right: 40),
                         child: Card(
                           color: Colors.grey.shade200,
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(35)
                           ),
                           child: Padding(
                             padding:   EdgeInsets.only(right: 40,left: 40,top: 30,bottom: 30),
                             child: InkWell(
                               onTap: (){
                                 Get.to(AddBranches());
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
                       SizedBox(height: 20),
                       // GestureDetector(
                       //     onTap: (){
                       //       Get.to(HomePageMain(userDoc: widget.,));
                       //     },
                       //     child: Text("Already created branch?",style: TextStyle(color: Colors.yellow.shade700,fontSize: 15),))
                     ],
                   ),
                 ),
                 SizedBox(height: 10,),


                 Text ('Create your first branch to add your\nemployees and staff, assign\nroles and communicate between\ndepartments',style: TextStyle(color: Colors.grey,fontSize: 20),),
                 SizedBox(height: 15,),
               ],
             ),
        ),
        bottomNavigationBar: commonWidgets.buildBNB(),

      ),
    );
  }
}



