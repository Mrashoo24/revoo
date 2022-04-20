import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Models/creatempmodel.dart';

class MyEmpController extends GetxController{
  static MyEmpController instance = Get.find();

  FirebaseFirestore firestore = FirebaseFirestore.instance;


  Rx<List<CreatEmpModel>> myepmlist = Rx<List<CreatEmpModel>>([]);

  List<CreatEmpModel> get myepmname => myepmlist.value;

  @override
  void onInit() {
    myepmlist.bindStream(firestore.collection('Company').doc('').collection('Branch').snapshots().map((event) {
      List<CreatEmpModel> myepmname = [];

      event.docs.forEach((element) {
        myepmname.add(CreatEmpModel.fromJson(element.data()));
      });
      return myepmname;
    }));
  }
}



 