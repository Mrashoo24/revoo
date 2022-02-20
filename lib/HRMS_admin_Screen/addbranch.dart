import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class DBcrud extends StatefulWidget {
  const DBcrud({Key? key}) : super(key: key);

  @override
  _DBcrudState createState() => _DBcrudState();
}

class _DBcrudState extends State<DBcrud> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Scaffold(
         body:  Container(
             height: Get.height,
             child: Stack(
               children: [
                 Positioned(
                     top:-100,
                     right : -35,

                     child: Row(
                       children: [
                         Container(child: Image.asset('asset/dpbrCRUD.png', width: 500,),
                         ),
                       ],
                     )



                 ),
                 Positioned(
                     top: 3,
                     left  : -60,

                     child: Row(
                       children: [
                         Container(child: Image.asset('asset/navicon.png', width: 200,),
                         ),SizedBox(width: 110),
                         Image.asset('asset/bellicon.png'),
                         SizedBox(width: 20),
                         Image.asset('asset/settingsicon.png'),
                         SizedBox(width: 20),
                         Image.asset('asset/usericon.png'),
                       ],
                     ),



                 ),



                 Center(
                   child: Padding(

                     padding: const EdgeInsets.all(15.0),
                     child: Card(
                       color: Colors.grey.shade200,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(50)
                       ),
                       child: Padding(
                         padding: const EdgeInsets.only(right: 200.0,left: 30.0,top: 200,bottom: 20),
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,


                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
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

)
      ),
    );
  }
}



