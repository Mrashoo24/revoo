import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class TimeSHeet extends StatefulWidget {
  const TimeSHeet({Key? key}) : super(key: key);

  @override
  State<TimeSHeet> createState() => _TimeSHeetState();
}

class _TimeSHeetState extends State<TimeSHeet> {

  DateTime dateTime = DateTime(2022,12,24, 5, 30);
  late String valueChoosed;
  late List listview = [
    "Item 1","Item 2" , "Item 3", "Item4", "Item5"
  ];

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
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



          ],
        ),

      ),
    );
  }
  Future<DateTime?> pickDate() => showDatePicker(context: context, initialDate: dateTime, firstDate: DateTime(1900), lastDate: DateTime(2500));
  Future<TimeOfDay?> pickTime() => showTimePicker(context: context, initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
}
