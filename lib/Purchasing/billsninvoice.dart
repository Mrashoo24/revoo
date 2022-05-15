import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Billsinvoice extends StatefulWidget {
  const Billsinvoice({Key? key}) : super(key: key);

  @override
  _BillsinvoiceState createState() => _BillsinvoiceState();
}

class _BillsinvoiceState extends State<Billsinvoice> {

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
              padding:   EdgeInsets.all(20.0),
              child:  Column(
                children: [



                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Bills & Invoice',style: TextStyle(color:kblue,fontSize: 35),
                            ),

                          ),
                          InkWell(onTap: (){

                          },child: Image.asset('asset/addnew.png')),

                        ],
                      ),

                      SizedBox( height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'asset/filterimg.png',height: 20,width: 15,

                          ),
                          SizedBox( width: 5),
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


                      SizedBox( height: 20),
                      Container(
                        padding: EdgeInsets.all(8),

                        decoration: BoxDecoration(

                          color: Kdblue,


                          borderRadius: BorderRadius.circular(15),

                        ),
                        child: Align(
                          alignment: Alignment.topLeft,

                          child: Padding(
                            padding:   EdgeInsets.all(13),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Invoice Name 1',
                                      style: TextStyle(
                                        color: Colors.yellow.shade600,
                                        fontSize: 19,


                                      ),
                                    ),
                                    Icon(Icons.more_vert,color: Colors.white),

                                  ],
                                ),
                                Padding(
                                  padding:   EdgeInsets.only(right: 120),
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
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
