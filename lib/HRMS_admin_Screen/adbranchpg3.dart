import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class DBcrud3 extends StatefulWidget {
  const DBcrud3({Key? key}) : super(key: key);

  @override
  _DBcrud3State createState() => _DBcrud3State();
}

class _DBcrud3State extends State<DBcrud3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('asset/dpbrCRUD.png')),

          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (){
                            print('clicked');
                          },
                          child: Image.asset('asset/navicon.png',)),
                      Row(
                        children: [
                          SizedBox(width: 110),
                          Image.asset('asset/bellicon.png'),
                          SizedBox(width: 20),
                          Image.asset('asset/settingsicon.png'),
                          SizedBox(width: 20),
                          Image.asset('asset/usericon.png'),
                        ],
                      ),


                    ],
                  ),
                  SizedBox(height: 30),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Create Branch',style: TextStyle(color:kblue,fontSize: 25),
                            ),

                          ),
                          Image.asset('asset/addnew.png'),

                        ],
                      ),
                      SizedBox( height: 25),

                      Container(
                        width: 400,
                        height: 450,
                        decoration: BoxDecoration(

                                color: bgGrey,

                          borderRadius: BorderRadius.circular(40),

                        ),
                          child: Align(
                            alignment: Alignment.topLeft,

                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 180,top:30,bottom: 10),
                                  child: Text(
                                    'Branchs(s)',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,

                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 400,

                                    decoration: BoxDecoration(

                                      gradient: LinearGradient(
                                        colors: [
                                          kblue,
                                          Kdblue,
                                        ],


                                      ),

                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45)),

                                    ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Text('Branch Name 1',style: TextStyle(color: Colors.white),),
                                       SizedBox(width: 40),
                                       Container(
                                         width: 50,
                                         height: 14,
                                         decoration: BoxDecoration(

                                           color: kyellow,

                                           borderRadius: BorderRadius.circular(40),

                                         ),

                                       )
                                          ],
                                        ),
                                        trailing : Icon(Icons.more_vert,color: Colors.white),
                                      ),Divider(
                                        height: 10,
                                        thickness: 4,color:Kdblue,endIndent: 10, indent: 10,
                                      ),
                                      SizedBox(height: 10),
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Text('Branch Name 2',style: TextStyle(color: Colors.white),),
                                            SizedBox(width: 40),
                                            Container(
                                              width: 50,
                                              height: 14,
                                              decoration: BoxDecoration(

                                                color: kyellow,

                                                borderRadius: BorderRadius.circular(40),

                                              ),

                                            )
                                          ],
                                        ),
                                        trailing : Icon(Icons.more_vert,color: Colors.white),
                                      ),Divider(
                                        height: 10,
                                        thickness: 4,color:Kdblue,endIndent: 10, indent: 10,
                                      ),SizedBox(height: 10),
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Text('Branch Name 3',style: TextStyle(color: Colors.white),),
                                            SizedBox(width: 40),
                                            Container(
                                              width: 50,
                                              height: 14,
                                              decoration: BoxDecoration(

                                                color: bluess,

                                                borderRadius: BorderRadius.circular(40),

                                              ),

                                            )
                                          ],
                                        ),
                                        trailing : Icon(Icons.more_vert,color: Colors.white),
                                      ),Divider(
                                        height: 10,
                                        thickness: 4,color:Kdblue,endIndent: 10, indent: 10,
                                      ),SizedBox(height: 10),
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Text('Branch Name 4',style: TextStyle(color: Colors.white),),
                                            SizedBox(width: 40),
                                            Container(
                                              width: 50,
                                              height: 14,
                                              decoration: BoxDecoration(

                                                color:bluess,

                                                borderRadius: BorderRadius.circular(40),

                                              ),

                                            )
                                          ],
                                        ),
                                        trailing : Icon(Icons.more_vert,color: Colors.white),
                                      ),Divider(
                                        height: 10,
                                        thickness: 4,color:Kdblue,endIndent: 10, indent: 10,
                                      ),SizedBox(height: 10),
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Text('Branch Name 5',style: TextStyle(color: Colors.white),),
                                            SizedBox(width: 40),
                                            Container(
                                              width: 50,
                                              height: 14,
                                              child: Center(child: Text('paid',style: TextStyle(color: Colors.white,fontSize: 10),)),
                                              decoration: BoxDecoration(

                                                color: bluess,

                                                borderRadius: BorderRadius.circular(40),

                                              ),

                                            )
                                          ],
                                        ),
                                        trailing : Icon(Icons.more_vert,color: Colors.white),
                                      ),
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

                ],
              ),
            ),
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
      ),


    );
  }
}
