import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

class CommonWidgets{

  Widget buildBNB(){
    return Container(
      height: Get.height*0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
        color: Kdblue,

      ),
      child: Align(
        alignment: Alignment.center,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRect(child: Image.asset('asset/share.png')),
            ClipRect(child: Image.asset('asset/homedash.png')),
            Opacity(
                opacity: 0.01,
                child: ClipRect(child: Image.asset('asset/share.png'))
            ),
            ClipRect(child: Image.asset('asset/groupdash.png')),
            ClipRect(child: Image.asset('asset/pathdash.png')),

          ],
        ),
      ),
    );
  }



}