import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/model/productmodel.dart';

import '../Vendorproduct mangment/model/goodissuemodel.dart';

class ProductController extends GetxController{
  FirebaseFirestore firebase  = FirebaseFirestore.instance;
  Rx<List<ProductModel>> productListRx = Rx<List<ProductModel>>([]);
  List<ProductModel> get productList =>productListRx.value;
  Rx<bool> loading = false.obs;

  init(bid){
    loading(false);
    productListRx.bindStream(firebase.collection('Products').snapshots().map((event) {
      List<ProductModel> goodsisu = [];
      event.docs.forEach((element) {
        goodsisu.add(ProductModel().fromJson(element.data()))    ;
      });
      loading(true);
      return goodsisu;
    }));
  }

}