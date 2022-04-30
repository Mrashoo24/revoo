
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/YourLeaveReqModel.dart';
import '../model/hrmsleavereq.dart';

class YourLeaveReqController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<List<HrmsLeaveDate>> LeaveList = Rx<List<HrmsLeaveDate>>([]);

  // List<YourLeaveReq> get reqleaveforhrms => HrmsLeaveDate.value;

  @override
  void onInit() {
    LeaveList.bindStream(firestore.collection('leave req date').snapshots().map((event) {

      List<HrmsLeaveDate> LeaveName = [];

      event.docs.forEach((element) {
        LeaveName.add(HrmsLeaveDate.fromJson(element.data()));
      });
      return LeaveName;
    }));
  }
}

