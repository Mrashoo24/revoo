import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:revoo/Teams/ProjectsTeamList.dart';
import 'package:revoo/profile/userProjectsProfile.dart';

import '../constants/constants.dart';

class ProjectHomePage extends StatefulWidget {

  //const ProjectHomePage({required Key key}) : super(key: key);

  @override
  _ProjectHomePageState createState() => _ProjectHomePageState();
}


//GlobalKey<ScaffoldState> scafkey = GlobalKey<ScaffoldState>();
class _ProjectHomePageState extends State<ProjectHomePage> {

  var selectedCard = 'Home'; //for changing name
  var selectedindex = 0; //for changing index of page

  // var homepages = [
  //   AdminDashboard(), //0
  //   Container(), //1
  // ];


  @override
  Widget build(BuildContext context) {
    return
      // key: scafkey,
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: InkWell(
      //       onTap: () {
      //         scafkey.currentState?.openDrawer();
      //       },
      //       child: Padding(
      //         padding: const EdgeInsets.only(left: 12.0),
      //         child: Icon(
      //           FontAwesomeIcons.bars,
      //           color: Colors.black,
      //         ),
      //       )),
      //   actions: [
      //     Image.asset('asset/bellicon.png'),
      //     Image.asset('asset/gareicon.png'),
      //     Image.asset('asset/userprofileicon.png'),
      //     SizedBox(
      //       width: 12,
      //     ),
      //   ],
      // ),
      // bottomNavigationBar: Container(
      //   height: 100,
      //   child: Stack(
      //     children: [
      //       Align(
      //         alignment: Alignment.bottomCenter,
      //         child: Container(
      //           child: Stack(
      //             children: [
      //               Align(
      //                 alignment: Alignment.bottomCenter,
      //                 child: Container(
      //                   height: Get.height * 0.08,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.only(
      //                         topLeft: Radius.circular(20),
      //                         topRight: Radius.circular(20)),
      //                     color: Kdblue,
      //                   ),
      //                   child: Align(
      //                     alignment: Alignment.center,
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: [
      //                         ClipRect(
      //                             child:
      //                                 Image.asset('asset/twopeopleicon.png')),
      //                         ClipRect(
      //                             child: Image.asset('asset/homeicon.png')),
      //                         Opacity(
      //                             opacity: 0.01,
      //                             child: ClipRect(
      //                                 child: Image.asset(
      //                                     'asset/twopeopleicon.png'))),
      //                         ClipRect(
      //                             child: Image.asset('asset/GroupShare.png')),
      //                         ClipRect(child: Image.asset('asset/mssage.png')),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       Align(
      //         alignment: Alignment.bottomCenter,
      //         child: Padding(
      //           padding: const EdgeInsets.only(bottom: 20.0),
      //           child: Stack(
      //             alignment: Alignment.center,
      //             children: [
      //               ImageIcon(
      //                 AssetImage('asset/addiconforbnb.png'),
      //                 size: 1000,
      //                 color: Colors.grey,
      //               ),
      //               ImageIcon(
      //                 AssetImage('asset/addsymbolforbnb.png'),
      //                 color: Color(0xff1B57A7),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
       Card(
          color: Colors.grey.shade200,
          shape: Border(
            right: BorderSide(style: BorderStyle.none),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('asset/EllipseforuserTeams.png'),
                        radius: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    child: Text('Name of the person',
                                        style: TextStyle(
                                            fontSize: 20, color: kblue),
                                        textAlign: TextAlign.left)),
                              ),
                              Container(
                                  child: Text('Role/Designation',
                                      style:
                                          TextStyle(fontSize: 18, color: kblue),
                                      textAlign: TextAlign.left)),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Text(
                                        'Veiw Profile',
                                        style: TextStyle(
                                            fontSize: 15, color: kyellow),
                                      )),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset('asset/rightarrow.png')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  buildNavCard('asset/homeDrawer.png', 'Home',0),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 0,
                    thickness: 2,
                    endIndent: 50,
                    indent: 25,
                  ),
                  buildNavCard('asset/checkgrp.png', 'YourTeam',1),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 0,
                    thickness: 2,
                    endIndent: 50,
                    indent: 25,
                  ),
                  buildNavCard('asset/checkpad.png', 'Project',2),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 0,
                    thickness: 2,
                    endIndent: 50,
                    indent: 25,
                  ),
                  buildNavCard('asset/lvapproval.png', 'Tasks',3),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 0,
                    thickness: 2,
                    endIndent: 50,
                    indent: 25,
                  ),
                  buildNavCard('asset/modulesprinIcon.png', 'Modules',4),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 0,
                    thickness: 2,
                    endIndent: 50,
                    indent: 25,
                  ),
                  buildNavCard('asset/MessagePrvIconDrawer.png', 'Messages',5),
                ],
              ),
            ),
          ),
        );

      // body: homepages[selectedindex],;
  }

  buildNavCard(String image, String name,int pageIndex) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedCard = name;
          selectedCard == 'Home' ? selectedindex = 0 : selectedindex = 1;
        });
        if(pageIndex==0){
          Get.to(userProjectProfile());
        }
        else if(pageIndex ==1){
          Get.to(ProjectTeamsList());
        }
        // else if(pageIndex == 4){
        //   Get.to
        // }
      },
      child: Card(
        color: selectedCard == name ? Colors.white : bgGrey,
        elevation: selectedCard == name ? 2 : 0,
        child: Container(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15.0, top: 10, bottom: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  color: Kdblue,
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
