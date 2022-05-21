import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:revoo/First/welcomscreen.dart';

import '../APPS/selectplans.dart';
import '../Login/login.dart';
import '../Login/yourapps.dart';
import '../constants/constants.dart';

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
    // Get.offAll(SelectPlans(cdetails: {
    //   'cname': '0',
    //   'name' :'k',
    //   'email' : 'emailController.text',
    //   'apps' : ''
    // }));
  }

  void register (String email, password)async {
    try{
     await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About User", "User Message",
      backgroundColor: Colors.grey,
      snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Account Creation Failed"),
        messageText: Text(e.toString(),style: TextStyle(color: Colors.grey),),
      );
    }
  }
  void login (String email, password)async {
    try{

      await auth.signInWithEmailAndPassword(email: email, password: password);

    } on FirebaseAuthException catch(e){
      Get.snackbar("About Login", "Login Message",
        backgroundColor: kblue.withOpacity(0.4),
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(e.message.toString().replaceAll('[firebase_auth/user-not-found] ','')),

      );
    }
  }
  void logout () async{
   await auth.signOut();
  }
}