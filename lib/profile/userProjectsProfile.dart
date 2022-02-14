import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:revoo/Widgets/projectNameinprofile.dart';
import 'package:revoo/Widgets/showProjectnameDetailcard.dart';

class userProjectProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return userprofile();
  }
}

class userprofile extends State<userProjectProfile> {
  final String emplyeeName = "Employee Name";
  final String designationOfEmp = "Designation";
  int _index = 0;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          appBar: _buildappBar(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              width: Get.width,
              height: Get.height,
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              child: ListView(
                children: [
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width / 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Welcome, ${emplyeeName}",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontFamily: 'Regular',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${designationOfEmp} of Employee",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Neue Haas Grotesk Display Pro'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Padding(
                        padding: EdgeInsets.only(left: 2),
                        child: Row(
                          children: [
                            Text(
                              "All projects",
                              style: TextStyle(
                                fontSize: 30,
                                color: Color(0xff1B57A7),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.3,
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'asset/addicon.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Text(
                                  "create a project..",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Neue Haas Grotesk Display Pro',
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 15.0, right: 200, bottom: 5),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        suffixIcon: Icon(FontAwesomeIcons.search),
                        contentPadding: EdgeInsets.all(11.25),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff1B57A7),
                            ),
                            borderRadius: BorderRadius.circular(20.0)),
                        fillColor: Color(0xffEAEBED),
                      ),
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        if (value == '') {
                          FocusScope.of(context).unfocus();
                        }
                      },
                      onSaved: (value) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: projectNameinprofile(selected: true),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: projectNameinprofile(selected: selected),
                      ),
                      GestureDetector(
                        onTap: () {selected = true;},
                        child: projectNameinprofile(selected: selected),
                      ),



                    ],
                  )
                ],
              ),
            )
          ),
          bottomNavigationBar: _bottomNevigationBar(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.transparent,
            onPressed: () {},
            child: Stack(
              alignment: Alignment.center,
              children: [

                ImageIcon(
                  AssetImage('asset/addiconforbnb.png'),
                  size: 1000,
                ),
                ImageIcon(
                  AssetImage('asset/addsymbolforbnb.png'),
                  color: Color(0xff1B57A7),
                ),
              ],
            )
          )),
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
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.bars,
            color: Colors.black,
          )));
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
                label: 'home',
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

