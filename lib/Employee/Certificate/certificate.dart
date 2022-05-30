import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:revoo/Employee/Certificate/request.dart';

import 'morerequest.dart';
class Certificate extends StatefulWidget {
  const Certificate({Key? key}) : super(key: key);

  @override
  State<Certificate> createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  detail(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Request for the services?'),
        content: Text('Are you sure you want to request for the services'),
        actions: [
          TextButton(onPressed: (){}, child: Text('Request')),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Cancel')),
        ],
      );
    });
  }
  total(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Request for the services?'),
        content: Text('Are you sure you want to request for the services'),
        actions: [
          TextButton(onPressed: (){}, child: Text('Request')),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Cancel')),
        ],
      );
    });
  }
  without(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Request for the services?'),
        content: Text('Are you sure you want to request for the services'),
        actions: [
          TextButton(onPressed: (){}, child: Text('Request')),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Cancel')),
        ],
      );
    });
  }
  Widget Services(){
    return ListView(
      children: [
        Card(
          color: Color.fromARGB(250, 250, 250, 250),
          margin: EdgeInsets.all(8),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF1B57A7)),
              color:Color.fromARGB(255, 250, 250, 250),
              borderRadius: BorderRadius.circular(12),
            ),
            child:ListTile(
              title: Text('Certificate with detail salary'),
              trailing: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF1B57A7)),
                ),
                child: Text('Request'),
                onPressed: detail,
              ),
            ),
          ),
        ),

        Card(
          color: Color.fromARGB(250, 250, 250, 250),
          margin: EdgeInsets.all(8),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF1B57A7)),
              color:Color.fromARGB(255, 250, 250, 250),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text('Certificate with total salary'),
              trailing: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF1B57A7)),
                ),
                child: Text('Request'),
                onPressed: total,
              ),
            ),
          )
        ),

        Card(
          color: Color.fromARGB(250, 250, 250, 250),
          margin: EdgeInsets.all(8),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF1B57A7)),
              color:Color.fromARGB(255, 250, 250, 250),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
            title: Text('Certificate without salary'),
            trailing: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF1B57A7)),
              ),
              child: Text('Request'),
              onPressed: without,
            ),
          ),),
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:DefaultTabController(length: 2,child:Scaffold(

        // extendBodyBehindAppBar: true,

      body: Column(
        children: [
          TabBar(
            labelColor: Color(0xFF0D3974),
            tabs: [
              Tab(text: 'Services',),
              Tab(text: 'Request',),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Services(),
                Request(),
              ],
            ),
          ),
        ],
      ),)
      ),
      );
  }
}
