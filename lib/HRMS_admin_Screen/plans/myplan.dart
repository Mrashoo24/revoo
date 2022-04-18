import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/Controllers/basicplancontroller.dart';

import '../../constants/constants.dart';
import '../../home/homepage.dart';

class MyPlan extends StatefulWidget {
  const MyPlan({Key? key}) : super(key: key);

  @override
  _MyPlanState createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  TextEditingController datebt = TextEditingController();
  TextEditingController datexp = TextEditingController();
  TextEditingController nextpmnt = TextEditingController();
  TextEditingController appsincld = TextEditingController();
  TextEditingController nofemploye = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var firestore =  FirebaseFirestore.instance;
    return SingleChildScrollView(
      child: GetX(
        init: Get.put<BasicPlanController>(BasicPlanController()),
        builder: (BasicPlanController controller) {

              print('text = ${controller.basicpls.value.name}');

            if(controller.basicpls.value.name == null){
              return Center(child: CircularProgressIndicator(color: kblue,),);

            }

          return Column(
            children: [
            Text(controller.basicpls.value.name!,style: TextStyle(fontSize: 30,color: Colors.grey),),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date Bought"),
                    Divider(thickness: 2,height: 10,color: Colors.black,),
                    TextFormField(
                      enabled: false,
                      controller: datebt,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: bgGrey,
                          contentPadding:
                          EdgeInsets.only(left: 20, top: 25, bottom: 25),
                          hintText: controller.basicpls.value.dateBought,
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date Expire"),
                    Divider(thickness: 2,height: 10,color: Colors.black,),
                    TextFormField(
                      enabled: false,
                      controller: datexp,

                      decoration: InputDecoration(
                          filled: true,
                          fillColor: bgGrey,
                          contentPadding:
                          EdgeInsets.only(left: 20, top: 25, bottom: 25),
                          hintText: controller.basicpls.value.dateExpire,
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Next Payment"),
                    Divider(thickness: 2,height: 10,color: Colors.black,),
                    TextFormField(
                      enabled: false,
                      controller: nextpmnt,

                      decoration: InputDecoration(
                          filled: true,
                          fillColor: bgGrey,
                          contentPadding:
                          EdgeInsets.only(left: 20, top: 25, bottom: 25),
                          hintText: controller.basicpls.value.nextPayment,
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Apps Included"),
                    Divider(thickness: 2,height: 10,color: Colors.black,),
                    TextFormField(
                      enabled: false,
                      controller: appsincld,

                      decoration: InputDecoration(
                          filled: true,
                          fillColor: bgGrey,
                          contentPadding:
                          EdgeInsets.only(left: 20, top: 25, bottom: 25),
                          hintText: controller.basicpls.value.appsIcluded,
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),

                  ],
                ),
              ),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("No. of Employee"),
                        Divider(thickness: 2,height: 10,color: Colors.black,),
                        TextFormField(
                          enabled: false,
                          controller: nofemploye,

                          decoration: InputDecoration(
                              filled: true,
                              fillColor: bgGrey,
                              contentPadding:
                              EdgeInsets.only(left: 20, top: 25, bottom: 25),
                              hintText:controller.basicpls.value.noOfEmp,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),

                      ],
                    ),
                  ),
                ],
              ),

            ],
          );
        }
      ),
    );
  }
}
