import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart';

class AddShift extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;

  const AddShift({Key? key, required this.userDoc}) : super(key: key);

  @override
  _AddShiftState createState() => _AddShiftState();
}

class _AddShiftState extends State<AddShift> {
  TimeOfDay _time = TimeOfDay.now().replacing(hour: 11, minute: 30);
  var selectedTime = '';

  bool loading = false;

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  TextEditingController hours = TextEditingController();

  TextEditingController time = TextEditingController();
  TextEditingController weekof = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'Create Branch',
                style: TextStyle(color: kblue, fontSize: 30),
              ),
              Divider(
                height: 10,
                thickness: 4,
                color: Kdblue,
                endIndent: 90,
                indent: 90,
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Kdblue),
        ),
        body: Container(
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('asset/dpbrCRUD.png')),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: hours,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(

                            filled: true,
                            fillColor: bgGrey,
                            contentPadding:
                            EdgeInsets.only(left: 20, top: 25, bottom: 25),
                            hintText: 'Working Hours',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),

                      InkWell(
                        onTap: (){

                          Navigator.of(context).push(
                            showPicker(
                              context: context,
                              value: _time,
                              onChange: onTimeChanged,
                              minuteInterval: MinuteInterval.FIVE,
                              // Optional onChange to receive value as DateTime
                              onChangeDateTime: (DateTime dateTime) {
                                print('dateTime $dateTime');
                                print(_time);
                                setState(() {
                                  selectedTime = DateFormat('hh:mm a').format(dateTime);
                                });

                              },
                            ),
                          );
                        },
                        child: TextFormField(
                          controller: time,
                          enabled: false,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: bgGrey,
                              contentPadding:
                              EdgeInsets.only(left: 20, top: 25, bottom: 25),
                              hintText: selectedTime == '' ? 'Login Time' : selectedTime,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),


                    ],
                  ),
                  Text(
                    'By clicking continue, you agree to the',
                    style: TextStyle(color: kblue, fontSize: 12),
                  ),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        text: ' Terms & Continue ',
                        style: TextStyle(
                          color: kyellow,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: 'and',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: ' Privacy Policy ',
                            style: TextStyle(
                              color: kyellow,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: 'of Revoo',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              side: BorderSide(width: 3.0, color: kblue),
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 11),
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          child: Center(
                              child: Text(
                                '< Back',
                                style: TextStyle(color: kblue, fontSize: 15),
                              ))),
                      SizedBox(
                        width: 25,
                      ),
                     loading ? kprogressbar : InkWell(
                        onTap: () async {
                          setState(() {
                            loading = true;
                          });
                         var firestore = FirebaseFirestore.instance;
                          var uid =FirebaseAuth.instance.currentUser!.uid;

                          var userdata = await firestore.collection('Employee').doc(uid).get();

                          await firestore.collection('Shifts').add(

                              {
                                'hours':hours.text,
                                'time':selectedTime,
                                'weekoff' : '',
                                'cid' : userdata.get('cid')
                              }

                          ).then((value) async {

                            await firestore.collection('Shifts').doc(value.id).update({
                              'id' :value.id
                            });
                            setState(() {
                              loading = false;
                            });

                          });


                        },
                        child: Container(
                          width: 110,
                          height: 41,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade900,
                                Colors.blue,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
