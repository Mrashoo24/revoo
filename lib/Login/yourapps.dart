import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';


class Yourapps extends StatefulWidget {
  const Yourapps({Key? key}) : super(key: key);

  @override
  _YourappsState createState() => _YourappsState();
}

class _YourappsState extends State<Yourapps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0,
         leading: InkWell(
           onTap: (){

           },
           child: Padding(
             padding: const EdgeInsets.only(left: 12.0),

             child: Image.asset('asset/navicon.png'),
           ),
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
        body: SingleChildScrollView(
        child: Padding(
        padding:  EdgeInsets.all(8.0),
    child: Column(
    children: [
    Container(
    alignment: Alignment.center,
    child : Image.asset('asset/logo.png',width: 250,),

    ),
      SizedBox(
        height: 25,),
      Container(
        child: Text("Your Apps",style: TextStyle(color: kblue ,fontSize: 25),
      ),

      ),
      SizedBox(
        height : 30,),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){},
                child: Card(

                    color: Kdblue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: Text('')),
                    )
                ),
              ),



              SizedBox(
                width : 40,),
              Row(
                children: [
                  InkWell(
                    onTap: (){},
                    child: Card(

                        color: Kdblue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(child: Text('')),
                        )),
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HRMS",style: TextStyle(color: kyellow ,fontSize: 18)),
            SizedBox(
              width : 100,),
            Text("CRM",style: TextStyle(color: kyellow ,fontSize: 18)),
          ],
        ),
      ),SizedBox(
        height: 25,),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){},
                child: Card(

                    color: Kdblue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: Text('')),
                    )),
              ),



              SizedBox(
                width : 40,),
              Row(
                children: [
                  InkWell(
                    onTap: (){},
                    child: Card(

                        color: Kdblue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(child: Text('')),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Inventory",style: TextStyle(color: kyellow ,fontSize: 18)),
            SizedBox(
              width : 80,),
            Text("Finance",style: TextStyle(color: kyellow ,fontSize: 18)),
          ],
        ),
      ), SizedBox(
        height: 25,),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){},
                child: Card(

                    color: Kdblue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: Text('')),
                    )),
              ),



              SizedBox(
                width : 40,),
              Row(
                children: [
                  InkWell(
                    onTap: (){},
                    child: Card(

                        color: Kdblue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(child: Text('')),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),Align(
        child: Container(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Accounting",style: TextStyle(color: kyellow ,fontSize: 15)),
              SizedBox(
                width : 100,),
              Text("Sales",style: TextStyle(color: kyellow ,fontSize: 15)),
            ],
          ),
        ),
      ),

    ],
    ),

        ),
    ),
    );
  }
}
