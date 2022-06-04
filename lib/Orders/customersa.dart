import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/Controllers/myempcontroller.dart';

import '../Controllers/customerController.dart';
import '../constants/constants.dart';
import '../HRMS_admin_Screen/adbranchpg2.dart';
import '../model/CustomerModel.dart';
import 'addcustomera.dart';

class HRMSadmincust extends StatefulWidget {
  const HRMSadmincust({Key? key}) : super(key: key);

  @override
  _HRMSadmincustState createState() => _HRMSadmincustState();
}

class _HRMSadmincustState extends State<HRMSadmincust> {
  String initialValue = '';
  TextEditingController content = TextEditingController();

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
      body: GetBuilder<MyEmpController>(
          init: Get.put(MyEmpController()),
        builder: (myEmpController) {

          return GetX<CustomerController>(
              init: Get.put(CustomerController()),
            builder: (customerController) {


              customerController.init(myEmpController.myepmlist.value.bid);

              return customerController.loading.value ?
              kprogressbar
                  : Container(
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
                                  child: Text('Customer',style: TextStyle(color:kblue,fontSize: 35),
                                  ),

                                ),
                                // InkWell(onTap: (){
                                //   Get.to(Addnewprodct56());
                                // },child: Image.asset('asset/addnew.png')),

                              ],
                            ),

                            // SizedBox( height: 10),
                            // Row(
                            //   children: [
                            //     Image.asset(
                            //       'asset/filter_icon.png',height: 20,width: 15,
                            //
                            //     ),
                            //
                            //
                            //
                            //     Text("Filter Result by :",style: TextStyle(color:kblue,fontSize: 20,
                            //
                            //     )
                            //     ),
                            //     Container(
                            //       width:110 ,
                            //       height:25,
                            //       decoration: BoxDecoration(
                            //           color:  bgGrey,
                            //           borderRadius: BorderRadius.circular(10)
                            //
                            //       ),
                            //       child: Align(
                            //         alignment: Alignment.centerLeft,
                            //         child: Row(
                            //           children: [
                            //
                            //             SizedBox( width: 40),
                            //             DropdownButton(
                            //
                            //               icon: Icon(Icons.keyboard_arrow_down,color: Kdblue,),
                            //
                            //               items: itemList.map((String items) {
                            //
                            //                 return DropdownMenuItem(value: items, child: Text(items));
                            //
                            //               }).toList(), onChanged: (String? value) {  },
                            //             ),
                            //
                            //
                            //           ],
                            //         ),
                            //       ),
                            //
                            //
                            //
                            //     ),
                            //
                            //   ],
                            //
                            // ),


                            SizedBox( height: 20),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: customerController.customerList.length,
                              itemBuilder: (context, index) {
                                return buildCutomerCard(customerController.customerList[index]);
                              }
                            ),





                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              );
            }
          );
        }
      ),

      ),
    );
  }

  Container buildCutomerCard(CustomerModel customerModel) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),

                            decoration: BoxDecoration(

                              color: mannu,


                              borderRadius: BorderRadius.circular(15),

                            ),
                            child: Align(
                              alignment: Alignment.topLeft,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        customerModel.name!,
                                        style: TextStyle(
                                          color: Colors.yellow.shade600,
                                          fontSize: 19,


                                        ),
                                      ),
                                      // Icon(Icons.,color: Colors.white),

                                    ],
                                  ),
                                  Text(
                                    customerModel.number!,
                                    style: TextStyle(
                                      color: Colors.white,fontSize: 12,
                                    ),
                                  ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: kyellow,
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Center(
                                        child: AutoSizeText(
                                          customerModel.orders.toString(),
                                          style: TextStyle(color: Colors.white, fontSize: 2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Orders',
                                        style: TextStyle(color: Colors.white, fontSize: 10),
                                      ),
                                      SizedBox(width: 20,),
                                      ElevatedButton(onPressed: (){

                                        Get.defaultDialog(
                                          title: 'Enter Content',
                                          content:     TextFormField(
                                            controller: content,
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: bgGrey,
                                                contentPadding:
                                                EdgeInsets.only(left: 20, top: 25, bottom: 25),
                                                hintText: 'Write Content',
                                                hintStyle: TextStyle(color: Colors.grey),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.white)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.white)),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.white))),
                                          ),
                                        );

                                      }, child: Text('Send Email'),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(kyellow)
                                      ),
                                      )
                                    ],
                                  ),

                                ],
                              )

                                ],
                              ),
                            ),

                          );
  }


}
