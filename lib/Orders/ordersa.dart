import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/Controllers/myempcontroller.dart';
import 'package:revoo/Orders/addOrder.dart';

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
  var firestore = FirebaseFirestore.instance;
 var  selectedStatus = 'All' ;
  var itemList = [
    'All',
    'Pending',
    'Delivered',
    'Refund',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetX<MyEmpController>(
          init: Get.put(MyEmpController()),
          builder: (myempcontroller) {
            return Container(
              width: Get.width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
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
                                child: Text(
                                  'Orders',
                                  style: TextStyle(color: kblue, fontSize: 35),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    Get.to(AddOrders(), fullscreenDialog: true);
                                  },
                                  child: Image.asset('asset/addnew.png')),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                'asset/filter_icon.png',
                                height: 20,
                                width: 15,
                              ),
                              Text("Filter Result by :",
                                  style: TextStyle(
                                    color: kblue,
                                    fontSize: 20,
                                  )),
                              Container(
                                height: 20,
                                decoration: BoxDecoration(
                                    color: bgGrey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 40),
                                      DropdownButton(
                                        value: selectedStatus,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Kdblue,
                                        ),
                                        items: itemList.map((String items) {
                                          return DropdownMenuItem(
                                              value: items, child: Text(items));
                                        }).toList(),
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedStatus = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                              stream: firestore.collection('Orders').where('cid',isEqualTo: myempcontroller.myepmlist.value.cid).snapshots(),
                              builder: (context, snapshot) {

                                if (!snapshot.hasData) {
                                  return Text("no data");
                                }

                                var orderList  =  snapshot.requireData.docs;

                                orderList =

                                  selectedStatus == 'All' ? orderList :  orderList.where((element) => element.get('status') == selectedStatus ).toList();


                                orderList.sort((a,b) => b.get('date').toString().compareTo(a.get('date')));



                                return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: orderList.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Kdblue,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.all(13),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    'Order Number',
                                                                    style: TextStyle(
                                                                      color: Colors
                                                                          .yellow
                                                                          .shade600,
                                                                      fontSize: 16,
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: 5,),
                                                                  Text(
                                                                    orderList[index]['orderNumber'],
                                                                    style: TextStyle(
                                                                      color: Colors
                                                                          .white
                                                                          ,
                                                                      fontSize: 16,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(height: 15),
                                                             Visibility(
                                                               visible:  orderList[index].get('status') == 'Pending' ,
                                                               child: InkWell(
                                                                  onTap: (){
                                                                    Get.defaultDialog(
                                                                      title: 'Confirmation',
                                                                      middleText: 'You want to mark this product as delivered',
                                                                      onConfirm: (){
                                                                        firestore.collection('Orders').doc(orderList[index].id).update({
                                                                          'status' : 'Delivered'
                                                                        });
                                                                      },
                                                                        onCancel: (){
                                                                          Get.back();
                                                                        }
                                                                    );
                                                                  },
                                                                  child: Container(
                                                                    width: 100,
                                                                    height: 25,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: kyellow,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  10),
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        'Delivered',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                15),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                             ),
                                                              SizedBox(height: 5),
                                                              Visibility(
                                                                visible:  orderList[index].get('status') == 'Pending' ,
                                                                child: InkWell(
                                                                  onTap: (){
                                                                    Get.defaultDialog(
                                                                        title: 'Confirmation',
                                                                        middleText: 'You want to Initiate Refund',
                                                                        onConfirm: (){
                                                                          firestore.collection('Orders').doc(orderList[index].id).update({
                                                                            'status' : 'Refund'
                                                                          });
                                                                        },
                                                                      onCancel: (){
                                                                          Get.back();
                                                                      }
                                                                    );
                                                                  },
                                                                  child: Container(
                                                                    width: 100,
                                                                    height: 25,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: Colors.red,
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          10),
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        'Refund',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                            15),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(height: 5),
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.defaultDialog(
                                                                      radius: 15,
                                                                      backgroundColor:
                                                                          Kdblue,
                                                                      title:
                                                                          "Order Details",
                                                                      titleStyle:
                                                                          TextStyle(
                                                                              color:
                                                                                  kyellow),
                                                                      titlePadding:
                                                                          EdgeInsets
                                                                              .all(
                                                                                  0),
                                                                      content:
                                                                          Column(
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              OrderFields(
                                                                                  'Customer Name:'),
                                                                              Text(
                                                                                orderList[index]['customer'],
                                                                                style:
                                                                                    TextStyle(color: Colors.white, fontSize: 12),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              OrderFields(
                                                                                  'Customer Number:'),
                                                                              Text(
                                                                                orderList[index]['cnumber'],
                                                                                style:
                                                                                    TextStyle(color: Colors.white, fontSize: 12),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              OrderFields(
                                                                                  'Customer Address:'),
                                                                              Text(
                                                                                orderList[index]['address'],
                                                                                style:
                                                                                    TextStyle(color: Colors.white, fontSize: 12),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              OrderFields(
                                                                                  'Date:'),
                                                                              Text(
                                                                                snapshot.data!.docs[index]['date'],
                                                                                style:
                                                                                    TextStyle(color: Colors.white, fontSize: 12),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              OrderFields(
                                                                                  'Prize:'),
                                                                              Text(
                                                                                orderList[index]['price'],
                                                                                style:
                                                                                    TextStyle(color: Colors.white, fontSize: 12),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              OrderFields(
                                                                                  'Quantity:'),
                                                                              Text(
                                                                                orderList[index]['quantity'],
                                                                                style:
                                                                                    TextStyle(color: Colors.white, fontSize: 12),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ));
                                                                },
                                                                child: Container(
                                                                  width: 100,
                                                                  height: 25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: kyellow,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                10),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Veiw Order',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              15),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 10),
                                                          Row(
                                                            children: [
                                                              OrderFields(
                                                                  'Date:'),
                                                              Text(
                                                                orderList[index]
                                                                ['date'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 12),
                                                              ),
                                                            ],
                                                          ),

                                                          Row(
                                                            children: [
                                                              OrderFields(
                                                                  'Customer Name:'),
                                                              Text(
                                                                orderList[index]
                                                                    ['cnumber'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 12),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              OrderFields(
                                                                  'Customer Number:'),
                                                              Text(
                                                                orderList[index]
                                                                    ['cnumber'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 12),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              }),
                          SizedBox(height: 18),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  Text OrderFields(text) {
    return Text(
      text,
      style: TextStyle(
        color: kyellow,
        fontSize: 12,
      ),
    );
  }
}
