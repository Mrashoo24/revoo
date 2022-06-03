import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
class FirebaseApi{
  static Future<String?> uploadFile(String destination, File file) async {

     try{
       final ref = FirebaseStorage.instance.ref(destination);
     await ref.putFile(file);
      var url = await ref.getDownloadURL();
      print('docurl = $url');
       return url;

     } on FirebaseException catch (e){
       Get.snackbar('Error', e.code);
       return null;
     }
  }
}