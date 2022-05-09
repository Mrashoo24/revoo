import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/models/goodsissuemodel.dart';
class GoodsissueController extends GetxController{
  FirebaseFirestore firebase  = FirebaseFirestore.instance;
  Rx<List<Goodsissuemodel>> goodsissue = Rx<List<Goodsissuemodel>>([]);
  List<Goodsissuemodel> get goodsisu =>goodsissue.value;
  @override
  void onInit() {
    // TODO: implement onInit
    goodsissue.bindStream(firebase.collection('Goodsissue').snapshots().map((event) {
      List<Goodsissuemodel> goodsisu = [];
      event.docs.forEach((element) {
        goodsisu.add(Goodsissuemodel.fromJson(element.data()))    ;
      });
      return goodsisu;
    }));
  }

}