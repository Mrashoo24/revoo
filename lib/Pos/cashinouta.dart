import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';
import 'cashinoutb.dart';

class Cashinouta extends StatefulWidget {
  const Cashinouta({Key? key}) : super(key: key);

  @override
  _CashinoutState createState() => _CashinoutState();
}

class _CashinoutState extends State<Cashinouta> {

  int _counter = 0;
  increment(){
    setState(() {
      _counter++;

    });
  }

  decrement(){
    setState(() {
      _counter--;

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
child: Scaffold(
  body: Container(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 41,
              width: Get.width,
              color: Kdblue,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Image.asset("asset/dollar.png"),
                  SizedBox(width: 15,),
                  Text("Cash In/Out",style: TextStyle(color: Colors.white,fontSize: 20,),),
                  SizedBox(width: 20,),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset("asset/arows .png"))
                ],
              ),
            ),
          ),

          SizedBox(height: 20),
          Padding(
            padding:   EdgeInsets.only(top: 10,bottom: 10,left: 30,right: 30),
            child: Container(

              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: bgGrey,
                    contentPadding: EdgeInsets.only(left: 20,top: 0,bottom: 20),
                    hintText: 'Search Products...',

                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),

                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),

                    enabledBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),

                    suffixIcon: Icon(Icons.search,color: kblue,size: 30,)


                ),
              ),
            ),
          ),
          Wrap(

            children: [
              Container(
                width: 120,color: bgGrey,
                child:  Column(
                  children: [
                    SizedBox(height: 10,),
                    Text("Rs 120 /-",style: TextStyle(color: kblue),),
                    Image.asset("asset/prflpic.png"),
                    Text("Product Name",style: TextStyle(color: kblue),),
                    SizedBox(height: 10,),
                    Container(
                      height: 30, width: 100,
                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(5),color: Colors.white,),

                      child: Row(
                        children: [
                          InkWell(
                            onTap: increment,
                            child: Icon(Icons.add,color: kblue,size: 20,),
                          ),

                          VerticalDivider(indent: 1,endIndent: 1,color: kblue,),
                          InkWell(
                            onTap :decrement ,

                            child: Icon(Icons.remove,color: kblue,size: 20,),
                          ),

                          SizedBox(width: 5),
                          Text("$_counter",style: TextStyle(fontSize: 14,color: kyellow),),

                        ],
                      ),

                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              SizedBox(width: 30),
              Container(
                width: 120,color: bgGrey,
                child:  Column(
                  children: [
                    SizedBox(height: 10,),
                    Text("Rs 120 /-",style: TextStyle(color: kblue),),
                    Image.asset("asset/prflpic.png"),
                    Text("Product Name",style: TextStyle(color: kblue),),
                    SizedBox(height: 10,),
                    Container(
                      height: 30, width: 100,
                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(5),color: Colors.white,),

                      child: Row(
                        children: [
                          InkWell(
                            onTap: increment,
                            child: Icon(Icons.add,color: kblue,size: 20,),
                          ),

                          VerticalDivider(indent: 1,endIndent: 1,color: kblue,),
                          InkWell(
                            onTap :decrement ,

                            child: Icon(Icons.remove,color: kblue,size: 20,),
                          ),

                          SizedBox(width: 5),
                          Text("$_counter",style: TextStyle(fontSize: 14,color: kyellow),),

                        ],
                      ),

                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ],

          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 100,color: Kdblue,
                    child: Column(
                      children: [
                        Padding(
                          padding:   EdgeInsets.only(top: 15),
                          child: Center(child: Text("Pay",style: TextStyle(color: Colors.white,fontSize: 35),)),
                        ),
                        SizedBox(height: 10),
                        Text("Rs 246",style: TextStyle(color:kyellow,fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: InkWell(
                    onTap:(){
                      Get.to(Cashinoutb());
                    },
                    child: Container(
                      height: 100,color: greytxtbx,
                      child: Column(
                        children: [
                          Padding(
                            padding:   EdgeInsets.only(top: 15),
                            child: Center(child: Text("View",style: TextStyle(color:Kdblue,fontSize: 35),)),
                          ),
                          SizedBox(height: 10),
                          Text("2 Items",style: TextStyle(color:kyellow,fontSize: 20),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),

  ),
),
    );
  }
}
