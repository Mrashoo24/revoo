import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:revoo/constants/constants.dart';

import '../projectDashboard.dart';

class AllTasks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _showTasks();
}

class _showTasks extends State<AllTasks> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _buildappBar(),
      bottomNavigationBar: _bottomNevigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.transparent,
          onPressed: () {},
          child: Stack(
            alignment: Alignment.center,
            children: [
              ImageIcon(
                AssetImage('asset/addiconforbnb.png'),
                size: 100,
              ),
              ImageIcon(
                AssetImage('asset/addsymbolforbnb.png'),
                color: Color(0xff1B57A7),
              ),
            ],
          )),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            Text(
              'Project Name',
              style: TextStyle(
                fontSize: 22,
                color: kblue,
              ),
            ),
            Text(
              'Your role/Designation',
              style: TextStyle(
                fontSize: 16,
                color: Kdblue,
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 120,
              width: Get.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _dailCard('To-do', 20),
                  _dailCard('Completed', 5),
                  _dailCard('In-Review', 25),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today\'s Tasks',
                  style: TextStyle(
                    fontSize: 22,
                    color: kblue,
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
              ],
            ),
            Container(
              height: Get.height * 0.5,
              //color: Colors.black,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  _TasksCard('Tasks name'),
                _TasksCard('Taske name 2'),
                  _TasksCard('Taske name 3'),
                  _TasksCard('Taske name 5'),
                  _TasksCard('Taske name 4'),
                  _TasksCard('Taske name 4'),
                  _TasksCard('Taske name 4'),
                ],
              ),
            )
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
}

AppBar _buildappBar() {
  return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: Image.asset('asset/bellicon.png')),
        IconButton(onPressed: () {}, icon: Image.asset('asset/gareicon.png')),
        IconButton(
            onPressed: () {}, icon: Image.asset('asset/userprofileicon.png')),
      ],
      leading: IconButton(
          onPressed: () {
            // Get.to(ProjectHomePage(
            //   key: scafkey,
            // ));
          },
          icon: Icon(
            FontAwesomeIcons.bars,
            color: Colors.black,
          )));
}
//
// Widget _bottomNevigationBar() {
//   return Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//         image: AssetImage('asset/Rectangleforbnb.png'),
//         fit: BoxFit.fitWidth,
//       )),
//       child: ClipRRect(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(100),
//           topRight: Radius.circular(100),
//         ),
//         child: BottomNavigationBar(
//             elevation: 0,
//             backgroundColor: Color(0xff1B57A7),
//             type: BottomNavigationBarType.fixed,
//             showSelectedLabels: false,
//             showUnselectedLabels: false,
//             items: [
//               BottomNavigationBarItem(
//                 icon: ImageIcon(
//                   AssetImage('asset/twopeopleicon.png'),
//                   color: Colors.white,
//                 ),
//                 label: 'share',
//               ),
//               BottomNavigationBarItem(
//                 icon: ImageIcon(
//                   AssetImage('asset/homeicon.png'),
//                   color: Colors.white,
//                 ),
//                 label: 'home',
//               ),
//               BottomNavigationBarItem(
//                 icon: ImageIcon(
//                   AssetImage('asset/userprofileicon.png'),
//                   color: Colors.white,
//                 ),
//                 label: 'home',
//               ),
//               BottomNavigationBarItem(
//                 icon: ImageIcon(
//                   AssetImage('asset/mssage.png'),
//                   color: Colors.white,
//                 ),
//                 label: 'home',
//               ),
//             ]),
//       ));
// }

Widget _bottomNevigationBar() {
  return Container(
    height: 50,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: Get.height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Kdblue,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRect(
                              child: Image.asset('asset/twopeopleicon.png')),
                          ClipRect(child: Image.asset('asset/homeicon.png')),
                          Opacity(
                              opacity: 0.01,
                              child: ClipRect(
                                  child:
                                      Image.asset('asset/twopeopleicon.png'))),
                          ClipRect(child: Image.asset('asset/GroupShare.png')),
                          ClipRect(child: Image.asset('asset/mssage.png')),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Padding(
        //     padding: const EdgeInsets.only(bottom: 20.0),
        //     child: Stack(
        //       alignment: Alignment.center,
        //       children: [
        //         ImageIcon(
        //           AssetImage('asset/addiconforbnb.png'),
        //           size: 1000,
        //           color: Colors.grey,
        //         ),
        //         ImageIcon(
        //           AssetImage('asset/addsymbolforbnb.png'),
        //           color: Color(0xff1B57A7),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
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
