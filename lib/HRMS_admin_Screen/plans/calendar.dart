import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../constants/constants.dart';


class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateRangePickerController _dateRangePickerController = DateRangePickerController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 550,
              child: SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.range,
                showActionButtons: true,
                controller: _dateRangePickerController,
                onSubmit: ( val){
                  //
                  print(val);

                },onCancel: (){
                _dateRangePickerController.selectedRange = null;
              },
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Container(
                child: Padding(
                    padding:  EdgeInsets.only(left: 8,right: 8,),
                    child: Icon(Icons.arrow_back_outlined,color: Colors.white,)
                ),
                height: 30,width: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Kdblue,
                    bluess
                  ]),
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Kdblue,width: 3)
                ),
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: Colors.blue),
              ),
            ),
          ],
        ),
        // body: SingleChildScrollView(
        //   child: TableCalendar(
        //     firstDay: DateTime.utc(2010,10,20),
        //     lastDay: DateTime.utc(2040,10,20),
        //     focusedDay: DateTime.now(
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
//pub yml,   syncfusion_flutter_datepicker: ^20.1.48     // table_calendar: ^3.0.5

