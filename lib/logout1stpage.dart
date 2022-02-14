import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'constants/constants.dart';
import 'home/admindashboard.dart';

class Log1stPage extends StatefulWidget {
  const Log1stPage({Key? key}) : super(key: key);

  @override
  _Log1stPageState createState() => _Log1stPageState();
}

class _Log1stPageState extends State<Log1stPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Card(
        color: Colors.grey.shade200,
        shape: Border(
        right: BorderSide(width: 40),


    ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(

            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage('asset/profile.jfif'),
                    radius: 30,
                  ),
                  SizedBox(width: 20,),
                  Align(
                    alignment: Alignment.bottomLeft,

                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text('Name of the person',style: TextStyle(fontSize: 20,color: kblue),
                                      textAlign: TextAlign.left
                                  )),
                            ),
                            Container(


                                child: Text('Role/Designation',style: TextStyle(fontSize: 18,color: kblue),
                                    textAlign: TextAlign.left
                                )),
                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                        child: Text('Veiw Profile',style: TextStyle(fontSize: 15,color: kyellow),
                                        )),
                                    SizedBox(width: 15,),
                                    Image.asset('asset/rightarrow.png')
                                  ],

                                ),

                              ),

                            ),


                          ],
                        ),
                      ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              buildNavCard('asset/home.png','Home'),
              SizedBox(height: 5,),
              Divider(thickness: 2,endIndent: 50,indent: 25,),
              buildNavCard('asset/checkgrp.png','Daily Logins'),
              SizedBox(height: 5,),
              Divider(thickness: 2,endIndent: 50,indent: 25,),
              buildNavCard('asset/checkpad.png','Daily Updates'),
              SizedBox(height: 5,),
              Divider(thickness: 2,endIndent: 50,indent: 25,),
              buildNavCard('asset/lvapproval.png','Leave Request/\nApprovals'),
              SizedBox(height: 5,),
              Divider(thickness: 2,endIndent: 50,indent: 25,),
              buildNavCard('asset/logoff.png','Home'),
              SizedBox(height: 5,),


            ],
          ),

        ),

      ),
    );
  }

   buildNavCard(String image,String name) {

    return InkWell(
      onTap: (){
        Get.to(AdminDashboard());
      },
      child: Padding(

                padding: const EdgeInsets.only(left: 15.0,top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(image,color: Kdblue,width: 20,height: 20,),
                    SizedBox(width: 10,),
                    Text(name,style: TextStyle(color: Colors.grey,fontSize: 20),),
                  ],
                ),
              ),
    );
  }
}
