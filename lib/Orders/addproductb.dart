import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Addproduct24 extends StatefulWidget {
  const Addproduct24({Key? key}) : super(key: key);

  @override
  _Addproduct24State createState() => _Addproduct24State();
}

class _Addproduct24State extends State<Addproduct24> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
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
                            SizedBox(width: 120),
                            Image.asset('asset/bellicon.png'),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset('asset/settingsicon.png'),
                            SizedBox(
                              width: 6,
                            ),
                            Image.asset('asset/usericon.png'),
                            SizedBox(width: 10),
                          ],
                        ),
                        Align(alignment: Alignment.centerLeft,
                          child: Text(
                            "Add Product",
                            style: TextStyle(fontSize: 30, height: 3, color: kblue),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Product",
                              style: TextStyle(color: kblue),
                            )),
                        SizedBox(height: 3),
                        Divider(
                          height: 1,
                        ),
                        SizedBox(height: 3),
                        Container(
                          height: 32,
                          child: Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: bgGrey,
                                contentPadding:
                                EdgeInsets.only(left: 20, top: 2, bottom: 3),
                                hintStyle: TextStyle(color: Colors.grey),
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kblue,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                              ),
                            ),
                          ),
                        ),



                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Quantity",
                            style: TextStyle(color: kblue),
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        SizedBox(height: 3),


                        Container(
                          height: 32,
                          child: Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: bgGrey,
                                contentPadding:
                                EdgeInsets.only(left: 20, top: 2, bottom: 3),
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Price per unit",
                            style: TextStyle(color: kblue),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          height: 2,
                        ),
                        SizedBox(height: 5),

                        Container(
                          height: 32,
                          child: Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: bgGrey,
                                contentPadding:
                                EdgeInsets.only(left: 20, top: 2, bottom: 3),
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Description",
                            style: TextStyle(color: kblue),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          height: 2,
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 100,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: bgGrey,
                                       contentPadding:
                              EdgeInsets.all(100),
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                            ),
                          ),
                        ),






                        Row(
                          children: [

                            SizedBox(height: 30),
                            SizedBox(width: 161),

                          ],
                        ),

                        Column(
                          children: [

                            SizedBox(height: 10),

                            Align(alignment: Alignment.centerRight,
                              child:  Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(onPressed: (){

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
                                  SizedBox(width: 25,),
                                  InkWell(
                                    onTap: (){

                                    },
                                    child: Container(
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
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text('Add',style: TextStyle(
                                              color: Colors.white,fontSize: 15
                                          ),),
                                        ),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
