import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class DBcrud4 extends StatefulWidget {
  const DBcrud4({Key? key}) : super(key: key);

  @override
  _DBcrud3State createState() => _DBcrud3State();
}

class _DBcrud3State extends State<DBcrud4> {






  @override
  Widget build(BuildContext context) {

    RelativeRect buttonMenuPosition(BuildContext context) {

      final RenderBox bar = context.findRenderObject() as RenderBox;
      final RenderBox overlay =
      Overlay.of(context)?.context.findRenderObject() as RenderBox;
      const Offset offset = Offset.zero;
      final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(
          bar.localToGlobal(bar.size.centerRight(offset),
              ancestor: overlay),
          bar.localToGlobal(
              bar.size.centerRight(offset)
              ,
              ancestor: overlay),
        ),
        offset & overlay.size,
      );
      return position;
    }
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
                        height: 500,
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
                                        trailing : InkWell(child: Icon(Icons.more_vert,color: Colors.white),
                                        onTap: (){

                                          final RelativeRect position =
                                          buttonMenuPosition(context);


                                          showMenu(
                                            color: Kdblue,
                                            context: context, position: position, items: [


                                            PopupMenuItem<int>(
                                              value: 0,
                                              child: Row(
                                                  children: [
                                                Text('Action',style: TextStyle(fontSize: 25,color: Colors.white),),
                                                    Icon(Icons.more_vert,color: Colors.white),
                                                ],
                                              ),
                                          ),
                                            PopupMenuItem<int>(
                                              value: 0,
                                              child:Divider(
                                                height: 33,
                                                thickness: 2,color:Colors.white,endIndent: 10, indent: 10,
                                              ),
                                            ),
                                            PopupMenuItem<int>(
                                              value: 0,
                                              child: Row(
                                                children: [
                                                  Image.asset('asset/actiona.png'),
                                                  SizedBox(width: 10),
                                                  InkWell(
                                                    onTap: (){
                                                      final RelativeRect position =
                                                      buttonMenuPosition(context);


                                                       Get.defaultDialog(
                                                         title: '',
                                                         content:   Container(
                                                           width: 400,
                                                           height: 400,
                                                           decoration: BoxDecoration(

                                                             color: Colors.white,

                                                             borderRadius: BorderRadius.circular(40),

                                                           ),
                                                           child:Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: Column(

                                                               children: [

                                                                 Positioned(
                                                                   right: 80.0,
                                                                   top: 10.0,
                                                                   child: CircleAvatar(
                                                                     child: Icon(Icons.close),
                                                                     backgroundColor: Kdblue,
                                                                   ),
                                                                 ),
                                                                 Text('Duplicate Branch',style: TextStyle(fontSize: 30,color: kblue),
                                                                 ),TextFormField(
                                                                   decoration: InputDecoration(
                                                                       filled: true,
                                                                       fillColor: bgGrey,
                                                                       contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                                                                       hintText: 'Choose a Name',

                                                                       hintStyle: TextStyle(
                                                                           color: Colors.grey
                                                                       ),
                                                                       border: OutlineInputBorder(
                                                                           borderSide: BorderSide(color: Colors.white)
                                                                       ),
                                                                       focusedBorder: OutlineInputBorder(
                                                                           borderSide: BorderSide(color: Colors.white)
                                                                       ),
                                                                       enabledBorder:OutlineInputBorder(
                                                                           borderSide: BorderSide(color: Colors.white)
                                                                       )
                                                                   ),

                                                                 ),Text('Copy all attributes',style: TextStyle(fontSize: 28,color: Colors.grey),),
                                                                 ButtonBar(
                                                                   alignment: MainAxisAlignment.center,
                                                                   children: [
                                                                     Row(
                                                                       children: [
                                                                         Radio(
                                                                           value: 1,
                                                                           groupValue: 1,
                                                                           onChanged: (val) {},
                                                                         ),Text('Yes',style: TextStyle(fontSize: 15,color: Colors.grey),),

                                                                       ],
                                                                     ),
                                                                   ],
                                                                 ),
                                                                 SizedBox(height: 25),
                                                                 Row(
                                                                   mainAxisSize: MainAxisSize.min,
                                                                   children: [
                                                                     ElevatedButton(onPressed: (){

                                                                     },

                                                                         style: ElevatedButton.styleFrom(
                                                                             elevation: 0,
                                                                             shape:RoundedRectangleBorder(
                                                                                 borderRadius: BorderRadius.all(Radius.circular(10))
                                                                             ),
                                                                             side: BorderSide(width: 3.0, color: kblue ),
                                                                             primary: Colors.white,
                                                                             padding: EdgeInsets.symmetric(horizontal: 32, vertical: 11),
                                                                             textStyle: TextStyle(
                                                                                 fontSize: 30,
                                                                                 fontWeight: FontWeight.bold)),
                                                                         child: Center(child: Text('< Back',style: TextStyle(
                                                                             color: kblue,fontSize: 15
                                                                         ),))),
                                                                     SizedBox(width: 25,),
                                                                     Container(
                                                                       width: 110,
                                                                       height: 41,
                                                                       decoration: BoxDecoration(
                                                                         gradient: LinearGradient(
                                                                           colors: [
                                                                             Colors.blue.shade900,
                                                                             Colors.blue,
                                                                           ],
                                                                           begin: Alignment.topLeft,
                                                                           end: Alignment.bottomRight,
                                                                         ),
                                                                         borderRadius: BorderRadius.circular(10),


                                                                       ),
                                                                       child: Padding(
                                                                         padding: const EdgeInsets.all(8.0),
                                                                         child: Center(
                                                                           child: Text('Duplicate',style: TextStyle(
                                                                               color: Colors.white,fontSize: 15
                                                                           ),),
                                                                         ),
                                                                       ),

                                                                     ),
                                                                   ],
                                                                 ),



                                                               ],
                                                             ),

                                                           ),

                                                         ),




                                                       );

                                                    },
                                                    child: Text('Duplicate',style: TextStyle(fontSize: 20,color: Colors.white),
                                                    ),
                                                  )
                                                ],
                                              ),

                                            ), PopupMenuItem<int>(
                                              value: 1,
                                              child: Row(
                                                children: [
                                                  Image.asset('asset/actionb.png'),
                                                  SizedBox(width: 10),
                                                  Text('Rename',style: TextStyle(fontSize: 20,color: Colors.white),
                                                  )
                                                ],
                                              ),

                                            ),

                                            PopupMenuItem<int>(
                                              value: 2,
                                              child: Row(
                                                children: [
                                                  Image.asset('asset/actionc.png'),
                                                  SizedBox(width: 10),
                                                  Text('Download',style: TextStyle(fontSize: 20,color: Colors.white),
                                                  )
                                                ],
                                              ),

                                            ),
                                            PopupMenuItem<int>(
                                              value: 3,
                                              child: Row(
                                                children: [
                                                  Image.asset('asset/actiond.png'),
                                                  SizedBox(width: 10),
                                                  Text('Add Domain',style: TextStyle(fontSize: 20,color: Colors.white),
                                                  )
                                                ],
                                              ),

                                            ), PopupMenuItem<int>(
                                              value: 4,
                                              child: Row(
                                                children: [
                                                  Image.asset('asset/actione.png'),
                                                  SizedBox(width: 10),
                                                  Text('Tags',style: TextStyle(fontSize: 20,color: Colors.white),
                                                  )
                                                ],
                                              ),

                                            ), PopupMenuItem<int>(
                                              value: 5,
                                              child: Row(
                                                children: [
                                                  Image.asset('asset/actionf.png'),
                                                  SizedBox(width: 10),
                                                  Text('Delete',style: TextStyle(fontSize: 20,color: Colors.white),
                                                  )
                                                ],
                                              ),

                                            ),PopupMenuItem<int>(
                                              value: 6,
                                              child:Divider(
                                                height: 10,
                                                thickness: 2,color:Colors.white,endIndent: 10, indent: 10,
                                              ),
                                            ),PopupMenuItem<int>(
                                              value: 7,
                                              child: Row(
                                                children: [
                                                  Image.asset('asset/actionh.png'),
                                                  SizedBox(width: 10),
                                                  Text('Invite Users',style: TextStyle(fontSize: 20,color: Colors.white),
                                                  )
                                                ],
                                              ),

                                            ), PopupMenuItem<int>(
                                              value: 8,
                                              child: Row(
                                                children: [
                                                  Image.asset('asset/actionh.png'),
                                                  SizedBox(width: 10),
                                                  Text('Remove Users',style: TextStyle(fontSize: 20,color: Colors.white),
                                                  )
                                                ],
                                              ),

                                            ),PopupMenuItem<int>(
                                              value: 9,
                                              child:Divider(
                                                height: 10,
                                                thickness: 2,color:Colors.white,endIndent: 10, indent: 10,
                                              ),
                                            ),PopupMenuItem<int>(
                                              value: 10,
                                              child: Row(
                                                children: [
                                                  Image.asset('asset/actiong.png'),
                                                  SizedBox(width: 10),
                                                  Text('Contact Support',style: TextStyle(fontSize: 20,color: Colors.white),
                                                  )
                                                ],
                                              ),

                                            ),

                                            PopupMenuItem<int>(
                                              value: 11,
                                              child:Container(
                                                width: 400,

                                                decoration: BoxDecoration(

                                                    color: kyellow,

                                                    borderRadius: BorderRadius.all( Radius.circular(10) )

                                                ),
                                                child: ListTile(

                                                  title: Row(

                                                    children: [


                                                      SizedBox(width: 20,height: 50),
                                                      Text('Upgrade',style: TextStyle(fontSize: 30,color: Kdblue),

                                                      ),SizedBox(width: 15),

                                                      Image.asset('asset/actionj.png',color: Kdblue,),

                                                    ],

                                                  ),

                                                ),
                                              ),
                                            ),
                                          ],
                                          );
                                        },
                                        ),
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
                                        height: 30,
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
                                      ),SizedBox(height:30),
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
                                      ),SizedBox(height:20),
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

                                            ),
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
