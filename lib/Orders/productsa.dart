import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Purchasing/addnwprdct29.dart';
import '../constants/constants.dart';
import '../HRMS_admin_Screen/adbranchpg2.dart';
import 'addproductb.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  _HRMSadmincustState createState() => _HRMSadmincustState();
}

class _HRMSadmincustState extends State<Product> {
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

                  SizedBox(height: 10),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Product',style: TextStyle(color:kblue,fontSize: 35),
                            ),

                          ),
                          InkWell(onTap: (){
                            // Get.to(AddNewProduct());
                          },child: Image.asset('asset/addnew.png')),

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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Product Name 1',
                                              style: TextStyle(
                                                color: Colors.yellow.shade600,
                                                fontSize: 19,


                                              ),
                                            ),
                                            Icon(Icons.more_vert,color: Colors.white),

                                          ],
                                        ),
                                        Text(
                                          "Quantity: 10",
                                          style: TextStyle(
                                            color: Colors.white,fontSize: 12,
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
