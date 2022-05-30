
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/Purchasing/addnewvendora.dart';
import 'package:revoo/Purchasing/editvendor.dart';

import '../constants/constants.dart';

class Vendorsa extends StatefulWidget {
  const Vendorsa({Key? key}) : super(key: key);
  @override
  _HRMSadmincustState createState() => _HRMSadmincustState();
}
class _HRMSadmincustState extends State<Vendorsa> {
  var firebase = FirebaseFirestore.instance.collection("vendors").snapshots();
  String initialValue = '';

  var itemList = [
    '',
    'Std11',
    'Std2',
    'Std3',
    'Std4',
    'Std5',
    'Std6',
    'Std88'
  ];
  var value1 = "branch";
  var value2 = "department";
  var items1 = ["branch","branch1","branch2","branch3","branch4"];
  var items2 = ["department","department1","department2","department3","department4"];



  RelativeRect buttonMenuPosition(BuildContext context1) {
    final RenderBox bar = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
    Overlay.of(context)?.context.findRenderObject() as RenderBox;
    const Offset offset = Offset(20, 20);
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(bar.size.center(offset), ancestor: overlay),
        bar.localToGlobal(bar.size.centerRight(offset), ancestor: overlay),
      ),
      offset & overlay.size,
    );
    return position;
  }


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
                            child: Text('Vendors',style: TextStyle(color:kblue,fontSize: 30),
                            ),
                          ),
                          InkWell(onTap: (){
                            Get.to(Addnewvendora());
                          },child: Image.asset('asset/addnew.png')),
                        ],
                      ),
                      SizedBox( height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'asset/filterimg.png',height: 20,width: 15,
                          ),
                          SizedBox( width : 5),
                          Text("Filter Result by :",style: TextStyle(color:kblue,fontSize: 20,)),
                        ],
                      ),
                      SizedBox( height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width:130 ,
                            height:35,
                            decoration: BoxDecoration(
                                color:  bgGrey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Center(
                                child: DropdownButton(
                                  value: value1,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: items1.map((items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: ( newValue) {
                                    setState(() {
                                      value1 = newValue.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width:160 ,
                            height:35,
                            decoration: BoxDecoration(
                                color:  bgGrey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Center(
                                child: DropdownButton(
                                  value: value2,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: items2.map((items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: ( newValue) {
                                    setState(() {
                                      value2 = newValue.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox( height: 20),
                      // StreamBuilder(builder: (context){}),
                      StreamBuilder(stream: firebase,builder: (context,AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
                        if(!snapshot.hasData){
                          return Center(child: Text("No Data"),);
                        }
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Kdblue,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListTile(
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: Get.width * 0.31,
                                            child: Text(
                                                snapshot.data!.docs[index]['vendor_name'],
                                              style: TextStyle(color: Colors.white),
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
                                                      '1',
                                                      style: TextStyle(color: Colors.white, fontSize: 2),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'RFQ',
                                                style: TextStyle(color: Colors.white, fontSize: 10),
                                              )
                                            ],
                                          ),

                                        ],
                                      ),
                                      subtitle: Text(
                                        snapshot.data!.docs[index]['address'],
                                        style: TextStyle(color: Colors.white, fontSize: 10),
                                      ),
                                      trailing: InkWell(
                                        child: Icon(Icons.more_vert, color: Colors.white),
                                        onTap: () {
                                          final RelativeRect position = buttonMenuPosition(context);

                                          showMenu(
                                            color: Kdblue,
                                            context: context,
                                            position: position,
                                            items: [
                                              PopupMenuItem<int>(
                                                value: 0,
                                                child: Row(
                                                  children: [
                                                    InkWell(child: Text(
                                                      'Edit',
                                                      style: TextStyle(fontSize: 25, color: Colors.white),
                                                    ),
                                                      onTap: (){

                                                        Get.to(Editvendors(name: snapshot.data!.docs[index]['vendor_name'],
                                                        email: snapshot.data!.docs[index]['email'],
                                                        phone: snapshot.data!.docs[index]['mobile'],
                                                        website: snapshot.data!.docs[index]['website'],
                                                        address:snapshot.data!.docs[index]['address'],
                                                        sales: snapshot.data!.docs[index]['sales_person'],
                                                        banknumber: snapshot.data!.docs[index]['bank_account_number'],
                                                        ifsc: snapshot.data!.docs[index]['ifsc_code'],
                                                        city: snapshot.data!.docs[index]['bank_city'],
                                                        branch:snapshot.data!.docs[index]['bank_branch'] ,
                                                        pmethod: snapshot.data!.docs[index]['paymentmethod'],
                                                        vcountry: snapshot.data!.docs[index]['country'],
                                                        vstate: snapshot.data!.docs[index]['state'],
                                                        vcity: snapshot.data!.docs[index]['city'],
                                                        vzipcode: snapshot.data!.docs[index]['zip_code'],
                                                        indID: snapshot.data!.docs[index].id,));
                                                      },),

                                                    SizedBox(width: 15,),


                                                    InkWell(child: Text(
                                                      'Delete',
                                                      style: TextStyle(fontSize: 25, color: Colors.white),
                                                    ),
                                                      onTap: (){
                                                        var a = snapshot.data!.docs[index].id;
                                                        FirebaseFirestore.instance.collection('vendors').doc(a).delete();
                                                        Get.back();
                                                      },),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                            }
                        );
                      }),
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

