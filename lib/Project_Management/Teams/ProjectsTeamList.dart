import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:revoo/constants/constants.dart';

import '../projectDashboard.dart';

class ProjectTeamsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TeamList();
}

class _TeamList extends State<ProjectTeamsList> {
  var firebase = FirebaseFirestore.instance;

///
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              width: Get.width,
              height: Get.height,
              padding: EdgeInsets.only(left: 5,right: 5),
              // padding: EdgeInsets.all(5),
              child: StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
                  stream: firebase.collection('Addmeetings').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData){
                    return Center(child: Text('Load ing Data'));
                  }
                  return Column(
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index){
                          return Column(
                            children: [
                              Text(
                                snapshot.data!.docs[index]["project_name"],
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
                              SizedBox(height: 15),
                              _LeadTitle('Project Lead'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Wrap(
                                    spacing: 15,
                                    runSpacing: 20,
                                    alignment: WrapAlignment.start,
                                    children: [
                                      _profile(  snapshot.data!.docs[index]["prepared_by"],),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      ),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index){
                            return Column(
                              children: [
                                SizedBox(height: 15),
                                _LeadTitle('Project Intermediators'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      spacing: 20,
                                      runSpacing: 20,
                                      alignment: WrapAlignment.start,
                                      children: [
                                        _profile('Mery'),
                                        _profile('Picker'),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                              ],
                            );
                          }
                      ),
                      SizedBox(height: 15),
                      _LeadTitle('Members'),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        spacing: 20,
                                        runSpacing: 20,
                                        alignment: WrapAlignment.start,
                                        children: [
                                          _profile(snapshot.data!.docs[index]["attend_name"],),
                                          // _profile('jack'),
                                          // _profile('polo'),
                                          // _profile('nager'),
                                          // _profile('hio'),
                                          // _profile('chingchu'),

                                          // _profile('leriya'),
                                          // _profile('nikola'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                              ],
                            );
                          }
                      ),
                    ],
                  );
                }
              ),
            )));
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
            onPressed: () {},
            icon: Image.asset('asset/userprofileicon.png')),
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

Widget _bottomNevigationBar(){
  return Container(
    height: 40,
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
                              child:
                              Image.asset('asset/twopeopleicon.png')),
                          ClipRect(
                              child: Image.asset('asset/homeicon.png')),
                          Opacity(
                              opacity: 0.01,
                              child: ClipRect(
                                  child: Image.asset(
                                      'asset/twopeopleicon.png'))),
                          ClipRect(
                              child: Image.asset('asset/GroupShare.png')),
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

Widget _profile(name) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: Colors.black,
        radius: 30,
      ),
      Container(
        //margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Text(
          '$name',
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}

Widget _LeadTitle(name){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$name',
        style: TextStyle(
          fontSize: 22,
          color: kblue,
        ),
      ),
      Divider(
        thickness: 2,
      ),
    ],
  );
}
