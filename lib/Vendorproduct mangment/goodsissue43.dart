import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/Controllers/goodsissuecontroller.dart';
import 'package:collection/collection.dart';
import 'package:revoo/Vendorproduct%20mangment/addIssues.dart';
import '../Controllers/myempcontroller.dart';
import '../HRMS_admin_Screen/adbranchpg2.dart';
import '../constants/constants.dart';
import 'model/goodissuemodel.dart';

class Goodsissue43 extends StatefulWidget {
  const Goodsissue43({Key? key}) : super(key: key);

  @override
  _Goodsissue43State createState() => _Goodsissue43State();
}

class _Goodsissue43State extends State<Goodsissue43> {

  MyEmpController empController = Get.put(MyEmpController());

  var selectedValue = 0;
  var selectedBranch = '';
  TextEditingController status = TextEditingController();

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
                  SizedBox(height: 30),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Goods Issue',style: TextStyle(color:kblue,fontSize: 35),
                            ),

                          ),
                          InkWell(onTap: (){
                            Get.to(AddGoodsIssue());
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


                          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                              stream: FirebaseFirestore.instance.collection('Branch').where('cid',isEqualTo: empController.myepmlist.value.cid).snapshots(),
                              builder: (context, snapshot) {

                                if(!snapshot.hasData){
                                  return kprogressbar;

                                }

                                var bDocs = snapshot.requireData.docs;

                                print('selectedBracnh $selectedBranch');

                                selectedBranch =selectedBranch == '' ? bDocs.first.id : selectedBranch;

                                return
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color:bgGrey,
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                    child: Padding(
                                      padding:   EdgeInsets.only(left: 8.0),
                                      child: DropdownButton(
                                          underline: Text(''),
                                          style: TextStyle(fontSize: 8,color: Colors.black),

                                          borderRadius: BorderRadius.circular(10),
                                          value: selectedValue,
                                          onChanged: (int? value){



                                            setState(() {
                                              selectedValue = value!;
                                              selectedBranch = bDocs[value].get('bid');
                                            });

                                          },
                                          items:
                                          bDocs.mapIndexed((index, element) => (DropdownMenuItem(child: Text(element.get('branch_name')),value: index,))).toList()

                                      ),
                                    ),
                                  );
                              }
                          ),



                        ],

                      ),


                      SizedBox( height: 20),

                      Container(
                        child: GetX(
                            init: Get.put<GoodsissueController>(GoodsissueController()),
                            builder: (GoodsissueController goodsissuecontroller){


                              goodsissuecontroller.init(selectedBranch); // INIT S
                              // TREAM WITH USERID

                              List<Goodsissuemodel> goods = goodsissuecontroller.goodsissue.value;

                              return ListView.builder(
                                  itemCount: goodsissuecontroller.goodsisu.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context,index){
                                return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: Get.width,

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
                                                          '${goods[index].issue}',
                                                          style: TextStyle(
                                                            color: Colors.yellow.shade600,
                                                            fontSize: 17,


                                                          ),
                                                        ),
                                                      ),     SizedBox(width: 35),
                                                      Text("${goodsissuecontroller.goodsisu[index].date}",style: TextStyle(
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
                                                '${goodsissuecontroller.goodsisu[index].description}',

                                                style: TextStyle(
                                                  color: Colors.white,fontSize: 15,
                                                ),
                                              ),



                                            ),

                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Center(
                                              child: Text(
                                                'Status: ${goodsissuecontroller.goodsisu[index].status}',

                                                style: TextStyle(
                                                  color: Colors.white,fontSize: 15,
                                                ),
                                              ),



                                            ),

                                          ),


                                          SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [

                                                ElevatedButton(
                                                    onPressed: (){


                                                  Get.defaultDialog(
                                                    title: 'Enter Status',
                                                    content: TextFormField(
                                                      controller: status,
                                                    ),
                                                    onConfirm: (){

                                                      FirebaseFirestore.instance.collection('Goodsissue')
                                                          .doc(goodsissuecontroller.goodsisu[index].id).update({'status'
                                                          :status.text
                                                      });
                                                      Get.back();
                                                    }
                                                  );


                                                },
                                                    child: Text('Change Status'),
                                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kyellow)),

                                                )

                                              ],
                                            ),
                                          ),








                                        ],
                                      ),

                                    ),
                                  ),

                                );
                              }) ;
            }),
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
