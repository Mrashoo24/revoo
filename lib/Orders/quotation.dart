import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';
import 'createquatationa.dart';

class Quotation extends StatefulWidget {
  const Quotation({Key? key}) : super(key: key);

  @override
  _HRMSadmincustState createState() => _HRMSadmincustState();
}

class _HRMSadmincustState extends State<Quotation> {
  String initialValue = '';
  var firestore = FirebaseFirestore.instance.collection('AddQuotation').snapshots();
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
                            child: Text('Quotation',style: TextStyle(color:kblue,fontSize: 35),
                            ),

                          ),
                          InkWell(onTap: (){
                            Get.to(Createquotation25());
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
                      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: firestore,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return Text("no data");
                          }
                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.requireData.docs.length,
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
                                              children: [
                                                Text(
                                                  'Product Name 1',
                                                  style: TextStyle(
                                                    color: Colors.yellow.shade600,
                                                    fontSize: 19,),),
                                                SizedBox(width: 15),
                                                Container(width: 100, height: 25, decoration: BoxDecoration(color: kyellow,
                                                  borderRadius: BorderRadius.circular(10),
                                                ), child: Center(child: Text('Accept', style: TextStyle(
                                                    color: Colors.black, fontSize: 15),),),),
                                                SizedBox(width: 5),
                                                Container(width: 100, height: 25, decoration: BoxDecoration(color: kyellow,
                                                  borderRadius: BorderRadius.circular(10),
                                                ), child: Center(child: Text('Reject', style: TextStyle(
                                                    color: Colors.black, fontSize: 15),),),),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                  BuildTextCard("Customer Name:  "),
                                                Text(
                                                  snapshot.data!.docs[index]['custumer_name'],
                                                  style: TextStyle(
                                                    color: Colors.white,fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                BuildTextCard("Customer Number:  "),
                                                Text(
                                                  snapshot.data!.docs[index]['custumer_number'],
                                                  style: TextStyle(
                                                    color: Colors.white,fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                BuildTextCard("Email:  "),
                                                Text(
                                                  snapshot.data!.docs[index]['email'],
                                                  style: TextStyle(
                                                    color: Colors.white,fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                BuildTextCard("Item Description:  "),
                                                Text(
                                                  snapshot.data!.docs[index]['item_description'],
                                                  style: TextStyle(
                                                    color: Colors.white,fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                              Row(
                                              children: [
                                                BuildTextCard("Quantity:  "),
                                                Text(
                                                  snapshot.data!.docs[index]['quantity'],
                                                  style: TextStyle(
                                                    color: Colors.white,fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),Row(
                                              children: [
                                                BuildTextCard("Amount:  "),
                                                Text(
                                                  snapshot.data!.docs[index]['amount'],
                                                  style: TextStyle(
                                                    color: Colors.white,fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),

                                          ],),),),),);});
                        }
                      ), SizedBox( height: 18),
                    ],),],),),),),),);}

  Text BuildTextCard(text) {
    return Text(
      text,
                                                style: TextStyle(
                                                  color: kyellow,fontSize: 12,
                                                ),
                                              );
  }
}
