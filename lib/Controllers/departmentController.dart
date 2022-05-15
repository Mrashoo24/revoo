import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:revoo/models/branchModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<List<BranchModel>> branchList = Rx<List<BranchModel>>([]);
  Rx<String>branchId =Rx<String>('');




  @override
  void onInit()
  {
    print('bid' + branchId.value);
    branchList.bindStream(firestore.collection('Company').doc('tJSho8ikxpECfdJxYF7j').collection('Branch').where('bid' ,isEqualTo: branchId.value).snapshots().map((event) {
      List<BranchModel> branchName = [];

      event.docs.forEach((element) {
        branchName.add(BranchModel.fromJson(element.data()));
      });
      return branchName;
    }));
    super.onInit();
  }
}

