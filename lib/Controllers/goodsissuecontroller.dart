import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Vendorproduct mangment/model/goodissuemodel.dart';

class GoodsissueController extends GetxController{
  FirebaseFirestore firebase  = FirebaseFirestore.instance;
  Rx<List<Goodsissuemodel>> goodsissue = Rx<List<Goodsissuemodel>>([]);
  List<Goodsissuemodel> get goodsisu =>goodsissue.value;


  init(bid){
    goodsissue.bindStream(firebase.collection('Goodsissue').where('bid',isEqualTo: bid).snapshots().map((event) {
      List<Goodsissuemodel> goodsisu = [];
      event.docs.forEach((element) {
        goodsisu.add(Goodsissuemodel.fromJson(element.data()))    ;
      });
      return goodsisu;
    }));
  }

}