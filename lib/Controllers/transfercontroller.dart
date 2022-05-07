import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:revoo/Models/transfer.dart';

class TransferController extends GetxController{
  static TransferController instance = Get.find();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<List<TransferModel>> transferlist =  Rx<List<TransferModel>>([]);


  @override
  void onInit(){

  }
}