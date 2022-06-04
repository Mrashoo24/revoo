import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ProjectMeetings extends StatefulWidget {
  const ProjectMeetings({Key? key}) : super(key: key);

  @override
  State<ProjectMeetings> createState() => _ProjectMeetingsState();
}

class _ProjectMeetingsState extends State<ProjectMeetings> {

  var firebase = FirebaseFirestore.instance.collection(" ").toString();

  DateTime dateTime = DateTime(2022,12,24, 5, 30);
  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
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
                  buildTextFormField(),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Project Name',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Prepared By',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Presenter Name',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Attendees Name',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Agenda',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Meeting',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Description',style: TextStyle(color: kblue ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(height: 1,),
                  buildTextFormField(),

                  SizedBox(height: 15),
                  ElevatedButton(onPressed: () async {


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

  TextFormField buildTextFormField() {
    return TextFormField(
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
