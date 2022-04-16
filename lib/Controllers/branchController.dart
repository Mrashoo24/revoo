import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:revoo/Controllers/departmentController.dart';
import 'package:revoo/models/branchModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BranchController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
Rx<List<BranchModel>> branchList = Rx<List<BranchModel>>([]);
 DepartmentController departmentController = Get.find<DepartmentController>();

@override
  void onInit() {
  branchList.bindStream(firestore.collection('Company').doc('tJSho8ikxpECfdJxYF7j').collection('Branch').snapshots().map((event) {
    List<BranchModel> branchName = [];

    event.docs.forEach((element) {
      branchName.add(BranchModel.fromJson(element.data()));
    });



    return branchName;
  }));
  super.onInit();
  }
}

