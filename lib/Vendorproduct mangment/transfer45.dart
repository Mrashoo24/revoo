import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../HRMS_admin_Screen/adbranchpg2.dart';
import '../constants/constants.dart';

class Transfer45 extends StatefulWidget {
  const Transfer45({Key? key}) : super(key: key);

  @override
  _Transfer45State createState() => _Transfer45State();
}

class _Transfer45State extends State<Transfer45> {
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child:  Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     InkWell(
                //         onTap: (){
                //           print('clicked');
                //         },
                //         child: Image.asset('asset/navicon.png',)),
                //     SizedBox(width: 110),
                //     Image.asset('asset/bellicon.png'),
                //     SizedBox(width: 20),
                //     Image.asset('asset/settingsicon.png'),
                //     SizedBox(width: 20),
                //     Image.asset('asset/usericon.png'),
                //
                //
                //   ],
                // ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Transfers',style: TextStyle(color:kblue,fontSize: 35),
                      ),

                    ),
                    InkWell(
                      child: Image.asset('asset/addnew.png'),
                      onTap: (){
                      Get.to(AddBranches());
                    },),

                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'asset/filter_icon.png',height: 20,width: 15,

                    ),



                    Text("Filter Result by :",style: TextStyle(color:kblue,fontSize: 20,

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

                SizedBox( height: 10),





                SizedBox( height: 20),
                Container(
                  width: 500,
                  height: 90,

                  decoration: BoxDecoration(

                    color: mannu,


                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Align(
                    alignment: Alignment.topLeft,

                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0,top: 13),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Transfer 1',
                                style: TextStyle(
                                  color: Colors.yellow.shade600,
                                  fontSize: 19,


                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120.0,bottom: 10),
                                child: Icon(Icons.more_vert,color: Colors.white),
                              ),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 120),
                            child: Center(
                              child: Text(
                                "Adrees sec 14 kherghr shelter park opp littel world mall  ",
                                style: TextStyle(
                                  color: Colors.white,fontSize: 12,
                                ),
                              ),
                            ),
                          )

                        ],
                      ),

                    ),
                  ),

                ),
                SizedBox( height: 18),
                Container(
                  width: 500,
                  height: 90,

                  decoration: BoxDecoration(

                    color: mannu,


                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Align(
                    alignment: Alignment.topLeft,

                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0,top: 13),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Transfer 1',
                                style: TextStyle(
                                  color: Colors.yellow.shade600,
                                  fontSize: 19,


                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120.0,bottom: 10),
                                child: Icon(Icons.more_vert,color: Colors.white),
                              ),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 120),
                            child: Center(
                              child: Text(
                                "Adrees sec 14 kherghr shelter park opp littel world mall  ",
                                style: TextStyle(
                                  color: Colors.white,fontSize: 12,
                                ),
                              ),
                            ),
                          )

                        ],
                      ),

                    ),
                  ),

                ),
                SizedBox( height: 18),
                Container(
                  width: 500,
                  height: 90,

                  decoration: BoxDecoration(

                    color: mannu,


                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Align(
                    alignment: Alignment.topLeft,

                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0,top: 13),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Transfer 1',
                                style: TextStyle(
                                  color: Colors.yellow.shade600,
                                  fontSize: 19,


                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120.0,bottom: 10),
                                child: Icon(Icons.more_vert,color: Colors.white),
                              ),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 120),
                            child: Center(
                              child: Text(
                                "Adrees sec 14 kherghr shelter park opp littel world mall  ",
                                style: TextStyle(
                                  color: Colors.white,fontSize: 12,
                                ),
                              ),
                            ),
                          )

                        ],
                      ),

                    ),
                  ),

                ),
                SizedBox( height: 20),
                Container(
                  width: 500,
                  height: 90,

                  decoration: BoxDecoration(

                    color: mannu,


                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Align(
                    alignment: Alignment.topLeft,

                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0,top: 13),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Transfer 1',
                                style: TextStyle(
                                  color: Colors.yellow.shade600,
                                  fontSize: 19,


                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120.0,bottom: 10),
                                child: Icon(Icons.more_vert,color: Colors.white),
                              ),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 120),
                            child: Center(
                              child: Text(
                                "Adrees sec 14 kherghr shelter park opp littel world mall  ",
                                style: TextStyle(
                                  color: Colors.white,fontSize: 12,
                                ),
                              ),
                            ),
                          )

                        ],
                      ),

                    ),
                  ),

                ),
                SizedBox( height: 20),
                Container(
                  width: 500,
                  height: 90,

                  decoration: BoxDecoration(

                    color: mannu,


                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Align(
                    alignment: Alignment.topLeft,

                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0,top: 13),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Transfer 1',
                                style: TextStyle(
                                  color: Colors.yellow.shade600,
                                  fontSize: 19,


                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120.0,bottom: 10),
                                child: Icon(Icons.more_vert,color: Colors.white),
                              ),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 120),
                            child: Center(
                              child: Text(
                                "Adrees sec 14 kherghr shelter park opp littel world mall  ",
                                style: TextStyle(
                                  color: Colors.white,fontSize: 12,
                                ),
                              ),
                            ),
                          )

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
    );
  }
}
