
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:revoo/profile/userProfileTeams.dart';

import '../../constants/constants.dart';
import '../Widgets/projectNameinprofile.dart';
import '../projectDashboard.dart';



class ModulesSprintsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _moduleState();
  }
}

//GlobalKey<ScaffoldState> homekey = GlobalKey<ScaffoldState>();
class _moduleState extends State<ModulesSprintsPage> {
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
          body: SingleChildScrollView(
              child: Container(
                width: Get.width,
                height: Get.height,
                margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),

                child: ListView(
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
                                fontSize: 18,
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
                              "All Modules",
                              style: TextStyle(
                                fontSize: 30,
                                color: Color(0xff1B57A7),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'asset/addicon.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Text(
                                  "create a modules..",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Neue Haas Grotesk Display Pro',
                                  ),
                                ),
                              ],
                            )
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
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildContent(context,'Module Name 1'),
                        buildContent(context,'Module Name 2'),
                        buildContent(context,'Module Name 3'),
                        buildContent(context,'Module Name 3'),
                        // buildContent(context,3),
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
  bool expandName = false;
  Widget buildContent(BuildContext context,name){
    return
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: ClipRRect(
          borderRadius:    BorderRadius.circular(10),
          child: ExpansionTile(
            backgroundColor: Kdblue,
            collapsedBackgroundColor: Kdblue,
            expandedAlignment: Alignment.center,
            title:  projectNameinprofile(selected: false,name:name),
            trailing: GestureDetector(
              onTap: () {},
              child: ImageIcon(
                AssetImage('asset/threedots.png'),
                color: Colors.white,
              ),
            ),
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ContentElements('30','Tasks Entered'),
                    Divider(color: Colors.black,thickness: 1,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              width: 120,
                              child: Text('Assigned to')),
                          Wrap(
                            alignment: WrapAlignment.end,
                            children: [
                              _addModules(),
                              _addModules(),_addModules(),
                              InkWell(
                                onTap: (){},
                                child: ImageIcon(AssetImage('asset/addModules.png')),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Divider(color: Colors.black,thickness: 1,),
                    ContentElementsforStatus(),
                    Divider(color: Colors.black,thickness: 1,),
                    ContentElements('Admin/leadname','Lead'),
                    Divider(color: Colors.black,thickness: 1,),
                    ContentElements('March 07,2022','Deadline',),
                  ],
                ),
              )

            ],
          ),
        ),
      );
  }

  Widget _addModules(){
   return Image(image: AssetImage('asset/assignModuleCircle.png'),
           width: 25,
           height: 25,);

  }

  Widget ContentElementsforStatus (){
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Row(
        children: [
          Container(
              width: 125,
              child: Text(' Status ')
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('In Review',style: TextStyle(color: kyellow)),
                GestureDetector(
                  onTap: (){setState(() {
                    Marked(true);
                  });},
                  onDoubleTap: (){},
                  child: Wrap(
                    spacing: 20,
                    children: [
                      Text("Marked complete",style: TextStyle(color: Kdblue),),
                      Marked(false),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget Marked(bool value){
    return Container(
      height: 15,
      width: 15,

      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        color: value ? Colors.blue : Colors.white,

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

Widget ContentElements (String name,String type){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Container(
            width: 120,
            child: Text(type)),
        Expanded(child: Text(name,style: TextStyle(color: kyellow),)),
      ],
    ),
  );
}
