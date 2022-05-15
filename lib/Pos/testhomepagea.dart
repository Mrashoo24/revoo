import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/Pos/testhomepageb.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
        ),
        body: Container(
        width: double.infinity,
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
               children: [
                          Text("This is Home Screen"),
                 FlatButton(onPressed: (){

                   Get.to(DetailDcreen());
                 }, child: Text("Go to Detail"),color: Colors.black,textColor: Colors.white,)

               ],
           ),
        ),
      ),

    );
  }
}
