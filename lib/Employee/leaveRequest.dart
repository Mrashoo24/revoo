import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:revoo/constants/constants.dart';

class LeaveRequestEmployee extends StatefulWidget {
  const LeaveRequestEmployee({Key? key}) : super(key: key);

  @override
  _LeaveRequestEmployeeState createState() => _LeaveRequestEmployeeState();
}

class _LeaveRequestEmployeeState extends State<LeaveRequestEmployee> {
  bool value = false;

  var itemList = [
    'IT',
    'CIVIL'
  ];
  DateTime date = DateTime(2022, 12, 24);
  var selectedDepart = 'IT';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView(
              children: [
                Text(
                  'Your Leaves Request',
                  style: TextStyle(
                    fontSize: 22,
                    color: kblue,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 120,
                  width: Get.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _dailCard('Pending', 20),
                      _dailCard('Taken', 5),
                      _dailCard('Remaining', 25),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Past Request',
                      style: TextStyle(
                        fontSize: 22,
                        color: kblue,
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Container(
                      color: bgGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('asset/chat.png',color: kblue,),
                                SizedBox(width: 10,),
                                Text('Track your request here',style: TextStyle(
                                  fontSize: 14,
                                  color: kblue,
                                ),),
                              ],
                            ),

                            Icon(FontAwesomeIcons.arrowRight)
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Send Request',
                          style: TextStyle(
                            fontSize: 22,
                            color: kblue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context, initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),

                        );

                        if (newDate == null) return;

                        setState(() => date = newDate );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: bgGrey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('From'),
                                Icon(Icons.calendar_today)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () async {

                        DateTime? newDate = await showDatePicker(
                          context: context, initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),

                        );

                        if (newDate == null) return;

                        setState(

                                () => date = newDate

                        );

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: bgGrey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('To'),
                                Icon(Icons.calendar_today)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: bgGrey,
                          contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                          hintText: 'Enter Reason',

                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          enabledBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          )


                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        ));
  }

  Widget _TasksCard(name) {
    return Container(
      height: 70,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: kblue,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
              value: value,
              checkColor: Colors.black,
              activeColor: Colors.white,
              side: BorderSide(color: Colors.white),
              onChanged: (changevalue) {
                setState(() {
                  value = changevalue!;
                });
              }),
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Text(
                '$name',
                style: TextStyle(color: kyellow, fontSize: 16),
              ),
              Text(
                '\nloersom ipsum fhgugu gugbug ubgualf \n alfur ifuvuv usb oshane',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          ImageIcon(
            AssetImage('asset/threedots.png'),
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _dailCard(name, number) {
    return Container(
      width: 120,
      height: 80,
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/userTEamsbackground.png'),
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$name',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  'asset/EllipseforuserTeams.png',
                  fit: BoxFit.fitWidth,
                ),
                Image.asset('asset/EllipsesmallForuserTeams.png'),
                Text('$number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
    );
  }
}
