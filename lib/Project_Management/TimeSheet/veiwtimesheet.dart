import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VeiwTimesheet extends StatefulWidget {
  const VeiwTimesheet({Key? key}) : super(key: key);

  @override
  _VeiwTimesheetState createState() => _VeiwTimesheetState();
}

class _VeiwTimesheetState extends State<VeiwTimesheet> {

  var firestore = FirebaseFirestore.instance.collection('PmAddTask').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: null,
              builder: (context, snapshot) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.requireData.docs.length,
                  itemBuilder: (context,index){
                    return Container(
                      child:  Text(
                        snapshot.data!.docs[index]['assign_to'],

                        style: TextStyle(
                            color: Colors.white, fontSize: 12),
                      ),
                    );
                  },
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
