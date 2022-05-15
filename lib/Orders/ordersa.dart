import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';
import '../HRMS_admin_Screen/adbranchpg2.dart';
import 'ordersb.dart';

class Ordera extends StatefulWidget {
  const Ordera({Key? key}) : super(key: key);

  @override
  _HRMSadmincustState createState() => _HRMSadmincustState();
}

class _HRMSadmincustState extends State<Ordera> {
  String initialValue = '';

  var itemList = [
    'Pending',
    'Delivered',
    'Returned',

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

                  SizedBox(height: 30),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Orders',style: TextStyle(color:kblue,fontSize: 35),
                            ),

                          ),
                          InkWell(onTap: (){
                            Get.to(Addorder23());
                          },child: Image.asset('asset/addnew.png')),

                        ],
                      ),

                      SizedBox( height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'asset/filter_icon.png',height: 20,width: 15,

                          ),



                          Text("Filter Result by :",style: TextStyle(color:kblue,fontSize: 20,

                          )
                          ),
                          Container(
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
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(

                              decoration: BoxDecoration(

                                color: mannu,


                                borderRadius: BorderRadius.circular(15),

                              ),
                              child: Align(
                                alignment: Alignment.topLeft,

                                child: Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Order Name 1',
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
                          );
                        }
                      ),
                      SizedBox( height: 18),






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
