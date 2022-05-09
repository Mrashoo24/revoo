// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:revoo/models/branchModel.dart';
// import 'package:revoo/models/serial_number_model.dart';
//
// class SerialNumberController extends GetxController{
//  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
//  Rx<List<SerialModel>> serialNumberList = Rx<List<SerialModel>>([]);
//
//  @override
//   void onInit() {
//     serialNumberList.bindStream(fireStore.collection('Inventory').doc('Zfm6VjimQ1BCDroRad2L').collection('Serial_number_management').
//     where('cid' ,isEqualTo: 'jdeN29JAU0tlAscbbdFx').snapshots().map((event) => {
//       List<SerialModel> serialNumber = [];
//       event.
//     }));
//     super.onInit();
//   }
// }