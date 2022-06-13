import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../constants/constants.dart';

class TimeSHeet extends StatefulWidget {
  const TimeSHeet({Key? key}) : super(key: key);

  @override
  State<TimeSHeet> createState() => _TimeSHeetState();
}

class _TimeSHeetState extends State<TimeSHeet> {

  DateTime startdate = DateTime(2022,12,24, 5, 30);
  DateTime endsdate = DateTime(2022,12,24, 5, 30);
  late String valueChoosed;
  late List listview = [
    "Item 1","Item 2" , "Item 3", "Item4", "Item5"
  ];

  TextEditingController moduletype = TextEditingController();
  TextEditingController assignto = TextEditingController();
  TextEditingController projectname = TextEditingController();
  TextEditingController tasktitle = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final hours = startdate.hour.toString().padLeft(2, '0');
    final minutes = startdate.minute.toString().padLeft(2, '0');
    final endhours = endsdate.hour.toString().padLeft(2, '0');
    final endminutes = endsdate.minute.toString().padLeft(2, '0');
    var firestore = FirebaseFirestore.instance.collection('PmAddTask');

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:   EdgeInsets.all(10),
          child: Container(
            color: Colors.white,

            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [

                  Row(
                    children: [
                      Text('Task Title',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(tasktitle),
                  SizedBox(height: 15),

                  Row(
                    children: [
                      Text('Asign To',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(assignto),
                  SizedBox(height: 15),

                  Row(
                    children: [
                      Text('Project Name',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(projectname),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Start Date',style: TextStyle(color: kblue ),),

                          ElevatedButton(onPressed: () async {
                            final date = await pickDate();
                            if (date == null) return;

                            final newDateTime = DateTime(
                                date.year,
                                date.month,
                                date.day,
                                startdate.hour,
                                startdate.minute
                            );
                            setState(() => startdate = newDateTime);
                          },
                              child: Text("${startdate.year}/${startdate.month}/${startdate.day}"),
                              style:ElevatedButton.styleFrom(
                                  primary: Kdblue,
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold))
                          ),
                        ],


                      ),


                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text('End Date',style: TextStyle(color: kblue ),),
                          ElevatedButton(onPressed: () async {
                            final date = await endpickDate();
                            if (date == null) return;

                            final newDateTime = DateTime(
                                date.year,
                                date.month,
                                date.day,
                                endsdate.hour,
                                endsdate.minute
                            );
                            setState(() => endsdate = newDateTime);
                          },
                              child: Text("${endsdate.year}/${endsdate.month}/${endsdate.day}"),
                              style:ElevatedButton.styleFrom(
                                  primary: Kdblue,
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold))
                          ),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: 15),

                  Row(
                    children: [
                      Text('Module Types',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(moduletype),
                  SizedBox(height: 15),
                  SizedBox(height: 5),


                  ElevatedButton(onPressed: ()   {
                    firestore.add(
                        {
                          "assign_to" : assignto.text,
                          "task_title" : tasktitle.text,
                          "project_name" : projectname.text,
                          "module_type" : moduletype.text,
                          "end_date" : DateFormat('yyyy/MM/dd hh:mm a').format(endsdate),
                          "start_date" :  DateFormat('yyyy/MM/dd hh:mm a').format(startdate),

                        });
                    Get.back();
                  },
                    child: Text("Add Meetings"),
                    style:ElevatedButton.styleFrom(
                        primary: Kdblue,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }

  TextFormField buildTextFormField(controller) {
    return TextFormField(
      controller : controller,
  decoration: InputDecoration(
  filled: true,
  fillColor: bgGrey,
  contentPadding:
  EdgeInsets.only(left: 10, top: 2, bottom: 3),
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
  );


  }
  Future<DateTime?> pickDate() => showDatePicker(context: context, initialDate: endsdate, firstDate: DateTime(1900), lastDate: DateTime(2500));
  Future<TimeOfDay?> pickTime() => showTimePicker(context: context, initialTime: TimeOfDay(hour: endsdate.hour, minute: endsdate.minute));

  Future<DateTime?> endpickDate() => showDatePicker(context: context, initialDate: endsdate, firstDate: DateTime(1900), lastDate: DateTime(2500));
  Future<TimeOfDay?> endpickTime() => showTimePicker(context: context, initialTime: TimeOfDay(hour: endsdate.hour, minute: endsdate.minute));

}


// DateTime startdate = DateTime(2022,12,24, 5, 30);
///above @override

// final hours = startdate.hour.toString().padLeft(2, '0');
// final minutes = startdate.minute.toString().padLeft(2, '0');
///below widget build(BuildContext context)

// ElevatedButton(onPressed: () async {
// final date = await endpickDate();
// if (date == null) return;
//
// final newDateTime = DateTime(
//     date.year,
//     date.month,
//     date.day,
//     endsdate.hour,
//     endsdate.minute
// );
// setState(() => endsdate = newDateTime);
// },
// child: Text("${endsdate.year}/${endsdate.month}/${endsdate.day}"),
// style:ElevatedButton.styleFrom(
// primary: Kdblue,
// textStyle: TextStyle(
// fontWeight: FontWeight.bold))
// ),

// Future<DateTime?> pickDate() => showDatePicker(context: context, initialDate: endsdate, firstDate: DateTime(1900), lastDate: DateTime(2500));
// Future<TimeOfDay?> pickTime() => showTimePicker(context: context, initialTime: TimeOfDay(hour: endsdate.hour, minute: endsdate.minute));
