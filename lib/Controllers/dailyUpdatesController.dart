// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import '../models/dailyUpdateModel.dart';
class UpdatesController extends GetxController{
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  Rx<List<DailyUpdates>> dailyupdate = Rx<List<DailyUpdates>>([]);
  List<DailyUpdates> get dUpdate => dailyupdate.value;

  @override
  void onInit() {
    // TODO: implement onInit
    dailyupdate.bindStream(firebase.collection('Updates') .snapshots().map((event){
      List<DailyUpdates> dUpdate =[];
      event.docs.forEach((element){
        dUpdate.add(DailyUpdates.fromJson(element.data()));
      });
      return dUpdate;
    }));
  }
}