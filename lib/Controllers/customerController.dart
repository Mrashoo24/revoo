import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/model/CustomerModel.dart';
import 'package:revoo/model/productmodel.dart';

import '../Vendorproduct mangment/model/goodissuemodel.dart';

class CustomerController extends GetxController{
  FirebaseFirestore firebase  = FirebaseFirestore.instance;
  Rx<List<CustomerModel>> customerListRx = Rx<List<CustomerModel>>([]);
  List<CustomerModel> get customerList =>customerListRx.value;
  Rx<bool> loading = false.obs;

  init(bid){
    loading(false);
    customerListRx.bindStream(firebase.collection('Customers').where('bid',isEqualTo: bid).snapshots().map((event) {
      List<CustomerModel> goodsisu = [];
      event.docs.forEach((element) {
        goodsisu.add(CustomerModel().fromJson(element.data()))    ;
      });
      loading(true);
      return goodsisu;
    }));
  }

}