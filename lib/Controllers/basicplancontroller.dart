import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:revoo/Models/basicplan.dart';

class BasicPlanController extends GetxController {
  static BasicPlanController instance =  Get.find();


  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<BasicPlan> basicpls = Rx<BasicPlan>(BasicPlan());

  
  @override
  void onInit() {
    basicpls.bindStream(firestore.collection("Company").doc("jdeN29JAU0tlAscbbdFx")
        .collection('Plan').doc('Plan')
        .snapshots().map((event) {
        basicpls.value =BasicPlan.fromJson(event.data()!);
      return basicpls.value;
    }));
  }
}