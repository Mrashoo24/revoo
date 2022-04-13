import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DetailDcreen extends StatefulWidget {
  const DetailDcreen({Key? key}) : super(key: key);

  @override
  _DetailDcreenState createState() => _DetailDcreenState();
}

class _DetailDcreenState extends State<DetailDcreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Screen"),
          leading: IconButton(
            icon: InkWell(
                onTap: (){
                  Get.back;
                },
                child: Icon(Icons.arrow_back)), onPressed: () {  },
          ),
        ),
      ),

    );
  }
}
