


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../constants/constants.dart';

class Dailyupdates extends StatefulWidget {
  const Dailyupdates({Key? key}) : super(key: key);

  @override
  _DailyupdatesState createState() => _DailyupdatesState();
}

class _DailyupdatesState extends State<Dailyupdates> {
  bool  avalue = false;
  bool  bvalue = false;
  bool  cvalue = false;
  bool  dvalue = false;
  bool  evalue = false;
  bool  fvalue = false;
  bool  gvalue = false;
  bool  hvalue = false;






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,





      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child : Text("Daily Updates",style: TextStyle(color: kblue ,fontSize: 30),
                ),

              ),Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                child: TextField(

                  decoration: InputDecoration(fillColor: Colors.indigo.shade50, filled: true,hintText: "Type your reason",
                    contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),),

                ),
              ),Container(
                alignment: Alignment.center,
                child : Text("Your Task",style: TextStyle(color: kblue ,fontSize: 30),
                ),
              ),

              Row(
                children: [

                  Align(
                    alignment: Alignment.centerLeft,
                    child:  Checkbox(

                    value:  avalue,checkColor: Kdblue,
                      onChanged: (value){

                      setState(() {

                      });
                       this.avalue = value!;
                      }
                  ),
                  ),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit",style: TextStyle(color: kblue ,fontSize: 12),)
                ],
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:  Checkbox(

                        value:  bvalue,
                        onChanged: (value){

                          setState(() {

                          });
                          this.bvalue = value!;
                        }
                    ),
                  ),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit",style: TextStyle(color: kblue ,fontSize: 12),)
                ],
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:  Checkbox(

                        value: cvalue,
                        onChanged: (value){

                          setState(() {

                          });
                          this.cvalue = value!;
                        }
                    ),
                  ),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit",style: TextStyle(color: kblue ,fontSize: 12),)
                ],
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:  Checkbox(

                        value: dvalue,
                        onChanged: (value){

                          setState(() {

                          });
                          this.dvalue = value!;
                        }
                    ),
                  ),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit",style: TextStyle(color: kblue ,fontSize: 12),)
                ],
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:  Checkbox(

                        value: evalue,
                        onChanged: (value){

                          setState(() {

                          });
                          this.evalue = value!;
                        }
                    ),
                  ),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit",style: TextStyle(color: kblue ,fontSize: 12),)
                ],
              ),
              Card(
                elevation: 10,
                color: bgGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child:  Checkbox(

                              value: fvalue,
                              onChanged: (value){

                                setState(() {

                                });
                                this.fvalue = value!;
                              }
                          ),
                        ),
                        Text("Lorem ipsum dolor sit adipiscing elit",style: TextStyle(color: kblue ,fontSize: 12),)
                      ],
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child:  Checkbox(

                              value: gvalue,
                              onChanged: (value){

                                setState(() {

                                });
                                this.gvalue = value!;
                              }
                          ),
                        ),
                        Text("Lorem ipsum dolor sit adipiscing elit",style: TextStyle(color: kblue ,fontSize: 12),)
                      ],
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child:  Checkbox(

                              value: hvalue,
                              onChanged: (value){

                                setState(() {

                                });
                                this.hvalue = value!;
                              }
                          ),
                        ),
                        Text("Lorem ipsum dolor sit adipiscing elit",style: TextStyle(color: kblue ,fontSize: 12),)
                      ],
                    ),
  ],
              )



              ),





            ],
          ),
        ),
      ),
    );
  }
}
