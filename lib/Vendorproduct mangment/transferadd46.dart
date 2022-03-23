import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Transfercontact46 extends StatefulWidget {
  const Transfercontact46({Key? key}) : super(key: key);

  @override
  _Transfercontact46State createState() => _Transfercontact46State();
}

class _Transfercontact46State extends State<Transfercontact46> {
  int groupvalue = 0;
  int yesvslue = 0;
  int novalue = 1;
  int govalue = 2;
  bool value1 = false;
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

                        Align(alignment: Alignment.centerLeft,
                          child: Text(
                            "Transfer",
                            style: TextStyle(fontSize: 30, height: 3, color: kblue),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "contact Name",
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
                            "Date",
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
                                suffixIcon: Icon(
                                  Icons.calendar_today,
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
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Operation Type",
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
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Payment method",
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
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Tags",
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
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Online payment",
                                style: TextStyle(color: kblue),
                              ),
                            ),
                            SizedBox(height: 30),
                            SizedBox(width: 163),
                            Radio(
                              value: yesvslue,
                              groupValue: groupvalue,
                              onChanged: (int? value) {
                                setState(() {
                                  groupvalue = value!;
                                });
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 0),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Online signature",
                                style: TextStyle(color: kblue),
                              ),
                            ),
                            SizedBox(height: 30),
                            SizedBox(width: 161),
                            Radio(
                              value: novalue,
                              groupValue: groupvalue,
                              onChanged: (int? value) {
                                setState(() {
                                  groupvalue = value!;
                                });
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 0),
                        Column(
                          children: [
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Generate pdf",
                                    style: TextStyle(color: kblue),
                                  ),
                                ),
                                SizedBox(height: 30),
                                SizedBox(width: 180),
                                Radio(
                                  value: govalue,
                                  groupValue: groupvalue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      groupvalue = value!;
                                    });
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 350,
                              height: 39,
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
                                  child: Text(
                                    'Add product',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),


                            Row(
                              children: [
                                Text(
                                  "Product name is added",
                                  style: TextStyle(color: kblue, fontSize: 20),
                                ),
                                SizedBox(width: 65),
                                Checkbox(
                                    value: value1,
                                    checkColor: Colors.white,
                                    onChanged: (value) {
                                      setState(() {});
                                      this.value1 = value!;
                                    }),

                              ],
                            ),



                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
