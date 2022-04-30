// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
//
// import '../HRMS_admin_Screen/adbranchpg1.dart';
// import '../HRMS_admin_Screen/adbranchpg2.dart';
// import '../Login/login.dart';
// import '../Login/yourapps.dart';
//
// class BRAuthController extends GetxController{
//   //AuthController.instance
//   static BRAuthController instance =  Get.find();
//   //email,password,name

//   late Rx<User?> _user;
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   @override
//   void onReady() {
//     super.onReady();
//     _user = Rx<User?>(auth.currentUser);
//     //our user would be notified
//     _user.bindStream(auth.userChanges());
//     ever(_user, _initialScreen);
//   }
//   _initialScreen(User? user){
//     if(user==null){
//       print("Login Page");
//       Get.offAll(()=>DBcrud1());
//     }else{
//       Get.offAll(()=>AddBranches());
//     }
//   }
//
//
//   void register (String email, password, location)async {
//     try{
//       await auth.createUserWithEmailAndPassword(email: email, password: password);
//     }catch(e){
//       Get.snackbar("About User", "User Message",
//         backgroundColor: Colors.grey,
//         snackPosition: SnackPosition.BOTTOM,
//         titleText: Text("Account Creation Failed"),
//         messageText: Text(e.toString(),style: TextStyle(color: Colors.grey),
//         ),
//       );
//     }
//   }
//   void login (String email, password)async {
//     try{
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//     }catch(e){
//       Get.snackbar("About Login", "Login Message",
//         backgroundColor: Colors.grey,
//         snackPosition: SnackPosition.BOTTOM,
//         titleText: Text("Login Failed"),
//         messageText: Text(e.toString(),style: TextStyle(color: Colors.grey),
//         ),
//       );
//     }
//   }
//   void logout () async{
//     await auth.signOut();
//   }
// }