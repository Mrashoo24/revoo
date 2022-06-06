import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:revoo/Project_Management/Projectmeeting/veiwmeetings.dart';

import '../../constants/constants.dart';

class ProjectMeetings extends StatefulWidget {
  const ProjectMeetings({Key? key}) : super(key: key);

  @override
  State<ProjectMeetings> createState() => _ProjectMeetingsState();
}

class _ProjectMeetingsState extends State<ProjectMeetings> {
  DateTime dateTime = DateTime(2022,12,24, 5, 30);

  var firebase = FirebaseFirestore.instance.collection("Addmeetings").toString();
  TextEditingController venue = TextEditingController();
  TextEditingController projectname = TextEditingController();
  TextEditingController prepareby = TextEditingController();
  TextEditingController presentername = TextEditingController();
  TextEditingController antendename = TextEditingController();
  TextEditingController agenda = TextEditingController();
  TextEditingController meeting = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();





  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    var firestore = FirebaseFirestore.instance.collection('Addmeetings');

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding:   EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Create Your Meeting',style: TextStyle(color: kblue ,fontSize: 25),),
                    ],
                  ),
                  SizedBox(height: 20,),

                  Row(
                    children: [
                      Text('Select Date',style: TextStyle(color: kblue ),),
                    ],
                  ),

                  Row(
                    children: [
                      ElevatedButton(onPressed: () async {
                        final date = await pickDate();
                        if (date == null) return;

                        final newDateTime = DateTime(
                          date.year,
                          date.month,
                          date.day,
                          dateTime.hour,
                          dateTime.minute
                        );
                        setState(() => dateTime = newDateTime);
                      },
                          child: Text("${dateTime.year}/${dateTime.month}/${dateTime.day}"),
                          style:ElevatedButton.styleFrom(
                              primary: Kdblue,
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold))
                      ),
                      SizedBox(width: 10,),
                      ElevatedButton(onPressed: () async {
                        final time = await pickTime();
                        if (time == null) return;
                         final newDateTime = DateTime(dateTime.year,dateTime.minute,dateTime.day,time.hour,time.minute);
                         setState(() => dateTime = newDateTime);
                      },
                          child: Text("$hours:$minutes"),
                      style:ElevatedButton.styleFrom(
                          primary: Kdblue,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Venue',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(venue),
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
                      Text('Prepared By',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(prepareby),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Presenter Name',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(presentername),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Attendees Name',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(antendename),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Agenda',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(agenda),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Meeting',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(meeting),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Description',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(description),

                  SizedBox(height: 15),
                  ElevatedButton(onPressed: ()   {
                    firestore.add(
                      {
                        "agenda" : agenda.text,
                        "venue" : venue.text,
                        "project_name" : projectname.text,
                        "presenter_name" : presentername.text,
                        "prepared_by" : prepareby.text,
                        "attend_name" : antendename.text,
                        "meeting" : meeting.text,
                        "description" : description.text,
                        "date" : DateFormat('yyyy/MM/dd hh:mm a').format(dateTime)
                      });
                    Get.to(VeiwMeetings());
                  },
                    child: Text("Add Meetings"),
                    style:ElevatedButton.styleFrom(
                        primary: Kdblue,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 50),

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
      controller: controller,
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
  Future<DateTime?> pickDate() => showDatePicker(context: context, initialDate: dateTime, firstDate: DateTime(1900), lastDate: DateTime(2500));
  Future<TimeOfDay?> pickTime() => showTimePicker(context: context, initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));

}
