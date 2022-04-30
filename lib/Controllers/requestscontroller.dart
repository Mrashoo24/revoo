import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../Models/requests.dart';
// import '../Employee/Certificate/certificate.dart';


class RequestController extends GetxController{
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  Rx<List<Requestss>> req = Rx<List<Requestss>>([]);
  List<Requestss> get request => req.value;
  @override
  void onInit() {
    // TODO: implement onInit
    req.bindStream(firebase.collection('Requests') .snapshots().map((event){
      List<Requestss> request =[];
      event.docs.forEach((element){
        request.add(Requestss.fromJson(element.data()));
      });
      return request;
    }));
  }
}