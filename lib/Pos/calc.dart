import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../constants/constants.dart';

class Calclator extends StatefulWidget {
  const Calclator({Key? key}) : super(key: key);

  @override
  _CalclatorState createState() => _CalclatorState();
}

class _CalclatorState extends State<Calclator> {

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
          child: Column(
            children: [
              Row(

                children: [

                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),color: bgGrey,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: increment,
                          child: Icon(Icons.add,color: kblue,),
                        ),

                        VerticalDivider(indent: 10,endIndent: 10,),
                        InkWell(
                          onTap :decrement ,

                          child: Icon(Icons.remove,color: kblue,),
                        ), SizedBox(width: 20),
                        Text("$_counter",style: TextStyle(fontSize: 25,color: kblue),),

                      ],
                    ),
                  ),

                  Text("Rs.1",style: TextStyle(fontSize: 50,color: kblue),),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
