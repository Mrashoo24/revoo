import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Models/creatempmodel.dart';

class MyEmpController extends GetxController{
  static MyEmpController instance = Get.find();

  static var auth = FirebaseAuth.instance.currentUser!.uid!;

  FirebaseFirestore firestore = FirebaseFirestore.instance;


  Rx<CreatEmpModel> myepmlist = Rx<CreatEmpModel>(CreatEmpModel());


  @override
  void onInit() {
    myepmlist.bindStream(firestore.collection('Employee').doc(auth ?? '').snapshots().map((event) {
      CreatEmpModel myepmname =
      CreatEmpModel.fromJson(event.data()!);

      return myepmname;
    }));
  }
}



 