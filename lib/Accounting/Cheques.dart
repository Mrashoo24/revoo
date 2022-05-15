import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/constants/constants.dart';

class Cheques extends StatefulWidget {
  const Cheques({Key? key}) : super(key: key);

  @override
  _ChequesState createState() => _ChequesState();
}

class _ChequesState extends State<Cheques> {

  String initialValue = 'Past Month';

  var itemList  = [
    'Past Month',
    'Recent',
    'Previous',
    'Last Month',

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding:   EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Cheques",style: TextStyle(color: kblue,fontSize: 30),),

                      Image.asset('asset/addnew.png'),
                    ],
                  ),




                  Divider(thickness: 2,color: Colors.grey,endIndent: 10,indent: 10,),
                  DropdownButton(
                    isExpanded: true,
                    iconEnabledColor: Colors.blue ,
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                    dropdownColor: Colors.grey.shade200,
                    focusColor: Colors.black,
                    value: initialValue,
                    icon: Icon(Icons.keyboard_arrow_down,color: kblue,),
                    items: itemList.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(), onChanged: (String? value) {  },

                  ),



                  SizedBox(height: 30),
                  Container(
                    height: Get.height,
                    width: Get.width,

                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          DataTable(
                            columns: [
                              DataColumn(label: Text(' ',style: TextStyle(fontSize: 25,color: kblue),),),
                              DataColumn(label: Text(' ',style: TextStyle(
                                  fontSize: 25,

                                  color: kblue
                              ),),),





                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(
                                    Text('Cheques Issued',style: TextStyle(fontSize: 20,color: Kdblue),)
                                ),
                                DataCell(
                                    Text('32',style: TextStyle(fontSize: 20,color: kyellow),)
                                ),








                              ]),
                              DataRow(cells: [
                                DataCell(
                                    Text('Cheques Pending',style: TextStyle(fontSize: 20,color: Kdblue),)
                                ),
                                DataCell(
                                    Text('32',style: TextStyle(fontSize: 20,color: kyellow),)
                                ),








                              ]),
                              DataRow(cells: [
                                DataCell(
                                    Text('Cheques Approved',style: TextStyle(fontSize: 20,color: Kdblue),)
                                ),
                                DataCell(
                                    Text('32',style: TextStyle(fontSize: 20,color: kyellow),)
                                ),








                              ]),


                            ],
                          ),
                        ],
                      ),
                    ),

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
