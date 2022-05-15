import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/HRMS_admin_Screen/adbranchpg1.dart';
import 'package:revoo/HRMS_admin_Screen/editbranch.dart';

import '../constants/constants.dart';
import 'adbranchpg2.dart';

class DBcrud4 extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;
  const DBcrud4({Key? key, required this.userDoc}) : super(key: key);

  @override
  _DBcrud4State createState() => _DBcrud4State();
}

class _DBcrud4State extends State<DBcrud4> {
  int groupvalue = 0;
  int yesvslue = 0;
  int novalue = 1;

  var selectedCard = 'Home'; //for changing name
  var selectedindex = 0; //f
  GlobalKey<ScaffoldState> scafkey = GlobalKey<ScaffoldState>();

  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  var firestore = FirebaseFirestore.instance;

  TextEditingController nameController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    RelativeRect buttonMenuPosition(BuildContext context) {
      final RenderBox bar = context.findRenderObject() as RenderBox;
      final RenderBox overlay =
          Overlay.of(context)?.context.findRenderObject() as RenderBox;
      const Offset offset = Offset(200, 200);
      final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(
          bar.localToGlobal(bar.size.center(offset), ancestor: overlay),
          bar.localToGlobal(bar.size.centerRight(offset), ancestor: overlay),
        ),
        offset & overlay.size,
      );
      return position;
    }

    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: firestore.collection('Branch').where('cid',isEqualTo: widget.userDoc.get('cid')).snapshots(),
          builder: (context, snapshot) {

            if(!snapshot.hasData){
              return kprogressbar;
            }

            var  bdoc = snapshot.requireData.docs;

            return Stack(
              children: [
                Container(
                  width: Get.width,
                  child: ClipRRect(
                      child: Image.asset(
                    'asset/dpbrCRUD.png',
                    fit: BoxFit.fill,
                  )),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'All Branches',
                                    style: TextStyle(color: kblue, fontSize: 25),
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      Get.to(AddBranches());
                                    },
                                    child: Image.asset('asset/addnew.png')),
                              ],
                            ),
                            SizedBox(height: 25),
                            Container(
                              width: 400,
                              height: 500,
                              decoration: BoxDecoration(
                                color: bgGrey,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 180, top: 30, bottom: 10),
                                      child: Text(
                                        'Branch(s)',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 400,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              kblue,
                                              Kdblue,
                                            ],
                                          ),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(45),
                                              bottomRight: Radius.circular(45)),
                                        ),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: bdoc.length,
                                          itemBuilder: (context,index){
                                            return   buildListTile(
                                                buttonMenuPosition, context,
                                                title: bdoc[index].get('branch_name'),
                                                tagcolor: kyellow,id:bdoc[index].id,
                                              bdoc: bdoc[index]
                                            );
                                          }

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        ),


      ),
    );
  }

   buildListTile(RelativeRect buttonMenuPosition(BuildContext context),
      BuildContext context,
      {required String title, required Color tagcolor,required id,required QueryDocumentSnapshot<Map<String, dynamic>> bdoc}) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Container(
                width: 140,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 40),
              CircleAvatar(
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: tagcolor,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Employees',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  SizedBox(width: 10,),
                  IconButton(icon:Icon(Icons.edit),color: Colors.white, onPressed: () async {
                    Get.to(EditBranches(latlist: bdoc.get('location'), name: title, address: bdoc.get('address'), id: id, locality: bdoc.get('locality')));
                 // await   showDialog(
                 //        context: context,
                 //        builder: (context) {
                 //          return StatefulBuilder(
                 //              builder: (context, setState1) {
                 //                return AlertDialog(
                 //                  contentPadding:
                 //                  EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                 //                  shape: RoundedRectangleBorder(
                 //                      borderRadius: BorderRadius.circular(50)),
                 //                  content: SingleChildScrollView(
                 //                    child: Column(
                 //                      children: [
                 //                        Container(
                 //                          width: 400,
                 //                          height: 400,
                 //                          decoration: BoxDecoration(
                 //                              border: Border.all(
                 //                                  width: 2, color: kblue),
                 //                              borderRadius:
                 //                              BorderRadius.circular(50)),
                 //                          child: Padding(
                 //                            padding: const EdgeInsets.all(8.0),
                 //                            child: Column(
                 //                              children: [
                 //                                Align(
                 //                                  alignment: Alignment.topRight,
                 //                                  child: InkWell(
                 //                                    onTap: () {
                 //                                      Get.back();
                 //                                    },
                 //                                    child: CircleAvatar(
                 //                                      child: Icon(Icons.close),
                 //                                      backgroundColor: Kdblue,
                 //                                    ),
                 //                                  ),
                 //                                ),
                 //                                Text(
                 //                                  'Rename Branch Name',
                 //                                  style: TextStyle(
                 //                                      fontSize: 30,
                 //                                      color: kblue),
                 //                                ),
                 //                                SizedBox(height: 10),
                 //                                TextFormField(
                 //                                  controller: nameController,
                 //                                  decoration: InputDecoration(
                 //                                      filled: true,
                 //                                      fillColor: bgGrey,
                 //                                      contentPadding:
                 //                                      EdgeInsets.only(
                 //                                          left: 20,
                 //                                          top: 25,
                 //                                          bottom: 25),
                 //                                      hintText: 'Choose a Name',
                 //                                      hintStyle: TextStyle(
                 //                                          color: Colors.grey),
                 //                                      border: OutlineInputBorder(
                 //                                          borderSide: BorderSide(
                 //                                              color: Colors
                 //                                                  .white)),
                 //                                      focusedBorder:
                 //                                      OutlineInputBorder(
                 //                                          borderSide: BorderSide(
                 //                                              color: Colors
                 //                                                  .white)),
                 //                                      enabledBorder:
                 //                                      OutlineInputBorder(
                 //                                          borderSide: BorderSide(
                 //                                              color: Colors
                 //                                                  .white))),
                 //                                ),
                 //                                SizedBox(height: 100),
                 //                                Row(
                 //                                  mainAxisSize:
                 //                                  MainAxisSize.min,
                 //                                  children: [
                 //                                    ElevatedButton(
                 //                                        onPressed: () {
                 //                                          Get.back();
                 //                                        },
                 //                                        style: ElevatedButton.styleFrom(
                 //                                            elevation: 0,
                 //                                            shape: RoundedRectangleBorder(
                 //                                                borderRadius:
                 //                                                BorderRadius.all(
                 //                                                    Radius.circular(
                 //                                                        10))),
                 //                                            side: BorderSide(
                 //                                                width: 3.0,
                 //                                                color: kblue),
                 //                                            primary:
                 //                                            Colors.white,
                 //                                            padding: EdgeInsets
                 //                                                .symmetric(
                 //                                                horizontal:
                 //                                                32,
                 //                                                vertical:
                 //                                                11),
                 //                                            textStyle: TextStyle(
                 //                                                fontSize: 30,
                 //                                                fontWeight:
                 //                                                FontWeight
                 //                                                    .bold)),
                 //                                        child: Center(
                 //                                            child: Text(
                 //                                              '< Back',
                 //                                              style: TextStyle(
                 //                                                  color: kblue,
                 //                                                  fontSize: 15),
                 //                                            ))),
                 //                                    SizedBox(
                 //                                      width: 25,
                 //                                    ),
                 //                                    InkWell(
                 //                                      onTap: () async {
                 //                                        await firestore.collection('Branch').doc(id).update(
                 //                                            {
                 //                                              'branch_name' : nameController
                 //                                            });
                 //                                      },
                 //                                      child: Container(
                 //                                        width: 110,
                 //                                        height: 41,
                 //                                        decoration: BoxDecoration(
                 //                                          gradient:
                 //                                          LinearGradient(
                 //                                            colors: [
                 //                                              Colors
                 //                                                  .blue.shade900,
                 //                                              Colors.blue,
                 //                                            ],
                 //                                            begin:
                 //                                            Alignment.topLeft,
                 //                                            end: Alignment
                 //                                                .bottomRight,
                 //                                          ),
                 //                                          borderRadius:
                 //                                          BorderRadius
                 //                                              .circular(10),
                 //                                        ),
                 //                                        child: Padding(
                 //                                          padding:
                 //                                          const EdgeInsets
                 //                                              .all(8.0),
                 //                                          child: Center(
                 //                                            child: Text(
                 //                                              'Rename',
                 //                                              style: TextStyle(
                 //                                                  color: Colors
                 //                                                      .white,
                 //                                                  fontSize: 15),
                 //                                            ),
                 //                                          ),
                 //                                        ),
                 //                                      ),
                 //                                    ),
                 //                                  ],
                 //                                ),
                 //                              ],
                 //                            ),
                 //                          ),
                 //                        ),
                 //                      ],
                 //                    ),
                 //                  ),
                 //                );
                 //              });
                 //        });
                  },)
                ],
              ),

            ],
          ),

          // InkWell(
          //   child: Icon(Icons.more_vert, color: Colors.white),
          //   onTap: () {
          //     final RelativeRect position = buttonMenuPosition(context);
          //
          //     showMenu(
          //       color: Kdblue,
          //       context: context,
          //       position: position,
          //       items: [
          //         PopupMenuItem<int>(
          //           value: 0,
          //           child: Row(
          //             children: [
          //               Text(
          //                 'Action',
          //                 style: TextStyle(fontSize: 25, color: Colors.white),
          //               ),
          //               Icon(Icons.more_vert, color: Colors.white),
          //             ],
          //           ),
          //         ),
          //         PopupMenuItem<int>(
          //           value: 0,
          //           child: Divider(
          //             height: 33,
          //             thickness: 2,
          //             color: Colors.white,
          //             endIndent: 10,
          //             indent: 10,
          //           ),
          //         ),
          //         PopupMenuItem<int>(
          //           value: 0,
          //           child: InkWell(
          //             onTap: () {
          //               print('clickedf');
          //
          //               showDialog(
          //                   context: context,
          //                   builder: (context) {
          //                     return StatefulBuilder(
          //                         builder: (context, setState1) {
          //                           return AlertDialog(
          //                             contentPadding:
          //                             EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          //                             shape: RoundedRectangleBorder(
          //                                 borderRadius: BorderRadius.circular(50)),
          //                             content: SingleChildScrollView(
          //                               child: Column(
          //                                 children: [
          //                                   Container(
          //                                     width: 400,
          //                                     height: 400,
          //                                     decoration: BoxDecoration(
          //                                         border: Border.all(
          //                                             width: 2, color: kblue),
          //                                         borderRadius:
          //                                         BorderRadius.circular(50)),
          //                                     child: Padding(
          //                                       padding: EdgeInsets.only(top: 8.0),
          //                                       child: Column(
          //                                         children: [
          //                                           Align(
          //                                             alignment:
          //                                             Alignment(1.0, 10.0),
          //                                             child: InkWell(
          //                                               onTap: () {
          //                                                 Get.back();
          //                                               },
          //                                               child: Padding(
          //                                                 padding:
          //                                                 const EdgeInsets.all(
          //                                                     10.0),
          //                                                 child: CircleAvatar(
          //                                                   child: Icon(
          //                                                     Icons.close,
          //                                                   ),
          //                                                   backgroundColor: Kdblue,
          //                                                   radius: 12,
          //                                                 ),
          //                                               ),
          //                                             ),
          //                                           ),
          //                                           Text(
          //                                             'Duplicate Branch',
          //                                             style: TextStyle(
          //                                                 fontSize: 30,
          //                                                 color: kblue),
          //                                           ),
          //                                           SizedBox(height: 10),
          //                                           Container(
          //                                             width: 200,
          //                                             height: 50,
          //                                             child: TextFormField(
          //                                               decoration: InputDecoration(
          //                                                   filled: true,
          //                                                   fillColor: bgGrey,
          //                                                   contentPadding:
          //                                                   EdgeInsets.only(
          //                                                       left: 20,
          //                                                       top: 25,
          //                                                       bottom: 25),
          //                                                   hintText:
          //                                                   'Choose a Name',
          //                                                   hintStyle: TextStyle(
          //                                                       color: Colors.grey),
          //                                                   border: OutlineInputBorder(
          //                                                       borderSide:
          //                                                       BorderSide(
          //                                                           color: Colors
          //                                                               .white)),
          //                                                   focusedBorder:
          //                                                   OutlineInputBorder(
          //                                                       borderSide: BorderSide(
          //                                                           color: Colors
          //                                                               .white)),
          //                                                   enabledBorder:
          //                                                   OutlineInputBorder(
          //                                                       borderSide: BorderSide(
          //                                                           color: Colors
          //                                                               .white))),
          //                                             ),
          //                                           ),
          //                                           SizedBox(height: 20),
          //                                           Text(
          //                                             'Copy all attributes',
          //                                             style: TextStyle(
          //                                                 fontSize: 28,
          //                                                 color: Colors.grey),
          //                                           ),
          //                                           ButtonBar(
          //                                             alignment:
          //                                             MainAxisAlignment.center,
          //                                             children: [
          //                                               Row(
          //                                                 children: [
          //                                                   Radio(
          //                                                     value: yesvslue,
          //                                                     groupValue:
          //                                                     groupvalue,
          //                                                     onChanged:
          //                                                         (int? value) {
          //                                                       setState(() {
          //                                                         groupvalue =
          //                                                         value!;
          //                                                       });
          //                                                       setState1(() {});
          //                                                     },
          //                                                   ),
          //                                                   Text(
          //                                                     'Yes',
          //                                                     style: TextStyle(
          //                                                         fontSize: 15,
          //                                                         color:
          //                                                         Colors.grey),
          //                                                   ),
          //                                                   Radio(
          //                                                     value: novalue,
          //                                                     groupValue:
          //                                                     groupvalue,
          //                                                     onChanged:
          //                                                         (int? value) {
          //                                                       setState(() {
          //                                                         groupvalue =
          //                                                         value!;
          //                                                       });
          //                                                       setState1(() {});
          //                                                     },
          //                                                   ),
          //                                                   Text(
          //                                                     'No',
          //                                                     style: TextStyle(
          //                                                         fontSize: 15,
          //                                                         color:
          //                                                         Colors.grey),
          //                                                   ),
          //                                                 ],
          //                                               ),
          //                                             ],
          //                                           ),
          //                                           SizedBox(height: 25),
          //                                           Row(
          //                                             mainAxisSize:
          //                                             MainAxisSize.min,
          //                                             children: [
          //                                               ElevatedButton(
          //                                                   onPressed: () {
          //                                                     Get.back();
          //                                                   },
          //                                                   style: ElevatedButton.styleFrom(
          //                                                       elevation: 0,
          //                                                       shape: RoundedRectangleBorder(
          //                                                           borderRadius:
          //                                                           BorderRadius.all(
          //                                                               Radius.circular(
          //                                                                   10))),
          //                                                       side: BorderSide(
          //                                                           width: 3.0,
          //                                                           color: kblue),
          //                                                       primary:
          //                                                       Colors.white,
          //                                                       padding: EdgeInsets
          //                                                           .symmetric(
          //                                                           horizontal:
          //                                                           32,
          //                                                           vertical:
          //                                                           11),
          //                                                       textStyle: TextStyle(
          //                                                           fontSize: 30,
          //                                                           fontWeight:
          //                                                           FontWeight
          //                                                               .bold)),
          //                                                   child: Center(
          //                                                       child: Text(
          //                                                         '< Back',
          //                                                         style: TextStyle(
          //                                                             color: kblue,
          //                                                             fontSize: 15),
          //                                                       ))),
          //                                               SizedBox(
          //                                                 width: 25,
          //                                               ),
          //                                               InkWell(
          //                                                 onTap: () {
          //                                                   Get.to(DBcrud4(userDoc: widget.userDoc,));
          //                                                 },
          //                                                 child: Container(
          //                                                   width: 110,
          //                                                   height: 41,
          //                                                   decoration:
          //                                                   BoxDecoration(
          //                                                     gradient:
          //                                                     LinearGradient(
          //                                                       colors: [
          //                                                         Colors.blue
          //                                                             .shade900,
          //                                                         Colors.blue,
          //                                                       ],
          //                                                       begin: Alignment
          //                                                           .topLeft,
          //                                                       end: Alignment
          //                                                           .bottomRight,
          //                                                     ),
          //                                                     borderRadius:
          //                                                     BorderRadius
          //                                                         .circular(10),
          //                                                   ),
          //                                                   child: Padding(
          //                                                     padding:
          //                                                     const EdgeInsets
          //                                                         .all(8.0),
          //                                                     child: Center(
          //                                                       child: Text(
          //                                                         'Duplicate',
          //                                                         style: TextStyle(
          //                                                             color: Colors
          //                                                                 .white,
          //                                                             fontSize: 15),
          //                                                       ),
          //                                                     ),
          //                                                   ),
          //                                                 ),
          //                                               ),
          //                                             ],
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                           );
          //                         });
          //                   });
          //             },
          //             child: Row(
          //               children: [
          //                 Image.asset('asset/actiona.png'),
          //                 SizedBox(width: 10),
          //                 Text(
          //                   'Duplicate',
          //                   style: TextStyle(fontSize: 20, color: Colors.white),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         PopupMenuItem<int>(
          //           value: 1,
          //           child: InkWell(
          //             onTap: () {
          //               print('clickedf');
          //
          //               showDialog(
          //                   context: context,
          //                   builder: (context) {
          //                     return StatefulBuilder(
          //                         builder: (context, setState1) {
          //                           return AlertDialog(
          //                             contentPadding:
          //                             EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          //                             shape: RoundedRectangleBorder(
          //                                 borderRadius: BorderRadius.circular(50)),
          //                             content: SingleChildScrollView(
          //                               child: Column(
          //                                 children: [
          //                                   Container(
          //                                     width: 400,
          //                                     height: 400,
          //                                     decoration: BoxDecoration(
          //                                         border: Border.all(
          //                                             width: 2, color: kblue),
          //                                         borderRadius:
          //                                         BorderRadius.circular(50)),
          //                                     child: Padding(
          //                                       padding: const EdgeInsets.all(8.0),
          //                                       child: Column(
          //                                         children: [
          //                                           Align(
          //                                             alignment: Alignment.topRight,
          //                                             child: InkWell(
          //                                               onTap: () {
          //                                                 Get.back();
          //                                               },
          //                                               child: CircleAvatar(
          //                                                 child: Icon(Icons.close),
          //                                                 backgroundColor: Kdblue,
          //                                               ),
          //                                             ),
          //                                           ),
          //                                           Text(
          //                                             'Rename Branch Name',
          //                                             style: TextStyle(
          //                                                 fontSize: 30,
          //                                                 color: kblue),
          //                                           ),
          //                                           SizedBox(height: 10),
          //                                           TextFormField(
          //                                             decoration: InputDecoration(
          //                                                 filled: true,
          //                                                 fillColor: bgGrey,
          //                                                 contentPadding:
          //                                                 EdgeInsets.only(
          //                                                     left: 20,
          //                                                     top: 25,
          //                                                     bottom: 25),
          //                                                 hintText: 'Choose a Name',
          //                                                 hintStyle: TextStyle(
          //                                                     color: Colors.grey),
          //                                                 border: OutlineInputBorder(
          //                                                     borderSide: BorderSide(
          //                                                         color: Colors
          //                                                             .white)),
          //                                                 focusedBorder:
          //                                                 OutlineInputBorder(
          //                                                     borderSide: BorderSide(
          //                                                         color: Colors
          //                                                             .white)),
          //                                                 enabledBorder:
          //                                                 OutlineInputBorder(
          //                                                     borderSide: BorderSide(
          //                                                         color: Colors
          //                                                             .white))),
          //                                           ),
          //                                           SizedBox(height: 100),
          //                                           Row(
          //                                             mainAxisSize:
          //                                             MainAxisSize.min,
          //                                             children: [
          //                                               ElevatedButton(
          //                                                   onPressed: () {
          //                                                     Get.back();
          //                                                   },
          //                                                   style: ElevatedButton.styleFrom(
          //                                                       elevation: 0,
          //                                                       shape: RoundedRectangleBorder(
          //                                                           borderRadius:
          //                                                           BorderRadius.all(
          //                                                               Radius.circular(
          //                                                                   10))),
          //                                                       side: BorderSide(
          //                                                           width: 3.0,
          //                                                           color: kblue),
          //                                                       primary:
          //                                                       Colors.white,
          //                                                       padding: EdgeInsets
          //                                                           .symmetric(
          //                                                           horizontal:
          //                                                           32,
          //                                                           vertical:
          //                                                           11),
          //                                                       textStyle: TextStyle(
          //                                                           fontSize: 30,
          //                                                           fontWeight:
          //                                                           FontWeight
          //                                                               .bold)),
          //                                                   child: Center(
          //                                                       child: Text(
          //                                                         '< Back',
          //                                                         style: TextStyle(
          //                                                             color: kblue,
          //                                                             fontSize: 15),
          //                                                       ))),
          //                                               SizedBox(
          //                                                 width: 25,
          //                                               ),
          //                                               Container(
          //                                                 width: 110,
          //                                                 height: 41,
          //                                                 decoration: BoxDecoration(
          //                                                   gradient:
          //                                                   LinearGradient(
          //                                                     colors: [
          //                                                       Colors
          //                                                           .blue.shade900,
          //                                                       Colors.blue,
          //                                                     ],
          //                                                     begin:
          //                                                     Alignment.topLeft,
          //                                                     end: Alignment
          //                                                         .bottomRight,
          //                                                   ),
          //                                                   borderRadius:
          //                                                   BorderRadius
          //                                                       .circular(10),
          //                                                 ),
          //                                                 child: Padding(
          //                                                   padding:
          //                                                   const EdgeInsets
          //                                                       .all(8.0),
          //                                                   child: Center(
          //                                                     child: Text(
          //                                                       'Duplicate',
          //                                                       style: TextStyle(
          //                                                           color: Colors
          //                                                               .white,
          //                                                           fontSize: 15),
          //                                                     ),
          //                                                   ),
          //                                                 ),
          //                                               ),
          //                                             ],
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                           );
          //                         });
          //                   });
          //             },
          //             child: Row(
          //               children: [
          //                 Image.asset('asset/actionb.png'),
          //                 SizedBox(width: 10),
          //                 Text(
          //                   'Rename',
          //                   style: TextStyle(fontSize: 20, color: Colors.white),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //         PopupMenuItem<int>(
          //           value: 2,
          //           child: InkWell(
          //             onTap: () {
          //               print('clickedf');
          //
          //               showDialog(
          //                   context: context,
          //                   builder: (context) {
          //                     return StatefulBuilder(
          //                         builder: (context, setState1) {
          //                           return AlertDialog(
          //                             contentPadding:
          //                             EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          //                             shape: RoundedRectangleBorder(
          //                                 borderRadius: BorderRadius.circular(50)),
          //                             content: SingleChildScrollView(
          //                               child: Column(
          //                                 children: [
          //                                   Container(
          //                                     width: 400,
          //                                     height: 400,
          //                                     decoration: BoxDecoration(
          //                                         border: Border.all(
          //                                             width: 2, color: kblue),
          //                                         borderRadius:
          //                                         BorderRadius.circular(50)),
          //                                     child: Padding(
          //                                       padding: EdgeInsets.only(top: 8.0),
          //                                       child: Column(
          //                                         children: [
          //                                           Align(
          //                                             alignment:
          //                                             Alignment(1.0, 10.0),
          //                                             child: Padding(
          //                                               padding:
          //                                               const EdgeInsets.all(
          //                                                   10.0),
          //                                               child: CircleAvatar(
          //                                                 child: Icon(
          //                                                   Icons.close,
          //                                                 ),
          //                                                 backgroundColor: Kdblue,
          //                                                 radius: 12,
          //                                               ),
          //                                             ),
          //                                           ),
          //                                           SizedBox(height: 10),
          //                                           Container(
          //                                             width: 200,
          //                                             height: 50,
          //                                           ),
          //                                           SizedBox(height: 15),
          //                                           Image.asset('asset/dldim.png'),
          //                                           Text(
          //                                             'Your download starts in...',
          //                                             style: TextStyle(
          //                                                 fontSize: 22,
          //                                                 color: Colors.grey),
          //                                           ),
          //                                           Text(
          //                                             '5s',
          //                                             style: TextStyle(
          //                                                 fontSize: 22,
          //                                                 color: kblue),
          //                                           ),
          //                                           SizedBox(height: 10),
          //                                           Text(
          //                                             'Cancel',
          //                                             style: TextStyle(
          //                                                 fontSize: 22,
          //                                                 color: kblue),
          //                                           ),
          //                                           SizedBox(height: 25),
          //                                           Row(
          //                                             mainAxisSize:
          //                                             MainAxisSize.min,
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                           );
          //                         });
          //                   });
          //             },
          //             child: Row(
          //               children: [
          //                 Image.asset('asset/actionc.png'),
          //                 SizedBox(width: 10),
          //                 Text(
          //                   'Download',
          //                   style: TextStyle(fontSize: 20, color: Colors.white),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         PopupMenuItem<int>(
          //           value: 3,
          //           child: InkWell(
          //             onTap: () {
          //               print('clickedf');
          //
          //               Get.defaultDialog(
          //                 title: '',
          //                 content:
          //                 StatefulBuilder(builder: (context, setState1) {
          //                   return Container(
          //                     width: 400,
          //                     height: 400,
          //                     decoration: BoxDecoration(
          //                       color: Colors.white,
          //                     ),
          //                     child: Padding(
          //                       padding: const EdgeInsets.all(8.0),
          //                       child: Column(
          //                         children: [
          //                           Align(
          //                             alignment: Alignment.topRight,
          //                             child: CircleAvatar(
          //                               child: Icon(Icons.close),
          //                               backgroundColor: Kdblue,
          //                             ),
          //                           ),
          //                           Text(
          //                             'Duplicate Branch',
          //                             style:
          //                             TextStyle(fontSize: 30, color: kblue),
          //                           ),
          //                           SizedBox(height: 10),
          //                           SizedBox(height: 25),
          //                           Row(
          //                             mainAxisSize: MainAxisSize.min,
          //                             children: [
          //                               Container(
          //                                 width: 230,
          //                                 height: 50,
          //                                 decoration: BoxDecoration(
          //                                   color: greytxtbx,
          //                                   borderRadius:
          //                                   BorderRadius.circular(0),
          //                                 ),
          //                                 child: Padding(
          //                                   padding: const EdgeInsets.all(8.0),
          //                                   child: Center(
          //                                     child: Text(
          //                                       'Duplicate',
          //                                       style: TextStyle(
          //                                           color: Colors.white,
          //                                           fontSize: 15),
          //                                     ),
          //                                   ),
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   );
          //                 }),
          //               );
          //             },
          //             child: Row(
          //               children: [
          //                 Image.asset('asset/actiond.png'),
          //                 SizedBox(width: 10),
          //                 Text(
          //                   'Add Domain',
          //                   style: TextStyle(fontSize: 20, color: Colors.white),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         // PopupMenuItem<int>(
          //         //   value: 4,
          //         //   child: InkWell(
          //         //     child: Row(
          //         //       children: [
          //         //         Image.asset('asset/actione.png'),
          //         //         SizedBox(width: 10),
          //         //         Text(
          //         //           'Tags',
          //         //           style: TextStyle(fontSize: 20, color: Colors.white),
          //         //         )
          //         //       ],
          //         //     ),
          //         //   ),
          //         // ),
          //         PopupMenuItem<int>(
          //           value: 5,
          //           child: InkWell(
          //             onTap: () {
          //               print('clickedf');
          //
          //               showDialog(
          //                   context: context,
          //                   builder: (context) {
          //                     return StatefulBuilder(
          //                         builder: (context, setState1) {
          //                           return AlertDialog(
          //                             contentPadding:
          //                             EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          //                             shape: RoundedRectangleBorder(
          //                                 borderRadius: BorderRadius.circular(50)),
          //                             content: SingleChildScrollView(
          //                               child: Column(
          //                                 children: [
          //                                   Container(
          //                                     width: 400,
          //                                     height: 400,
          //                                     decoration: BoxDecoration(
          //                                         border: Border.all(
          //                                             width: 2, color: kblue),
          //                                         borderRadius:
          //                                         BorderRadius.circular(50)),
          //                                     child: Padding(
          //                                       padding: EdgeInsets.only(top: 8.0),
          //                                       child: Column(
          //                                         children: [
          //                                           Align(
          //                                             alignment:
          //                                             Alignment(1.0, 10.0),
          //                                             child: Padding(
          //                                               padding:
          //                                               const EdgeInsets.all(
          //                                                   10.0),
          //                                               child: CircleAvatar(
          //                                                 child: Icon(
          //                                                   Icons.close,
          //                                                 ),
          //                                                 backgroundColor: Kdblue,
          //                                                 radius: 12,
          //                                               ),
          //                                             ),
          //                                           ),
          //                                           SizedBox(height: 5),
          //                                           Image.asset(
          //                                               'asset/exclamatory.png'),
          //                                           Text(
          //                                             'Deleting Branch',
          //                                             style: TextStyle(
          //                                                 fontSize: 30,
          //                                                 color: kblue),
          //                                           ),
          //                                           Text(
          //                                             'Lorem ipsum dolor sit amet',
          //                                             style: TextStyle(
          //                                                 fontSize: 12,
          //                                                 color: Colors.grey),
          //                                           ),
          //                                           SizedBox(height: 15),
          //                                           Text(
          //                                             'Backup Branch?',
          //                                             style: TextStyle(
          //                                                 fontSize: 22,
          //                                                 color: kblue),
          //                                           ),
          //                                           Text(
          //                                             '       Click here to create\n a backup for your branch!',
          //                                             style: TextStyle(
          //                                                 fontSize: 15,
          //                                                 color: kyellow),
          //                                           ),
          //                                           SizedBox(height: 10),
          //                                           Row(
          //                                             mainAxisSize:
          //                                             MainAxisSize.min,
          //                                             children: [
          //                                               ElevatedButton(
          //                                                   onPressed: () {
          //                                                     Get.back();
          //                                                   },
          //                                                   style: ElevatedButton.styleFrom(
          //                                                       elevation: 0,
          //                                                       shape: RoundedRectangleBorder(
          //                                                           borderRadius:
          //                                                           BorderRadius.all(
          //                                                               Radius.circular(
          //                                                                   10))),
          //                                                       side: BorderSide(
          //                                                           width: 3.0,
          //                                                           color: kblue),
          //                                                       primary:
          //                                                       Colors.white,
          //                                                       padding: EdgeInsets
          //                                                           .symmetric(
          //                                                           horizontal:
          //                                                           32,
          //                                                           vertical:
          //                                                           11),
          //                                                       textStyle: TextStyle(
          //                                                           fontSize: 30,
          //                                                           fontWeight:
          //                                                           FontWeight
          //                                                               .bold)),
          //                                                   child: Center(
          //                                                       child: Text(
          //                                                         '< Back',
          //                                                         style: TextStyle(
          //                                                             color: kblue,
          //                                                             fontSize: 15),
          //                                                       ))),
          //                                               SizedBox(
          //                                                 width: 25,
          //                                               ),
          //                                               Container(
          //                                                 width: 110,
          //                                                 height: 41,
          //                                                 decoration: BoxDecoration(
          //                                                   color: reddy,
          //                                                   borderRadius:
          //                                                   BorderRadius
          //                                                       .circular(10),
          //                                                 ),
          //                                                 child: Padding(
          //                                                   padding:
          //                                                   const EdgeInsets
          //                                                       .all(8.0),
          //                                                   child: Center(
          //                                                     child: Text(
          //                                                       'Duplicate',
          //                                                       style: TextStyle(
          //                                                           color: Colors
          //                                                               .white,
          //                                                           fontSize: 15),
          //                                                     ),
          //                                                   ),
          //                                                 ),
          //                                               ),
          //                                             ],
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                           );
          //                         });
          //                   });
          //             },
          //             child: Row(
          //               children: [
          //                 Image.asset('asset/actionf.png'),
          //                 SizedBox(width: 10),
          //                 Text(
          //                   'Delete',
          //                   style: TextStyle(fontSize: 20, color: Colors.white),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         PopupMenuItem<int>(
          //           value: 6,
          //           child: Divider(
          //             height: 10,
          //             thickness: 2,
          //             color: Colors.white,
          //             endIndent: 10,
          //             indent: 10,
          //           ),
          //         ),
          //         PopupMenuItem<int>(
          //           value: 7,
          //           child: InkWell(
          //             onTap: () {
          //               print('clickedf');
          //
          //               showDialog(
          //                   context: context,
          //                   builder: (context) {
          //                     return StatefulBuilder(builder: (context, setState1) {
          //                       return AlertDialog(
          //                         contentPadding:
          //                             EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          //                         shape: RoundedRectangleBorder(
          //                             borderRadius: BorderRadius.circular(50)),
          //                         content: SingleChildScrollView(
          //                           child: Column(
          //                             children: [
          //                               Container(
          //                                 width: 500,
          //                                 height: 500,
          //                                 decoration: BoxDecoration(
          //                                     border: Border.all(
          //                                         width: 2, color: kblue),
          //                                     borderRadius:
          //                                         BorderRadius.circular(50)),
          //                                 child: Padding(
          //                                   padding: const EdgeInsets.all(8.0),
          //                                   child: Center(
          //                                     child: Column(
          //                                       children: [
          //                                         Align(
          //                                           alignment: Alignment.topRight,
          //                                           child: CircleAvatar(
          //                                             child: Icon(Icons.close),
          //                                             backgroundColor: Kdblue,
          //                                           ),
          //                                         ),
          //                                         Text(
          //                                           'Invite Users',
          //                                           style: TextStyle(
          //                                               fontSize: 30, color: kblue),
          //                                         ),
          //                                         SizedBox(height: 10),
          //                                         TextFormField(
          //                                           decoration: InputDecoration(
          //                                               filled: true,
          //                                               fillColor: bgGrey,
          //                                               contentPadding:
          //                                                   EdgeInsets.only(
          //                                                       left: 20,
          //                                                       top: 25,
          //                                                       bottom: 25),
          //                                               hintText: 'Enter Name',
          //                                               hintStyle: TextStyle(
          //                                                   color: Colors.grey),
          //                                               border: OutlineInputBorder(
          //                                                   borderSide: BorderSide(
          //                                                       color:
          //                                                           Colors.white)),
          //                                               focusedBorder:
          //                                                   OutlineInputBorder(
          //                                                       borderSide:
          //                                                           BorderSide(
          //                                                               color: Colors
          //                                                                   .white)),
          //                                               enabledBorder:
          //                                                   OutlineInputBorder(
          //                                                       borderSide: BorderSide(
          //                                                           color: Colors
          //                                                               .white))),
          //                                         ),
          //                                         TextFormField(
          //                                           decoration: InputDecoration(
          //                                               filled: true,
          //                                               fillColor: bgGrey,
          //                                               contentPadding:
          //                                                   EdgeInsets.only(
          //                                                       left: 20,
          //                                                       top: 25,
          //                                                       bottom: 25),
          //                                               hintText: 'Enter E-mail',
          //                                               hintStyle: TextStyle(
          //                                                   color: Colors.grey),
          //                                               border: OutlineInputBorder(
          //                                                   borderSide: BorderSide(
          //                                                       color:
          //                                                           Colors.white)),
          //                                               focusedBorder:
          //                                                   OutlineInputBorder(
          //                                                       borderSide:
          //                                                           BorderSide(
          //                                                               color: Colors
          //                                                                   .white)),
          //                                               enabledBorder:
          //                                                   OutlineInputBorder(
          //                                                       borderSide: BorderSide(
          //                                                           color: Colors
          //                                                               .white))),
          //                                         ),
          //                                         TextFormField(
          //                                           decoration: InputDecoration(
          //                                               filled: true,
          //                                               fillColor: bgGrey,
          //                                               contentPadding:
          //                                                   EdgeInsets.only(
          //                                                       left: 20,
          //                                                       top: 25,
          //                                                       bottom: 25),
          //                                               hintText: 'Determine Role',
          //                                               hintStyle: TextStyle(
          //                                                   color: Colors.grey),
          //                                               border: OutlineInputBorder(
          //                                                   borderSide: BorderSide(
          //                                                       color:
          //                                                           Colors.white)),
          //                                               focusedBorder:
          //                                                   OutlineInputBorder(
          //                                                       borderSide:
          //                                                           BorderSide(
          //                                                               color: Colors
          //                                                                   .white)),
          //                                               enabledBorder:
          //                                                   OutlineInputBorder(
          //                                                       borderSide: BorderSide(
          //                                                           color: Colors
          //                                                               .white))),
          //                                         ),
          //                                         DropdownButtonHideUnderline(
          //                                           child: DropdownButton(
          //                                             hint: Text(
          //                                               'Select Item',
          //                                               style: TextStyle(
          //                                                 fontSize: 14,
          //                                                 color: Theme.of(context)
          //                                                     .hintColor,
          //                                               ),
          //                                             ),
          //                                             items: items
          //                                                 .map((item) =>
          //                                                     DropdownMenuItem<
          //                                                         String>(
          //                                                       value: item,
          //                                                       child: Text(
          //                                                         item,
          //                                                         style:
          //                                                             const TextStyle(
          //                                                           fontSize: 14,
          //                                                         ),
          //                                                       ),
          //                                                     ))
          //                                                 .toList(),
          //                                             value: selectedValue,
          //                                             onChanged: (value) {
          //                                               setState(() {
          //                                                 selectedValue =
          //                                                     value as String;
          //                                               });
          //                                             },
          //                                           ),
          //                                         ),
          //                                         SizedBox(width: 50),
          //                                         Row(
          //                                           children: [
          //                                             Image.asset(
          //                                                 'asset/pluss.png'),
          //                                             Text(
          //                                               'Add more users',
          //                                               style: TextStyle(
          //                                                   fontSize: 15,
          //                                                   color: kblue),
          //                                             ),
          //                                           ],
          //                                         ),
          //                                         SizedBox(height: 20),
          //                                         Row(
          //                                           mainAxisSize: MainAxisSize.min,
          //                                           children: [
          //                                             ElevatedButton(
          //                                                 onPressed: () {
          //                                                   Get.back();
          //                                                 },
          //                                                 style: ElevatedButton.styleFrom(
          //                                                     elevation: 0,
          //                                                     shape: RoundedRectangleBorder(
          //                                                         borderRadius:
          //                                                             BorderRadius.all(
          //                                                                 Radius.circular(
          //                                                                     10))),
          //                                                     side: BorderSide(
          //                                                         width: 3.0,
          //                                                         color: kblue),
          //                                                     primary: Colors.white,
          //                                                     padding: EdgeInsets
          //                                                         .symmetric(
          //                                                             horizontal:
          //                                                                 32,
          //                                                             vertical: 11),
          //                                                     textStyle: TextStyle(
          //                                                         fontSize: 30,
          //                                                         fontWeight:
          //                                                             FontWeight
          //                                                                 .bold)),
          //                                                 child: Center(
          //                                                     child: Text(
          //                                                   '< Back',
          //                                                   style: TextStyle(
          //                                                       color: kblue,
          //                                                       fontSize: 15),
          //                                                 ))),
          //                                             SizedBox(
          //                                               width: 25,
          //                                             ),
          //                                             Container(
          //                                               width: 110,
          //                                               height: 41,
          //                                               decoration: BoxDecoration(
          //                                                 gradient: LinearGradient(
          //                                                   colors: [
          //                                                     Colors.blue.shade900,
          //                                                     Colors.blue,
          //                                                   ],
          //                                                   begin:
          //                                                       Alignment.topLeft,
          //                                                   end: Alignment
          //                                                       .bottomRight,
          //                                                 ),
          //                                                 borderRadius:
          //                                                     BorderRadius.circular(
          //                                                         10),
          //                                               ),
          //                                               child: Padding(
          //                                                 padding:
          //                                                     const EdgeInsets.all(
          //                                                         8.0),
          //                                                 child: Center(
          //                                                   child: Text(
          //                                                     'Duplicate',
          //                                                     style: TextStyle(
          //                                                         color:
          //                                                             Colors.white,
          //                                                         fontSize: 15),
          //                                                   ),
          //                                                 ),
          //                                               ),
          //                                             ),
          //                                           ],
          //                                         ),
          //                                       ],
          //                                     ),
          //                                   ),
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       );
          //                     });
          //                   });
          //             },
          //             child: Row(
          //               children: [
          //                 Image.asset('asset/actionh.png'),
          //                 SizedBox(width: 10),
          //                 Text(
          //                   'Invite Users',
          //                   style: TextStyle(fontSize: 20, color: Colors.white),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         PopupMenuItem<int>(
          //           value: 8,
          //           child: Row(
          //             children: [
          //               Image.asset('asset/actionh.png'),
          //               SizedBox(width: 10),
          //               Text(
          //                 'Remove Users',
          //                 style: TextStyle(fontSize: 20, color: Colors.white),
          //               )
          //             ],
          //           ),
          //         ),
          //         PopupMenuItem<int>(
          //           value: 9,
          //           child: Divider(
          //             height: 10,
          //             thickness: 2,
          //             color: Colors.white,
          //             endIndent: 10,
          //             indent: 10,
          //           ),
          //         ),
          //         PopupMenuItem<int>(
          //           value: 10,
          //           child: Row(
          //             children: [
          //               Image.asset('asset/actiong.png'),
          //               SizedBox(width: 10),
          //               Text(
          //                 'Contact Support',
          //                 style: TextStyle(fontSize: 20, color: Colors.white),
          //               )
          //             ],
          //           ),
          //         ),
          //         PopupMenuItem<int>(
          //           value: 11,
          //           child: Container(
          //             width: 400,
          //             decoration: BoxDecoration(
          //                 color: kyellow,
          //                 borderRadius: BorderRadius.all(Radius.circular(10))),
          //             child: ListTile(
          //               title: Row(
          //                 children: [
          //                   SizedBox(width: 20, height: 50),
          //                   Text(
          //                     'Upgrade',
          //                     style: TextStyle(fontSize: 30, color: Kdblue),
          //                   ),
          //                   SizedBox(width: 15),
          //                   Image.asset(
          //                     'asset/actionj.png',
          //                     color: Kdblue,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ),
        Divider(
          height: 10,
          thickness: 4,
          color: Kdblue,
          endIndent: 10,
          indent: 10,
        ),
      ],
    );
  }


  buildDrawer(){
   return  Drawer(
      child:  Card(
        color: Colors.grey.shade200,
        shape: Border(
          right: BorderSide(style: BorderStyle.none),


        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: SingleChildScrollView(
            child: Column(

              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('asset/profile.jfif'),
                      radius: 30,
                    ),
                    SizedBox(width: 20,),
                    Align(
                      alignment: Alignment.bottomLeft,

                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text('Name of the person',style: TextStyle(fontSize: 20,color: kblue),
                                      textAlign: TextAlign.left
                                  )),
                            ),
                            Container(


                                child: Text('Role/Designation',style: TextStyle(fontSize: 18,color: kblue),
                                    textAlign: TextAlign.left
                                )),
                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                        child: Text('Veiw Profile',style: TextStyle(fontSize: 15,color: kyellow),
                                        )),
                                    SizedBox(width: 15,),
                                    Image.asset('asset/rightarrow.png')
                                  ],

                                ),

                              ),

                            ),


                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30,),
                buildNavCard('asset/home.png','My Account',0),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/checkgrp.png','My Plan',1),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/checkpad.png','My Branches',2),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/lvapproval.png','My Departments',3),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/lvapproval.png','My Employees',3),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                buildNavCard('asset/lvapproval.png','Shifts Management',3),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                SizedBox(height: 5,),
                buildNavCard('asset/lvapproval.png','Help',3),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),

                buildNavCard('asset/logoff.png','Logout',4),
                SizedBox(height: 5,),


              ],
            ),
          ),

        ),

      ),
    );
  }


  buildNavCard(String image,String name,index) {

    return InkWell(
      onTap: (){
        setState(() {
          selectedCard = name;
          selectedindex = index;
        });
        Get.back();
      },
      child: Card(
        color: selectedCard == name ?  Colors.white : bgGrey,
        elevation: selectedCard == name ? 2 : 0,
        child: Container(
          height: 70,
          child: Padding(

            padding: const EdgeInsets.only(left: 15.0,top: 10,bottom: 10,right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Image.asset(image,color: Kdblue,width: 20,height: 20,),

                SizedBox(width: 10,),

                Text(name,style: TextStyle(color: Colors.grey,fontSize: 20),),

              ],
            ),
          ),
        ),

      ),
    );
  }

}
