import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import '../Controllers/branchController.dart';
import '../constants/constants.dart';
import 'adbranchpg2.dart';
import 'addshift.dart';

class ShiftsManagement extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;
  const ShiftsManagement({Key? key, required this.userDoc}) : super(key: key);

  @override
  _ShiftsManagementState createState() => _ShiftsManagementState();
}

class _ShiftsManagementState extends State<ShiftsManagement> {
  var selectedValue = "";



  @override
  Widget build(BuildContext context) {

    List<TableRow> tableRow = [
      TableRow(
        children: [
          Container(
            height: 30,
            child: Center(
              child: Text(
                'Shift Id',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: Text(
                'Timing',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: AutoSizeText(
                'No.Employee',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: AutoSizeText(
                ' ',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          Container(
            height: 60,

            child: Center(
              child: Text(
                'EVE1',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: Text(
                '9:00AM-6.30PM',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: Text(
                '50',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: ElevatedButton(
                onPressed: (){
                  Get.defaultDialog(
                    title: ("E Raju")
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Kdblue)
                ),
                child: Text(
                  'EDIT',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),


    ];

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Shifts',
                  style: TextStyle(color: kblue, fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Image.asset('asset/filter.png'),
                  // SizedBox(width: 10,),
                  // Text(
                  //   'Filter by:',
                  //   style: TextStyle(color: kblue, fontSize: 14),
                  // ),
                  SizedBox(width: 8,),
                  // Container(
                  //   height: 30,
                  //   width: Get.width*0.33,
                  //   decoration: BoxDecoration(
                  //       color:bgGrey,
                  //       borderRadius: BorderRadius.circular(100)
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //     child:  GetX(
                  //         init: Get.put<BranchController>(BranchController()),
                  //         builder: (BranchController branchController) {
                  //
                  //
                  //           print('list = ${branchController.branchList}');
                  //
                  //
                  //           if(branchController.branchList.value.isEmpty){
                  //             return Text('No Data');
                  //
                  //           }
                  //
                  //           var firstValue = branchController.branchList.value.first.bid!;
                  //           return  Container(
                  //             height: 30,
                  //             width: Get.width*0.33,
                  //             decoration: BoxDecoration(
                  //                 color:bgGrey,
                  //                 borderRadius: BorderRadius.circular(100)
                  //             ),
                  //             child: Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //               child: DropdownButton(
                  //
                  //
                  //                   underline: Text(''),
                  //
                  //                   borderRadius: BorderRadius.circular(10),
                  //                   value: selectedValue == '' ? firstValue : selectedValue,
                  //                   onChanged: (String? value){
                  //
                  //
                  //
                  //                     setState(() {
                  //                       selectedValue = value!;
                  //                       branchController.departmentController.branchId.value = value;
                  //                     });
                  //                     print('d =$selectedValue');
                  //                   },
                  //
                  //                   items: branchController.branchList.value.map((e){
                  //
                  //                     return DropdownMenuItem(child: Text(e.branchName!),value: e.bid!,);
                  //
                  //                   }).toList()
                  //
                  //               ),
                  //             ),
                  //           );
                  //         }
                  //     ),
                  //   ),
                  // ),

                  InkWell(
                      onTap: () {

                        Get.to(AddShift(userDoc: widget.userDoc,));

                      },
                      child: Image.asset('asset/addnew.png')
                  ),
                  SizedBox(width: 30,),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection('Shifts').where('cid',isEqualTo: widget.userDoc.get('cid')).snapshots(),
              builder: (context, snapshot) {



                if(!snapshot.hasData){
                  return kprogressbar;
                }

                var  edoc = snapshot.requireData.docs;

                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: Get.width,
                    height: 300,
                    child:    Column(
                      children: [
                        Table(
                            border: TableBorder.symmetric(inside:BorderSide(color: Kdblue),outside:BorderSide(color: Kdblue)),
                            children: [
                              tableRow[0],

                            ]



                        ),
                        Table(
                            border: TableBorder.symmetric(inside:BorderSide(color: Kdblue),outside:BorderSide(color: Colors.white)),
                            children: edoc.mapIndexed((index, e) {

                              return       TableRow(
                                children: [

                                  Container(
                                    height: 60,

                                    child: Center(
                                      child: Text(
                                        index.toString(),
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    child: Center(
                                      child: Text(
                                        e.get('time'),
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                                      stream: FirebaseFirestore.instance.collection('Employee').where('shiftid',isEqualTo: e.id).snapshots(),
                                    builder: (context, empsnapshot) {

                                      if(!empsnapshot.hasData){
                                        return kprogressbar;
                                      }

                                      var  edoc1 = empsnapshot.requireData.docs;

                                      return Container(
                                        height: 60,
                                        child: Center(
                                          child: AutoSizeText(
                                            edoc1.length.toString(),
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      );
                                    }
                                  ),
                                  Container(
                                    height: 60,
                                    child: Center(
                                      child: Icon(Icons.edit),
                                    ),
                                  ),
                                ],
                              );
                            }).toList()



                        ),
                      ],
                    ),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
