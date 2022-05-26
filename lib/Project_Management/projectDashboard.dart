import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:revoo/Project_Management/profile/userProjectsProfile.dart';

import '../constants/commonWidgets.dart';
import '../constants/constants.dart';
import 'Messages/mssages.dart';
import 'ModuleSprintScreen/modulesSprintsPage.dart';
import 'Tasks/TasksScreen.dart';
import 'Teams/ProjectsTeamList.dart';

class ProjectHomePage extends StatefulWidget {
  const ProjectHomePage({Key? key}) : super(key: key);


  @override
  _ProjectHomePageState createState() => _ProjectHomePageState();
}


//GlobalKey<ScaffoldState> scafkey = GlobalKey<ScaffoldState>();
class _ProjectHomePageState extends State<ProjectHomePage> {

  var selectedCard = 'Home'; //for changing name
  var selectedindex = 0; //for changing index of page

  var homepages = [
    AllProjects(), //0
    ProjectTeamsList(), //1
    AllTasks(),
    ModulesSprintsPage(),
    Messages(),


  ];

  GlobalKey<ScaffoldState> homekey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CommonWidgets().kfloatingButton(),

        key: homekey,
        appBar: AppBar(
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
                  homekey.currentState!.openDrawer();
                },
                icon: Icon(
                  FontAwesomeIcons.bars,
                  color: Colors.black,
                ))),
        drawer:   navBar(),
        body: homepages[selectedindex],
        bottomNavigationBar: commonWidgets.buildBNB(),
      ),
    );


      // body: homepages[selectedindex],;
  }

   navBar() {
    return Card(
      color: Colors.grey.shade200,
      shape: Border(
        right: BorderSide(style: BorderStyle.none),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          height: Get.height,
          width: 300,
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
                Divider(
                  height: 0,
                  thickness: 2,
                  endIndent: 50,
                  indent: 25,
                ),
                buildNavCard('asset/lvapproval.png', 'Tasks',2),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                  endIndent: 50,
                  indent: 25,
                ),
                buildNavCard('asset/modulesprinIcon.png', 'Modules',3),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                  endIndent: 50,
                  indent: 25,
                ),
                buildNavCard('asset/MessagePrvIconDrawer.png', 'Messages',4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildNavCard(String image, String name,int pageIndex) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedCard = name;
          selectedindex = pageIndex;
        });
        Get.back();
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

  Widget _bottomNevigationBar() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/Rectangleforbnb.png'),
              fit: BoxFit.fitWidth,
            )),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Color(0xff1B57A7),
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('asset/twopeopleicon.png'),
                    color: Colors.white,
                  ),
                  label: 'share',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('asset/homeicon.png'),
                    color: Colors.white,
                  ),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('asset/userprofileicon.png'),
                    color: Colors.white,
                  ),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('asset/mssage.png'),
                    color: Colors.white,
                  ),
                  label: 'home',
                ),
              ]),
        ));
  }
}
