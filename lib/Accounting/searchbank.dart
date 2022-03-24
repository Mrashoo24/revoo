import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Searchbnk extends StatefulWidget {
  const Searchbnk({Key? key}) : super(key: key);

  @override
  _SearchbnkState createState() => _SearchbnkState();
}

class _SearchbnkState extends State<Searchbnk> {

  String initialValue = '';

  var itemList = [
    '',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7'
  ];

  bool  bvalue = false;

  bool  dvalue = false;

  bool  dvaluea = false;

  bool  dvaluec = false;

  var secIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding:   EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 40,width: 700,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: TextFormField(
                            decoration: InputDecoration(

                                filled: true,
                                fillColor: bgGrey,
                                hintText: "Search" ,

                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                                enabledBorder:OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                )

                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          flex: 1,
                          child: Container(

                            decoration: BoxDecoration(
                              color:  bgGrey,
                              borderRadius: BorderRadius.circular(15),


                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Filter',style: TextStyle(color: kblue,fontSize: 20),),
                                  ),
                                  SizedBox(width: 1),

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
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (context, index){
                        return Container(
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(backgroundColor: kblue,radius: 15,),

                                    Text("HDFC",style: TextStyle(fontSize: 20,color: kblue),),
                                    SizedBox(width: 15),
                                    Checkbox(

                                        value: secIndex == index,
                                        onChanged: (value){

                                          setState(() {
                                            secIndex = index;

                                          });

                                        }
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        );
                      } ),
                ],
              ),
            ),
          ),

        ),
      ),


    );
  }
}
