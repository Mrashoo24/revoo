import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';
import '../constants/constants.dart';
import '../HRMS_admin_Screen/adbranchpg2.dart';

class Product37 extends StatefulWidget {
  const Product37({Key? key}) : super(key: key);

  @override
  _Product37State createState() => _Product37State();
}

class _Product37State extends State<Product37> {
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
                            child: Text('Service Calls',style: TextStyle(color:kblue,fontSize: 35),
                            ),

                          ),
                          InkWell(onTap: (){
                            Get.to(AddBranches());
                          },child: Image.asset('asset/addnew.png')),

                        ],
                      ),

                      SizedBox( height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'asset/filter_icon.png',height: 20,width: 15,

                          ),
                          SizedBox( width: 10),


                          Text("Filter Result by :",style: TextStyle(color:kblue,fontSize: 20,

                          )
                          ),SizedBox( width: 12),


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


                      SizedBox( height: 20),
                      Container(
                        width: Get.width,
                        height: 300,

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
                                        SizedBox( width: 9),

                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5.0),
                                              child: Text(
                                                'Customer Name 1',
                                                style: TextStyle(
                                                  color: Colors.yellow.shade600,
                                                  fontSize: 17,


                                                ),
                                              ),
                                            ),     SizedBox(width: 35),
                                            Text("Feb 22 2021 4.pm",style: TextStyle(
                                              color: Colors.white,fontSize: 11

                                            ),)
                                          ],
                                        ),


                                      ],
                                    ),

                                    SizedBox(height: 8),


                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: Text(
                                      "Adrees sec 14 kherghr shelter park opp littel  "
                                          "Adrees sec 14 kherghr shelter park opp littel  "
                                          "Adrees sec 14 kherghr shelter park opp littel  "
                                          "Adrees sec 14 kherghr shelter park opp littel  "
                                          "Adrees sec 14 kherghr shelter park opp littel  "
                                          "Adrees sec 14 kherghr shelter park opp littel  "
                                          "Adrees sec 14 kherghr shelter park opp littel  "
                                          "Adrees sec 14 kherghr shelter park opp littel  "


                                      ,

                                      style: TextStyle(
                                        color: Colors.white,fontSize: 15,
                                      ),
                                    ),



                                  ),

                                ),


                                SizedBox(height: 20),
                                Row(
                                  children: [




                                    SizedBox(width: 70),
                                    Image.asset("asset/phoneicon.png"),

                                    SizedBox(width: 30),
                                    Image.asset("asset/messageicon.png")

                                  ],
                                ),








                              ],
                            ),

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

      ),
    );

  }
}
