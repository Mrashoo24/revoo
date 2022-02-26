import 'package:flutter/material.dart';

import '../constants/constants.dart';



class Test extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Test> {
  final _formKey = GlobalKey<FormState>();


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(

                    content: Stack(
                      clipBehavior: Clip.none, children: <Widget>[
                        Positioned(
                          right: -20.0,
                          top: -15.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Kdblue,
                            ),
                          ),
                        ),SizedBox(height: 15),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Duplicate Branch',
                                style: TextStyle(
                                    color: kblue,
                                    fontSize: 25),),
                              SizedBox(height: 10),
                              TextFormField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: bgGrey,
                                    contentPadding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                                    hintText: 'Choose a Name',

                                    hintStyle: TextStyle(
                                        color: Colors.grey
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    enabledBorder:OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)
                                    ),


                                ),
                              ),Text(
                                'Copy all attributes',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20),),

                              Row(
                                children: [
                                  Padding(
                                    padding:   EdgeInsets.all(5.0),
                                    child: ElevatedButton(
                                      child: Text("<       Back"),

                                      onPressed: () {

                                      },
                                    ),
                                  ),Padding(
                                    padding:   EdgeInsets.all(5.0),
                                    child: ElevatedButton(
                                      child: Text("Duplicate"),

                                      onPressed: () {

                                      },
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Text("Open Popup"),
        ),
      ),
    );
  }
}