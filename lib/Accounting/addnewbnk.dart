import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revoo/constants/constants.dart';

class Addnwbnk extends StatefulWidget {
  const Addnwbnk({Key? key}) : super(key: key);

  @override
  _AddnwbnkState createState() => _AddnwbnkState();
}

class _AddnwbnkState extends State<Addnwbnk> {
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
                    Text("Add New Bank",style: TextStyle(color: kblue,fontSize: 35),),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("HDFC Bank",style: TextStyle(color: kblue,fontSize: 20),),
                    CircleAvatar(backgroundColor: kblue,radius: 15,),
                  ],
                ),

                SizedBox(height: 20),
                Column(
                  children: [

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Branch',style: TextStyle(fontSize: 18,color:kblue ),)),
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

                SizedBox(height: 20),
                Column(
                  children: [

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Account Number',style: TextStyle(fontSize: 18,color:kblue ),)),
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


                SizedBox(height: 20),
                Column(
                  children: [

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Account Type',style: TextStyle(fontSize: 18,color:kblue ),)),
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


                SizedBox(height: 20),
                Column(
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


                SizedBox(height: 20),
                Column(
                  children: [

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('IFSC Code',style: TextStyle(fontSize: 18,color:kblue ),)),
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

        ),
      ),

    );
  }
}
