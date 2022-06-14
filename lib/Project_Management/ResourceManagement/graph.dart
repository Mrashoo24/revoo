import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/constants.dart';

class Graph extends StatefulWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child: Scaffold(
         body: SingleChildScrollView(
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     ElevatedButton(
                       style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(Kdblue)
                       ),
                       onPressed: () {

                       }, child: Text('Schedule'),
                     ),
                     SizedBox(height: 10,),
                     ElevatedButton(
                       style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(Kdblue)
                       ),
                       onPressed: () {

                       }, child: Text('People'),
                     ),
                     SizedBox(height: 10,),
                     ElevatedButton(
                       style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(Kdblue)
                       ),
                       onPressed: () {

                       }, child: Text('Project'),
                     ),
                     SizedBox(height: 10,),
                     ElevatedButton(
                       style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(Kdblue)
                       ),
                       onPressed: () {
                         }, child: Text('Peport'),
                     ),
                   ],
                 ),
               ),
               SizedBox(height: 20,),
             ],
           ),
         ),
       ),
    );
  }
}
