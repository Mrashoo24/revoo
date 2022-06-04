import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:revoo/model/orderModel.dart';
import '../Vendorproduct mangment/model/inventorymodel.dart';

class OrdersController extends GetxController{
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  Rx<List<OrderModel>> orderRxList = Rx<List<OrderModel>>([]);

  List<OrderModel> get ordersList => orderRxList.value;
  @override
  void onInit() {
    // TODO: implement onInit
    orderRxList.bindStream(firebase.collection('Orders') .snapshots().map((event){
      List<OrderModel> inventory =[];
      event.docs.forEach((element){
        inventory.add(OrderModel().fromJson(element.data()));
      });
      return inventory;
    }));
  }
}