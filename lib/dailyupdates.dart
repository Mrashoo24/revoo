import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'constants/constants.dart';

class Dailyupdates extends StatefulWidget {
  const Dailyupdates({Key? key}) : super(key: key);

  @override
  _DailyupdatesState createState() => _DailyupdatesState();
}

class _DailyupdatesState extends State<Dailyupdates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),

          child: Image.asset('asset/navicon.png'),
        ),
        actions: [
          Image.asset('asset/bellicon.png'),
          Image.asset('asset/settingsicon.png'),
          Image.asset('asset/usericon.png'),
          SizedBox(width: 12,),
        ],
      ),


      bottomNavigationBar: Container(

        height: 100,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(

                child: Stack(
                  children: [
                    Align(

                      child: Container(
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
                      ),
                      alignment: Alignment.bottomCenter,
                    ),

                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset('asset/bnbAdd.png'),
              ),
            ),

          ],
        ),


      ),

    );
  }
}
