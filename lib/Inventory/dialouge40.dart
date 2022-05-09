import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../constants/constants.dart';
import '../constants/constants.dart';
import '../constants/constants.dart';

class Productstatusbar extends StatefulWidget {
  const Productstatusbar({Key? key}) : super(key: key);

  @override
  _ProductstatusbarState createState() => _ProductstatusbarState();
}

class _ProductstatusbarState extends State<Productstatusbar> {


  var itemList = ['', 'Std1', 'Std2', 'Std3', 'Std4', 'Std5', 'Std6', 'Std7','Std9s'];

  var itemList1 = ['', 'in', 'out', ];
  String initialValue = '';












  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            print('clicked');
                          },
                          child: Image.asset(
                            'asset/navicon.png',
                          )),
                      Row(
                        children: [
                          SizedBox(width: 110),
                          Image.asset('asset/bellicon.png'),
                          SizedBox(width: 20),
                          Image.asset('asset/settingsicon.png'),
                          SizedBox(width: 20),
                          Image.asset('asset/usericon.png'),
                        ],
                      ),
                    ],
                  ),
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
                              'Product',
                              style: TextStyle(color: kblue, fontSize: 35),
                            ),
                          ),
                          InkWell(
                              onTap: () {

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
                          SizedBox(width: 10),
                          Container(
                            width: 110,
                            height: 25,
                            decoration: BoxDecoration
                              (
                                color: bgGrey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(width: 40),
                                  DropdownButton(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList.map((String items) {
                                      return DropdownMenuItem(
                                          value: items, child: Text(items));
                                    }).toList(),
                                    onChanged: (String? value) {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  DataTable(
                    horizontalMargin: 20,
                    columnSpacing: 20,
                    columns: [
                      DataColumn(
                          label: Text(
                        "Product Name",
                        style:
                            TextStyle(fontSize: 10,color: Colors.grey.shade600),
                      )
                      ),

                      DataColumn(
                          label: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "Status",
                                style:
                                TextStyle(fontSize: 10,color: Colors.grey.shade600),
                              ),
                            ),
                          )),
                      DataColumn(
                          label: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0),
                            child: Center(
                              child: Text(
                                "Action",
                                style:
                                TextStyle(fontSize: 10,color: Colors.grey.shade600),
                              ),
                            ),
                          )),



                    ],
                    rows: [

                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),
                      DataRow(

                          cells: [
                            DataCell(Text("Task 1 subtitle",style: TextStyle(fontSize: 12),)),



                            DataCell(   Container(
                              margin: EdgeInsets.symmetric(vertical: 10),


                              child: Align(alignment:Alignment.centerRight ,

                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration
                                    (

                                    borderRadius: BorderRadius.circular(10),color: bgGrey,
                                  ),

                                  child:     DropdownButton(
                                    value: initialValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Kdblue,
                                    ),
                                    items: itemList1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items, child: Text(items,style:TextStyle(color: Colors.green),),);
                                    }).toList(), onChanged: (String? value,) {
                                    setState(() {
                                      initialValue = value!;
                                    });
                                    print('value $value $initialValue');

                                  },

                                  ),
                                ),
                              ),
                            ),
                            ),

                            DataCell(   Container(

                              margin: EdgeInsets.symmetric(vertical: 10),
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
                              child: Center(
                                child: Text('Exit',style: TextStyle(
                                    color: Colors.white,fontSize: 10
                                ),),
                              ),

                            ),),








                          ]),








          ],
                    border: TableBorder.all(color: Colors.black),

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
