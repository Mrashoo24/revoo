import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:revoo/Controllers/departmentController.dart';
import 'package:revoo/models/branchModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BranchController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
Rx<List<BranchModel>> branchList = Rx<List<BranchModel>>([]);
 DepartmentController departmentController = DepartmentController();


@override
  void onInit() {
  branchList.bindStream(firestore.collection('Branch').where('cid',isEqualTo: "jdeN29JAU0tlAscbbdFx" ).snapshots().map((event) {
    List<BranchModel> branchName = [];

    event.docs.forEach((element) {
      branchName.add(BranchModel.fromJson(element.data()));
    });



    return branchName;
  }));
  super.onInit();
  }
}

