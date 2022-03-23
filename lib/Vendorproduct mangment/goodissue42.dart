import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../constants/constants.dart';

class Goodissue extends StatefulWidget {
  const Goodissue({Key? key}) : super(key: key);

  @override
  _GoodissueState createState() => _GoodissueState();
}

class _GoodissueState extends State<Goodissue> {
  String initialValue = '';

  var itemList = [
    '',
    'Std1',
    'Std2',
    'Std3',
    'Std4',
    'Std5',
    'Std6',
    'Std7'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,

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
                            child: Text('Goods Issue',style: TextStyle(color:kblue,fontSize: 29),
                            ),

                          ),

                          InkWell(onTap: (){

                          },),

                        ],
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [Image.asset(
                          'asset/filter_icon.png',height: 20,width: 15,

                        ),  SizedBox(width: 15,),
                          Text("Filter Result by :",style: TextStyle(color:kblue,fontSize: 19,
                          )
                          ),
                          Container(
                            width:110 ,
                            height:25,
                            decoration: BoxDecoration(
                                color:  bgGrey,
                                borderRadius: BorderRadius.circular(10)

                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [

                                  SizedBox( width: 40),
                                  DropdownButton(

                                    icon: Icon(Icons.keyboard_arrow_down,color: Kdblue,),

                                    items: itemList.map((String items) {

                                      return DropdownMenuItem(value: items, child: Text(items));

                                    }).toList(), onChanged: (String? value) {  },
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox( height: 30),
                  Container(
                    width: Get.width,
                    height: 155,

                    decoration: BoxDecoration(

                      color: mannu,


                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Align(
                      alignment: Alignment.topLeft,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar( radius: 15,
                                        backgroundColor: Colors.white),
                                    SizedBox( width: 3),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Issue type',
                                        style: TextStyle(
                                          color: Colors.yellow.shade600,
                                          fontSize: 17,


                                        ),
                                      ),
                                    ),


                                  ],
                                ),

                                SizedBox(height: 6),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Icon(Icons.more_vert,color: Colors.white),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  "Adrees sec 14 kherghr shelter park opp littel "
                                  ,

                                  style: TextStyle(
                                    color: Colors.white,fontSize: 15,
                                  ),
                                ),



                              ),

                            ),
                            Align(
                              alignment:Alignment.centerLeft,
                              child: Text(
                                "Adrees sec 14 kherghr shelter park opp littel "
                                ,

                                style: TextStyle(
                                  color: Colors.white,fontSize: 12,
                                ),
                              ),
                            ),
                            Divider(
                              height: 10,

                              thickness: 1,color: Colors.white,endIndent: 18, ),
                            SizedBox(height: 8),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Feb 22,20 4.20 pm",style: TextStyle(color: Colors.white,fontSize: 15,
                                    ),


                                    ),
                                    SizedBox(width: 80),

                                    SizedBox(width: 20),
                                    Image.asset("asset/message.png")

                                  ],
                                )
                            ),








                          ],
                        ),

                      ),
                    ),

                  ),
                  SizedBox( height: 18),
                  Container(
                    width: Get.width,
                    height: 155,

                    decoration: BoxDecoration(

                      color: mannu,


                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Align(
                      alignment: Alignment.topLeft,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar( radius: 15,
                                        backgroundColor: Colors.white),
                                    SizedBox( width: 3),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Issue type',
                                        style: TextStyle(
                                          color: Colors.yellow.shade600,
                                          fontSize: 17,


                                        ),
                                      ),
                                    ),


                                  ],
                                ),

                                SizedBox(height: 6),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Icon(Icons.more_vert,color: Colors.white),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  "Adrees sec 14 kherghr shelter park opp littel "
                                  ,

                                  style: TextStyle(
                                    color: Colors.white,fontSize: 15,
                                  ),
                                ),



                              ),

                            ),
                            Align(
                              alignment:Alignment.centerLeft,
                              child: Text(
                                "Adrees sec 14 kherghr shelter park opp littel "
                                ,

                                style: TextStyle(
                                  color: Colors.white,fontSize: 12,
                                ),
                              ),
                            ),
                            Divider(
                              height: 10,

                              thickness: 1,color: Colors.white,endIndent: 18, ),
                            SizedBox(height: 8),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Feb 22,20 4.20 pm",style: TextStyle(color: Colors.white,fontSize: 15,
                                    ),


                                    ),
                                    SizedBox(width: 80),

                                    SizedBox(width: 20),
                                    Image.asset("asset/message.png")

                                  ],
                                )
                            ),








                          ],
                        ),

                      ),
                    ),

                  ),
                  SizedBox( height: 30),
                  Container(
                    width: Get.width,
                    height: 155,

                    decoration: BoxDecoration(

                      color: mannu,


                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Align(
                      alignment: Alignment.topLeft,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar( radius: 15,
                                        backgroundColor: Colors.white),
                                    SizedBox( width: 3),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Issue type',
                                        style: TextStyle(
                                          color: Colors.yellow.shade600,
                                          fontSize: 17,


                                        ),
                                      ),
                                    ),


                                  ],
                                ),

                                SizedBox(height: 6),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Icon(Icons.more_vert,color: Colors.white),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  "Adrees sec 14 kherghr shelter park opp littel "
                                  ,

                                  style: TextStyle(
                                    color: Colors.white,fontSize: 15,
                                  ),
                                ),



                              ),

                            ),
                            Align(
                              alignment:Alignment.centerLeft,
                              child: Text(
                                "Adrees sec 14 kherghr shelter park opp littel "
                                ,

                                style: TextStyle(
                                  color: Colors.white,fontSize: 12,
                                ),
                              ),
                            ),
                            Divider(
                              height: 10,

                              thickness: 1,color: Colors.white,endIndent: 18, ),
                            SizedBox(height: 8),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Feb 22,20 4.20 pm",style: TextStyle(color: Colors.white,fontSize: 15,
                                    ),


                                    ),
                                    SizedBox(width: 80),

                                    SizedBox(width: 20),
                                    Image.asset("asset/message.png")

                                  ],
                                )
                            ),








                          ],
                        ),

                      ),
                    ),

                  ),
                  SizedBox( height: 18),
                  Container(
                    width: Get.width,
                    height: 155,

                    decoration: BoxDecoration(

                      color: mannu,


                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Align(
                      alignment: Alignment.topLeft,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar( radius: 15,
                                        backgroundColor: Colors.white),
                                    SizedBox( width: 3),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Issue type',
                                        style: TextStyle(
                                          color: Colors.yellow.shade600,
                                          fontSize: 17,


                                        ),
                                      ),
                                    ),


                                  ],
                                ),

                                SizedBox(height: 6),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Icon(Icons.more_vert,color: Colors.white),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  "Adrees sec 14 kherghr shelter park opp littel "
                                  ,

                                  style: TextStyle(
                                    color: Colors.white,fontSize: 15,
                                  ),
                                ),



                              ),

                            ),
                            Align(
                              alignment:Alignment.centerLeft,
                              child: Text(
                                "Adrees sec 14 kherghr shelter park opp littel "
                                ,

                                style: TextStyle(
                                  color: Colors.white,fontSize: 12,
                                ),
                              ),
                            ),
                            Divider(
                              height: 10,

                              thickness: 1,color: Colors.white,endIndent: 18, ),
                            SizedBox(height: 8),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Feb 22,20 4.20 pm",style: TextStyle(color: Colors.white,fontSize: 15,
                                    ),


                                    ),
                                    SizedBox(width: 80),

                                    SizedBox(width: 20),
                                    Image.asset("asset/message.png")

                                  ],
                                )
                            ),








                          ],
                        ),

                      ),
                    ),

                  ),
                  SizedBox( height: 30),
                  Container(
                    width: Get.width,
                    height: 155,

                    decoration: BoxDecoration(

                      color: mannu,


                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Align(
                      alignment: Alignment.topLeft,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar( radius: 15,
                                        backgroundColor: Colors.white),
                                    SizedBox( width: 3),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Issue type',
                                        style: TextStyle(
                                          color: Colors.yellow.shade600,
                                          fontSize: 17,


                                        ),
                                      ),
                                    ),


                                  ],
                                ),

                                SizedBox(height: 6),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Icon(Icons.more_vert,color: Colors.white),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  "Adrees sec 14 kherghr shelter park opp littel "
                                  ,

                                  style: TextStyle(
                                    color: Colors.white,fontSize: 15,
                                  ),
                                ),



                              ),

                            ),
                            Align(
                              alignment:Alignment.centerLeft,
                              child: Text(
                                "Adrees sec 14 kherghr shelter park opp littel "
                                ,

                                style: TextStyle(
                                  color: Colors.white,fontSize: 12,
                                ),
                              ),
                            ),
                            Divider(
                              height: 10,

                              thickness: 1,color: Colors.white,endIndent: 18, ),
                            SizedBox(height: 8),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Feb 22,20 4.20 pm",style: TextStyle(color: Colors.white,fontSize: 15,
                                    ),


                                    ),
                                    SizedBox(width: 80),

                                    SizedBox(width: 20),
                                    Image.asset("asset/message.png")

                                  ],
                                )
                            ),








                          ],
                        ),

                      ),
                    ),

                  ),
                  SizedBox( height: 18),
                  Container(
                    width: Get.width,
                    height: 155,

                    decoration: BoxDecoration(

                      color: mannu,


                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Align(
                      alignment: Alignment.topLeft,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar( radius: 15,
                                        backgroundColor: Colors.white),
                                    SizedBox( width: 3),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Issue type',
                                        style: TextStyle(
                                          color: Colors.yellow.shade600,
                                          fontSize: 17,


                                        ),
                                      ),
                                    ),


                                  ],
                                ),

                                SizedBox(height: 6),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Icon(Icons.more_vert,color: Colors.white),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  "Adrees sec 14 kherghr shelter park opp littel "
                                  ,

                                  style: TextStyle(
                                    color: Colors.white,fontSize: 15,
                                  ),
                                ),



                              ),

                            ),
                            Align(
                              alignment:Alignment.centerLeft,
                              child: Text(
                                "Adrees sec 14 kherghr shelter park opp littel "
                                ,

                                style: TextStyle(
                                  color: Colors.white,fontSize: 12,
                                ),
                              ),
                            ),
                            Divider(
                              height: 10,

                              thickness: 1,color: Colors.white,endIndent: 18, ),
                            SizedBox(height: 8),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Feb 22,20 4.20 pm",style: TextStyle(color: Colors.white,fontSize: 15,
                                    ),


                                    ),
                                    SizedBox(width: 80),

                                    SizedBox(width: 20),
                                    Image.asset("asset/message.png")

                                  ],
                                )
                            ),








                          ],
                        ),

                      ),
                    ),

                  ),
                  SizedBox( height: 30),
                  Container(
                    width: Get.width,
                    height: 155,

                    decoration: BoxDecoration(

                      color: mannu,


                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Align(
                      alignment: Alignment.topLeft,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar( radius: 15,
                                        backgroundColor: Colors.white),
                                    SizedBox( width: 3),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Issue type',
                                        style: TextStyle(
                                          color: Colors.yellow.shade600,
                                          fontSize: 17,


                                        ),
                                      ),
                                    ),


                                  ],
                                ),

                                SizedBox(height: 6),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Icon(Icons.more_vert,color: Colors.white),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  "Adrees sec 14 kherghr shelter park opp littel "
                                  ,

                                  style: TextStyle(
                                    color: Colors.white,fontSize: 15,
                                  ),
                                ),



                              ),

                            ),
                            Align(
                              alignment:Alignment.centerLeft,
                              child: Text(
                                "Adrees sec 14 kherghr shelter park opp littel "
                                ,

                                style: TextStyle(
                                  color: Colors.white,fontSize: 12,
                                ),
                              ),
                            ),
                            Divider(
                              height: 10,

                              thickness: 1,color: Colors.white,endIndent: 18, ),
                            SizedBox(height: 8),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Feb 22,20 4.20 pm",style: TextStyle(color: Colors.white,fontSize: 15,
                                    ),


                                    ),
                                    SizedBox(width: 80),

                                    SizedBox(width: 20),
                                    Image.asset("asset/message.png")

                                  ],
                                )
                            ),








                          ],
                        ),

                      ),
                    ),

                  ),
                  SizedBox( height: 18),
                  Container(
                    width: Get.width,
                    height: 155,

                    decoration: BoxDecoration(

                      color: mannu,


                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Align(
                      alignment: Alignment.topLeft,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar( radius: 15,
                                        backgroundColor: Colors.white),
                                    SizedBox( width: 3),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Issue type',
                                        style: TextStyle(
                                          color: Colors.yellow.shade600,
                                          fontSize: 17,


                                        ),
                                      ),
                                    ),


                                  ],
                                ),

                                SizedBox(height: 6),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Icon(Icons.more_vert,color: Colors.white),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  "Adrees sec 14 kherghr shelter park opp littel "
                                  ,

                                  style: TextStyle(
                                    color: Colors.white,fontSize: 15,
                                  ),
                                ),



                              ),

                            ),
                            Align(
                              alignment:Alignment.centerLeft,
                              child: Text(
                                "Adrees sec 14 kherghr shelter park opp littel "
                                ,

                                style: TextStyle(
                                  color: Colors.white,fontSize: 12,
                                ),
                              ),
                            ),
                            Divider(
                              height: 10,

                              thickness: 1,color: Colors.white,endIndent: 18, ),
                            SizedBox(height: 8),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Feb 22,20 4.20 pm",style: TextStyle(color: Colors.white,fontSize: 15,
                                    ),


                                    ),
                                    SizedBox(width: 80),

                                    SizedBox(width: 20),
                                    Image.asset("asset/message.png")

                                  ],
                                )
                            ),








                          ],
                        ),

                      ),
                    ),

                  ),







                ],
              ),


            ),
          ),
        ),
      ),

    );
  }
}
