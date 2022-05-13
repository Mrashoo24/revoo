
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/YourLeaveReqModel.dart';

class YourLeaveReqController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<List<YourLeaveReq>> LeaveList = Rx<List<YourLeaveReq>>([]);

  List<YourLeaveReq> get LeaveName => LeaveList.value;

  @override
  void onInit() {

    LeaveList.bindStream(firestore.collection('Leaves').snapshots().map((event) {

      List<YourLeaveReq> LeaveName = [];

      event.docs.forEach((element) {
        LeaveName.add(YourLeaveReq.fromJson(element.data()));
      });
      return LeaveName;
    }));
  }
}