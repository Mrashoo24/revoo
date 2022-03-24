import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SyncBnkStatemnt extends StatefulWidget {
  const SyncBnkStatemnt({Key? key}) : super(key: key);

  @override
  _SyncBnkStatemntState createState() => _SyncBnkStatemntState();
}

class _SyncBnkStatemntState extends State<SyncBnkStatemnt> {

  String initialValue = 'CBI';

  var itemList  = [
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
          child: Padding(
            padding:   EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Sync Bank Statement",style: TextStyle(color: kblue,fontSize: 35),),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: [

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
                        value: initialValue,
                        icon: Icon(Icons.keyboard_arrow_down,color: kblue,),
                        items: itemList.map((String items) {
                          return DropdownMenuItem(value: items, child: Text(items));
                        }).toList(), onChanged: (String? value) {  },

                      ),
                    ),

                    SizedBox(height: 25),

                    Container(
                      width: 200,
                      height: 35,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade900,
                            Colors.blue,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),


                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Sync',style: TextStyle(
                              color: Colors.white,fontSize: 15
                          ),),
                        ),
                      ),

                    ),









                  ],
                ),





              ],
            ),




          ),
        ),
      ),

    );
  }
}
