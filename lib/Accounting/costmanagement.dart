import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class CostMgmt extends StatefulWidget {
  const CostMgmt({Key? key}) : super(key: key);

  @override
  _CostMgmtState createState() => _CostMgmtState();
}

class _CostMgmtState extends State<CostMgmt> {

  String initialValue = 'January';

  var itemList  = [
    'January',
    'February',
    'March',
    'April',
    'May',"June","July","August","September","October","November","December"
  ];

  String initialValuea = 'January';

  var itemLista  = [
    'January',
    'February',
    'March',
    'April',
    'May',"June","July","August","September","October","November","December"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:   EdgeInsets.all(20.0),
                  child:  Column(
                    children: [



                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Cost Management',style: TextStyle(color:kblue,fontSize: 35),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 40),

                      Container(
                        child: Column(
                          children: [

                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Fiscal Year',style: TextStyle(fontSize: 18,color:kblue ),)),
                            Divider(
                              height: 5,thickness: 1,color: kblue,
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 37,

                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                              child: TextFormField(
                                decoration: InputDecoration(

                                    filled: true,
                                    fillColor: bgGrey,

                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    enabledBorder:OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    )

                                ),
                              ),
                            ),




                          ],
                        ),
                      ),



                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text('Start Month',style: TextStyle(fontSize: 18,color:kblue ),),
                                    Divider(
                                      height: 5,thickness: 1,color: kblue,
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      height: 30,width: 150,

                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,borderRadius: new BorderRadius.circular(10.0),
                                      ),
                                      margin: EdgeInsets.symmetric(horizontal: 3),
                                      child: DropdownButton(
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
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('End Month',style: TextStyle(fontSize: 18,color:kblue ),),
                                    Divider(
                                      height: 5,thickness: 1,color: kblue,
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      height: 30,width: 150,

                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,borderRadius: new BorderRadius.circular(10.0),
                                      ),
                                      margin: EdgeInsets.symmetric(horizontal: 3),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        iconEnabledColor: Colors.blue ,
                                        style: TextStyle(color: Colors.grey, fontSize: 18),
                                        dropdownColor: Colors.grey.shade200,
                                        focusColor: Colors.black,
                                        value: initialValuea,
                                        icon: Icon(Icons.keyboard_arrow_down,color: kblue,),
                                        items: itemLista.map((String items) {
                                          return DropdownMenuItem(value: items, child: Text(items));
                                        }).toList(), onChanged: (String? value) {  },

                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          children: [

                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Currency',style: TextStyle(fontSize: 18,color:kblue ),)),
                            Divider(
                              height: 5,thickness: 1,color: kblue,
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 37,

                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                              child: TextFormField(
                                decoration: InputDecoration(

                                    filled: true,
                                    fillColor: bgGrey,

                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    enabledBorder:OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    )

                                ),
                              ),
                            ),




                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          children: [

                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Country',style: TextStyle(fontSize: 18,color:kblue ),)),
                            Divider(
                              height: 5,thickness: 1,color: kblue,
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 37,

                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                              child: TextFormField(
                                decoration: InputDecoration(

                                    filled: true,
                                    fillColor: bgGrey,

                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    enabledBorder:OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    )

                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            Container(
                              child: Column(
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text('Credit',style: TextStyle(fontSize: 18,color:kblue ),),
                                          Divider(
                                            height: 5,thickness: 1,color: kblue,
                                          ),
                                          SizedBox(height: 4),
                                          Container(
                                            height: 37,
                                            width: 160,
                                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                                            child: TextFormField(
                                              decoration: InputDecoration(

                                                  filled: true,
                                                  fillColor: bgGrey,

                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.white),
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.white),
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  ),
                                                  enabledBorder:OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.white),
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  )

                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text('Debit',style: TextStyle(fontSize: 18,color:kblue ),),
                                          Divider(
                                            height: 5,thickness: 1,color: kblue,
                                          ),
                                          SizedBox(height: 4),
                                          Container(
                                            height: 37,
                                            width: 160,
                                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                                            child: TextFormField(
                                              decoration: InputDecoration(

                                                  filled: true,
                                                  fillColor: bgGrey,

                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.white),
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.white),
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  ),
                                                  enabledBorder:OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.white),
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  )

                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),




                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          children: [

                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Balance',style: TextStyle(fontSize: 18,color:kblue ),)),
                            Divider(
                              height: 5,thickness: 1,color: kblue,
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 37,

                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                              child: TextFormField(
                                decoration: InputDecoration(

                                    filled: true,
                                    fillColor: bgGrey,

                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    enabledBorder:OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    )

                                ),
                              ),
                            ),




                          ],
                        ),
                      ),


                      SizedBox(height: 25),
                      Align(
                        alignment: Alignment(1,1),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              child: ElevatedButton(onPressed: (){

                              },

                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape:RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      side: BorderSide(width: 3.0, color: kblue ),
                                      primary: Colors.white,
                                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 11),
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  child: Center(child: Text('Clear',style: TextStyle(
                                      color: kblue,fontSize: 15
                                  ),))),
                            ),
                            SizedBox(width: 25,),
                            Container(
                              width: 110,
                              height: 41,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue.shade900,
                                    Colors.blue,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10),


                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text('Add',style: TextStyle(
                                      color: Colors.white,fontSize: 15
                                  ),),
                                ),
                              ),

                            ),


                          ],
                        ),
                      ),


                    ],
                  ),
                ),
                Container(
                  height: 50,width: Get.width,color: Kdblue,
                  child: Padding(
                    padding:   EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Reports",style: TextStyle(color: Colors.white,fontSize: 25),)),
                  ),
                ),
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

                            DataColumn(label: Text('Account',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey
                            ),),),
                            DataColumn(label: Text('P/S',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey
                            ),),),
                            DataColumn(label: Text('Debit',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color:Colors.grey
                            ),),),
                            DataColumn(label: Text('Credit',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey
                            ),),),
                            DataColumn(label: Text('Balance',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey
                            ),),),




                          ],
                          rows: [
                            DataRow(cells: [

                              DataCell(
                                  Text('Sales',style: TextStyle(color: Colors.grey),)
                              ),
                              DataCell(
                                  Text('P',style: TextStyle(color: Colors.grey),)
                              ),
                              DataCell(
                                  Text('\$899',style: TextStyle(color: Colors.grey),)
                              ),
                              DataCell(
                                    Text("\$899",style: TextStyle(color: Colors.grey ,fontSize: 12),),
                              ),
                              DataCell(
                                Text("\$899",style: TextStyle(color: Colors.grey ,fontSize: 12),),
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

    );
  }
}
