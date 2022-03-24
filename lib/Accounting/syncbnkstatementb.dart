import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SyncBnkStatemntB extends StatefulWidget {
  const SyncBnkStatemntB({Key? key}) : super(key: key);

  @override
  _SyncBnkStatemntBState createState() => _SyncBnkStatemntBState();
}

class _SyncBnkStatemntBState extends State<SyncBnkStatemntB> {

  String initialValueaa = 'CBI';

  var itemListaa  = [
    'CBI',
    'AXIS',
    'SBI',
    'BROADA',
    'BBB',

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Sync Bank Statement",style: TextStyle(color: kblue,fontSize: 35),),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Select Account',style: TextStyle(fontSize: 18,color:kblue ),)),
                  Divider(
                    height: 5,thickness: 1,color: kblue,
                  ),

                  Container(

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
                      value: initialValueaa,
                      icon: Icon(Icons.keyboard_arrow_down,color: kblue,),
                      items: itemListaa.map((String items) {
                        return DropdownMenuItem(value: items, child: Text(items));
                      }).toList(), onChanged: (String? value) {  },

                    ),
                  ),

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("HDFC",style: TextStyle(color: kblue,fontSize: 20),),
                      CircleAvatar(backgroundColor: kblue,radius: 20,),
                    ],
                  ),

                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Text("Debits",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 5,color: kblue,),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Transaction 1",style: TextStyle(fontSize: 20,color: kblue),),
                            Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                          ],
                        ),
                        Divider(thickness: 2,color: kblue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Transaction 1",style: TextStyle(fontSize: 20,color: kblue),),
                            Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                          ],
                        ),
                        Divider(thickness: 2,color: kblue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Transaction 1",style: TextStyle(fontSize: 20,color: kblue),),
                            Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                          ],
                        ),
                        Divider(thickness: 2,color: kblue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Transaction 1",style: TextStyle(fontSize: 20,color: kblue),),
                            Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                          ],
                        ),
                        Divider(thickness: 2,color: kblue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Transaction 1",style: TextStyle(fontSize: 20,color: kblue),),
                            Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                          ],
                        ),
                        Divider(thickness: 2,color: kblue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Amount",style: TextStyle(fontSize: 20,color: kblue),),
                            Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                          ],
                        ),
                        Divider(thickness: 2,color: kblue,)
                      ],
                    ),
                  ),

                  SizedBox(height: 25,),
                  Row(
                    children: [
                      Text("Credits",style: TextStyle(fontSize: 20,color: kblue),),
                    ],
                  ),
                  Divider(thickness: 5,color: kblue,),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Transaction 1",style: TextStyle(fontSize: 20,color: kblue),),
                            Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                          ],
                        ),
                        Divider(thickness: 2,color: kblue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Transaction 1",style: TextStyle(fontSize: 20,color: kblue),),
                            Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                          ],
                        ),
                        Divider(thickness: 2,color: kblue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Transaction 1",style: TextStyle(fontSize: 20,color: kblue),),
                            Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                          ],
                        ),
                        Divider(thickness: 2,color: kblue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Transaction 1",style: TextStyle(fontSize: 20,color: kblue),),
                            Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                          ],
                        ),
                        Divider(thickness: 2,color: kblue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Transaction 1",style: TextStyle(fontSize: 20,color: kblue),),
                            Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                          ],
                        ),
                        Divider(thickness: 2,color: kblue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Amount",style: TextStyle(fontSize: 20,color: kblue),),
                            Text("\$8954",style: TextStyle(fontSize: 20,color: kblue),),
                          ],
                        ),
                        Divider(thickness: 2,color: kblue,)
                      ],
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
