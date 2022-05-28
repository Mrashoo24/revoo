import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../model/componentmodule.dart';

class Componentcontroller extends GetxController {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  Rx<List<Componentmodule>> component1 = Rx<List<Componentmodule>>([]);

  List<Componentmodule> get component2 => component1.value;
  @override
  void onInit() {
    // TODO: implement onInit
    component1.bindStream(
        firebase.collection('Inventoryreports').snapshots().map((event) {
      List<Componentmodule> inventory = [];
      event.docs.forEach((element) {
        inventory.add(Componentmodule.fromJson(element.data()));
      });
      return component2;
    }));
  }
}
