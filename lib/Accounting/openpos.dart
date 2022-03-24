import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Openpos extends StatefulWidget {
  const Openpos({Key? key}) : super(key: key);

  @override
  _OpenposState createState() => _OpenposState();
}

class _OpenposState extends State<Openpos> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Open POS",style: TextStyle(color: kblue,fontSize: 35),),
                      Text("POS #132",style: TextStyle(color: kyellow,fontSize: 35),),
                    ],
                  ),

                ),
              ),
              Divider(thickness: 2,color: Colors.grey,endIndent: 10,indent: 10,),
              SizedBox(height: 40),
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
                          DataColumn(label: Text('All POS(s)',style: TextStyle(fontSize: 25,color: kblue),),),
                          DataColumn(label: Text('Last Opened',style: TextStyle(
                              fontSize: 25,

                              color: kblue
                          ),),),





                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(
                                Text('#145',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),
                            DataCell(
                                Text('Mar 15',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),







                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('#145',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),
                            DataCell(
                                Text('Mar 15',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),







                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('#145',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),
                            DataCell(
                                Text('Mar 15',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),







                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('#145',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),
                            DataCell(
                                Text('Mar 15',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),







                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('#145',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),
                            DataCell(
                                Text('Mar 15',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),







                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('#145',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),
                            DataCell(
                                Text('Mar 15',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),







                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('#145',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),
                            DataCell(
                                Text('Mar 15',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),







                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('#145',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),
                            DataCell(
                                Text('Mar 15',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),







                          ]),
                          DataRow(cells: [
                            DataCell(
                                Text('#145',style: TextStyle(fontSize: 20,color: kyellow),)
                            ),
                            DataCell(
                                Text('Mar 15',style: TextStyle(fontSize: 20,color: kyellow),)
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

    );
  }
}
