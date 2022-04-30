import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/leavemodel.dart';


class LeaveController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<List<LeaveDisplay>> LeaveList = Rx<List<LeaveDisplay>>([]);

  List<LeaveDisplay> get LeaveName => LeaveList.value;

  @override
  void onInit() {
    LeaveList.bindStream(firestore.collection('Leaves').snapshots().map((event) {

      List<LeaveDisplay> LeaveName = [];

      event.docs.forEach((element) {
        LeaveName.add(LeaveDisplay.fromJson(element.data()));
      });
      return LeaveName;
    }));
  }
}