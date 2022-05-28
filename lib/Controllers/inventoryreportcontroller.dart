import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../Vendorproduct mangment/model/inventorymodel.dart';

class Inventoryreportcontroller extends GetxController{
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  Rx<List<Inventoryreportmodel>> inventoryreport = Rx<List<Inventoryreportmodel>>([]);

  List<Inventoryreportmodel> get inventory => inventoryreport.value;
  @override
  void onInit() {
    // TODO: implement onInit
    inventoryreport.bindStream(firebase.collection('Inventoryreports') .snapshots().map((event){
      List<Inventoryreportmodel> inventory =[];
      event.docs.forEach((element){
        inventory.add(Inventoryreportmodel.fromJson(element.data()));
      });
      return inventory;
    }));
  }
}