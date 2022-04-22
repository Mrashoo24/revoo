import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:revoo/Controllers/dailyUpdates.dart';
import 'package:revoo/constants/constants.dart';

import '../home/homepage.dart';

class AllEmployeeUpdates extends StatefulWidget {
  const AllEmployeeUpdates({Key? key}) : super(key: key);

  @override
  _AllEmployeeUpdatesState createState() => _AllEmployeeUpdatesState();
}

class _AllEmployeeUpdatesState extends State<AllEmployeeUpdates> {
  var selectedValue = 0;




  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebase = FirebaseFirestore.instance;

    return Container(
      child: SingleChildScrollView(
        child: GetX(
          init: Get.put<UpdatesController >(UpdatesController()),
          builder: (UpdatesController updateController){

            if(updateController.dailyupdate.value.isEmpty){
              return Text("No data");
            }
            return Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Daily Updates',
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
                        InkWell(
                          onTap: (){
                            Get.to(HomePageMain());
                          },
                          child: Card(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Container(
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
                                child: Text('Your\nLogin',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                              ),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [Kdblue,bluess]),
                                  borderRadius: BorderRadius.circular(10)
                              ),

                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount:updateController.dailyupdate.value.length,

                  shrinkWrap: true,
                  itemBuilder:(context,index){
                return Container(
                color: bgGrey,
                child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(
                updateController.dailyupdate.value[index].name! + updateController.dailyupdate.value[index].designation!,
                style: TextStyle(color: kblue, fontSize: 12),
                ),
                Text(
                updateController.dailyupdate.value[index].date!,
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
                Row(
                children: [
                Icon(
                Icons.check_box,
                color: kblue,
                ),
                Text(
                updateController.dailyupdate.value[index].update!,
                style: TextStyle(color: kblue, fontSize: 12),
                ),
                ],

                ),

                ],
                ),
                )
                ],
                ),
                ),
                );
                }
                )
              ],
            );
          },
        )
      ),
    );
  }
}
