import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:revoo/models/departmentModel.dart';

class DepartmentControllerTable extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<List<DepartmentModel>> departmentList = Rx<List<DepartmentModel>>([]);
  Rx<String> bid = Rx<String>('');

  @override
  void onInit() {

    departmentList.bindStream(firestore.collection('Department').where('bid',isEqualTo: bid.value).snapshots().map((event)
    {
      List<DepartmentModel> departmentName = [];

      event.docs.forEach((element) {
        departmentName.add(DepartmentModel.fromJson(element.data()));
      });
      return departmentName;
    }
    ));
    super.onInit();
  }

}