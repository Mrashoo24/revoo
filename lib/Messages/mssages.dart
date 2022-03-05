
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:revoo/Messages/chattingScreen.dart';
import 'package:revoo/projectDashboard.dart';


import '../../constants/constants.dart';




class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PrivateMessages();
  }
}

//GlobalKey<ScaffoldState> homekey = GlobalKey<ScaffoldState>();

class _PrivateMessages extends State<Messages> {
  final String projectName = "Project Name";
  final String designationOfEmp = "Your roles/Designation";
  int _index = 0;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        //key: homekey,
          appBar: _buildappBar(),
          //drawer: ProjectHomePage(key: scafkey,),
          backgroundColor: Colors.white,
          drawer: Drawer(child: ProjectHomePage(),),
          body: SingleChildScrollView(
              child: Container(
                width: Get.width,
                height: Get.height,
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "$projectName",
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
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Neue Haas Grotesk Display Pro'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                        width: Get.width,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "All Messages",
                              style: TextStyle(
                                fontSize: 30,
                                color: Color(0xff1B57A7),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(right: Get.width/2),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          suffixIcon: Icon(FontAwesomeIcons.search),
                          contentPadding: EdgeInsets.all(11.25),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Kdblue,
                              ),
                              borderRadius: BorderRadius.circular(20.0)),
                          fillColor: ktextcolor,
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
                      height: 10,
                    ),
                    Container(
                      //color: Colors.black,
                      height: Get.height * 0.70,
                      child: ListView(
                        children: [
                          buildContent(context,'Name of the Employee'),
                          Divider(thickness: 2,color: bgGrey,),
                          buildContent(context,'Name of the Employee'),
                          Divider(thickness: 2,color: bgGrey,),
                          buildContent(context,'Name of the Employee'),
                          Divider(thickness: 2,color: bgGrey,),
                          buildContent(context,'Name of the Employee'),
                          Divider(thickness: 2,color: bgGrey,),
                          buildContent(context,'Name of the Employee'),
                          Divider(thickness: 2,color: bgGrey,),
                          buildContent(context,'Name of the Employee'),
                          Divider(thickness: 2,color: bgGrey,),
                          buildContent(context,'Name of the Employee'),
                          Divider(thickness: 2,color: bgGrey,),
                          buildContent(context,'Name of the Employee'),
                          Divider(thickness: 2,color: bgGrey,),
                          buildContent(context,'Name of the Employee'),
                          Divider(thickness: 2,color: bgGrey,),
                          buildContent(context,'Name of the Employee'),
                          Divider(thickness: 2,color: bgGrey,),
                          buildContent(context,'Name of the Employee'),

                          // buildContent(context,3),
                        ],
                      ),
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
  bool expandName = false;
  Widget buildContent(BuildContext context,name){
    return GestureDetector(
      onTap: (){Get.to(chattingPage());},
      child: Container(
        padding: EdgeInsets.only(top: 5,bottom: 5),
        height: 50,
        child:Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kyellow,
                  ),),
                Text('hgig gignig iig ginggig ijg',
                  style: TextStyle(
                    fontSize: 12,
                    color: kblue,
                  ),)
              ],
            ),
            Text(
                ' 3.45',
                style: TextStyle(
                  fontSize: 12,
                  color: kblue,
                )
            )
          ],
        ),
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
            // Get.to( ProjectHomePage(key: scafkey,));
          },
          icon: Icon(
            FontAwesomeIcons.bars,
            color: Colors.black,
          )));
}

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
