
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:revoo/Project_Management/Components/addProject.dart';
import 'package:revoo/Project_Management/profile/userProfileTeams.dart';

import '../../constants/constants.dart';
import '../Widgets/projectNameinprofile.dart';
import '../projectDashboard.dart';



class AllProjects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return userprofile();
  }
}


class userprofile extends State<AllProjects> {
  final String emplyeeName = "Employee Name";
  final String designationOfEmp = "Designation";
  int _index = 0;
  bool selected = false;
  var firebase = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(

          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              width: Get.width,
              margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
              child: Column(
                children: [
                  Container(
                    width: Get.width,

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
                  SizedBox(height: 10,),
                  Container(
                     width: Get.width,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "All projects",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff1B57A7),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.defaultDialog(
                                titleStyle: TextStyle(color: Kdblue),
                                backgroundColor: bgGrey,
                                title: 'Create Project',
                                content: AddProject()
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                 Image.asset(
                                    'asset/addicon.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                SizedBox(height: 10,),
                                Text(
                                  "create a project..",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Neue Haas Grotesk Display Pro',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                  ),
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
                  StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
                    stream: firebase.collection('Create Project').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData){
                        return Center(child: Text('Loading Data'));
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:  snapshot.data!.docs.length,
                              itemBuilder: (context,index){
                              return buildContent(context,snapshot.data!.docs[index]["Project_Name"],index);
                              },
                          ),
                           // buildContent(context,'Project Name 2'),
                           // buildContent(context,'Project Name 3'),
                          // buildContent(context,3),
                        ],
                      );
                    }
                  )
                ],
              ),
            )
          ),
        ),
    );
  }
  bool expandName = false;
  Widget buildContent(BuildContext context,name,index){
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
            StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
              stream: firebase.collection('Create Project').snapshots(),
              builder: (context, snapshot) {


                if(!snapshot.hasData){
                  return kprogressbar
                      ;
                }

                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ContentElements(snapshot.data!.docs[index]["projecttype"],'Type'),
                      Divider(color: Colors.black,thickness: 1,),
                      Wrap(
                        alignment: WrapAlignment.spaceAround,
                        children: [
                          ContentElements('7 memeber ','Team'),
                          InkWell(
                            onTap: (){Get.to(UserProfileTeams());},
                            child: Text('view all',style: TextStyle(color: Colors.blue )),
                          ),
                        ],
                      ),
                      Divider(color: Colors.black,thickness: 1,),
                      ContentElementsforStatus(),
                      Divider(color: Colors.black,thickness: 1,),
                      ContentElements(snapshot.data!.docs[index]["Lead_Name"],'Lead'),
                      Divider(color: Colors.black,thickness: 1,),

                      ContentElements(snapshot.data!.docs[index]["Deadline"],'Deadline',),
                    ],
                  ),
                );
              }
            )

          ],
    ),
        ),
      );
  }

}



//
// class Contents {
//   final Widget entry;
//   Contents({required this.entry});
// }

// final List<Contents> data = <Contents>[
//   Contents(
//       entry: ContentElements()
//   ),
//
//   Contents(
//       entry: ContentElements()
//   ),
//   Contents(
//       entry: ContentElements()
//   ),
//   Contents(
//       entry: ContentElements()
//   ),
// ];

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
                onTap: (){Marked(true);},
                onDoubleTap: (){

                },
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