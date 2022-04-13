import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Login/login.dart';
import '../Login/yourapps.dart';

class AuthController extends GetxController{
  //AuthController.instance
  static AuthController instance =  Get.find();
  //email,password,name
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }
  _initialScreen(User? user){
    if(user==null){
      print("Login Page");
      Get.offAll(()=>LoginScreen());
    }else{
      Get.offAll(()=>Yourapps());
    }
  }


}