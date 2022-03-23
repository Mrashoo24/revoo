import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/HRMS_admin_Screen/adbranchpg1.dart';
import 'package:revoo/Project_Management/projectDashboard.dart';
import 'package:revoo/Purchasing/addnwprdct.dart';
import 'package:revoo/Purchasing/purchasing_dashboard.dart';

import '../Employee/employee_homepage.dart';
import '../constants/constants.dart';


class Yourapps extends StatefulWidget {
  const Yourapps({Key? key}) : super(key: key);

  @override
  _YourappsState createState() => _YourappsState();
}

class _YourappsState extends State<Yourapps> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Image.asset('asset/bnbAdd.png'),
        ),
        bottomNavigationBar: commonWidgets.buildBNB(),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child : Image.asset('asset/logo.png',width: 250,),

                ),
                SizedBox(
                  height: 25,),
                Container(
                  child: Text("Your Apps",style: TextStyle(color: kblue ,fontSize: 25),
                  ),

                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Wrap(
                    runSpacing: 20,
                    spacing: 50,
                    children: [
                      buildAppCard('Admin','asset/prjct.png',(){
                        Get.to(DBcrud1());
                      }),
                      buildAppCard('HRMS','asset/prjct.png',(){
                        Get.to(EmployeeHomePage());
                      }),

                      buildAppCard('PROJECT MANAGEMENT','asset/calculator.png',(){
                        Get.to(ProjectHomePage());
                      }),

                      buildAppCard('PURCHASE & OPERATIONS','asset/inventory.png',(){
                        Get.to(PurchasingDashboard());
                      }),

                      buildAppCard('POS','asset/money.png',(){



                      }),
                      buildAppCard('SALES','asset/increaseaaa.png',(){



                      }),
                    ],
                  ),
                )

              ],
            ),

          ),
        ),
      ),
    );
  }

  Column buildAppCard(String title,String img,function) {
    return Column(
      children: [
        InkWell(
          onTap: function,
          child: Card(

              color: Kdblue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Center(child: ClipRRect(child: Image.asset(img,color: Colors.white,),)),
              )
          ),
        ),
        Container(width:100,child: Center(child: AutoSizeText(title,style: TextStyle(color: kyellow ,fontSize: 14),textAlign: TextAlign.center,))),
      ],
    );
  }
}
