import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../constants/constants.dart';
import '../Components/addNewTeamMember.dart';

class UserProfileTeams extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _teamState();
  }
}

class _teamState extends State<UserProfileTeams> {
  var firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
            appBar: _buildappBar(),
            backgroundColor: Colors.white,
            body: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 2,vertical: 0),
              child: ListView(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height,
                    padding: EdgeInsets.symmetric(
                        horizontal: 5, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Welcome,Tanishq Bhoir",
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
                          "SDE of Employee",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Neue Haas Grotesk Display Pro'),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width*0.47,
                                height: Get.height*0.25,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'asset/userTEamsbackground.png'),
                                  ),
                                ),
                                child:Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'My Teams',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [
                                            Image.asset(
                                                'asset/EllipseforuserTeams.png',
                                            fit: BoxFit.fitWidth,),
                                            Image.asset(
                                                'asset/EllipsesmallForuserTeams.png'),
                                            Text('7',
                                              textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                ),
                              ),
                              Container(
                                width: Get.width*0.47,
                                height: Get.height*0.25,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'asset/userTEamsbackground.png'),
                                  ),
                                ),
                                child:Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'My Tasks',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          Image.asset(
                                            'asset/EllipseforuserTeams.png',
                                            fit: BoxFit.fitWidth,),
                                          Image.asset(
                                              'asset/EllipsesmallForuserTeams.png'),
                                          Text('30',
                                            textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                          ),)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 2),
                            child: Row(
                                children: [
                                  Text(
                                    "My Team",
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Color(0xff1B57A7),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.4,
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {Get.to(AddNewMember());},
                                        icon: Image.asset(
                                          'asset/addicon.png',
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text('Add New Member',style: TextStyle(color: kblue),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        Container(
                          height: 300,
                          width: Get.width,
                            decoration: BoxDecoration(color: greytxtbx,borderRadius: BorderRadius.circular(30)),
                            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                              stream: firebase.collection('My_Project_Team').snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData){
                                  return Center(child: Text('Loading Data'));
                                }
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Expanded(
                                        child: Column(
                                          children: [
                                            // CircleAvatar(radius: 20,backgroundColor: kblue,)
                                            //completed code for data read
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20,top: 20,),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(snapshot.data!.docs[index]["Employee"],style: TextStyle(fontSize: 20,color: kblue),),
                                                ],
                                              ),
                                            ),
                                            Divider(thickness: 2,color: Colors.white,endIndent: 15,indent: 25,)
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  );
                              }
                            ),
                        ),
                        // SizedBox(
                        //   height: 15,
                        // ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            child: Row(
                                children: [
                                  Text(
                                    "Project Management",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color(0xff1B57A7),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                    ),
                                    child: Text(
                                      "visit",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        Container(
                            height: 200,
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Meetings"),
                                  SizedBox(height: 18,),
                                  Text("Meetings"),
                                  SizedBox(height: 18,),
                                  Text("Meetings"),
                                  SizedBox(height: 18,),
                                  Text("Meetings"),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              thickness: 3,
                              color: Colors.black,
                              width: 50,
                            ),
                            VerticalDivider(
                              thickness: 3,
                              color: Colors.black,
                              width:50,
                            ),
                            VerticalDivider(
                              thickness: 3,
                              color: Colors.black,
                              width: 50,
                            ),
                            VerticalDivider(
                              thickness: 3,
                              color: Colors.black,
                              width: 50,
                            ),
                            VerticalDivider(
                              thickness: 3,
                              color: Colors.black,
                              width: 50,
                            )
                          ],
                        )),
                        // Container(
                        //   alignment: Alignment.center,
                        //   margin: EdgeInsets.all(5),
                        //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        //   decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //       image: AssetImage('asset/RectangleforSendMessages.png'),
                        //       fit: BoxFit.fitWidth
                        //     )
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       Wrap(
                        //         children: [
                        //           Text("Send message to "),
                        //           Text("Employeee's name")
                        //         ],
                        //       ),
                        //       SizedBox(height: 10,),
                        //       Wrap(
                        //         children: [
                        //           Container(
                        //             height: 25,
                        //             width: Get.width*0.7,
                        //             child: TextFormField(
                        //               decoration: InputDecoration(
                        //                   hintText: 'Type your messages',
                        //                   focusedBorder: OutlineInputBorder(
                        //                       borderSide: BorderSide(
                        //                         color: Colors.blueAccent,
                        //                       )
                        //                   ),
                        //                   hintStyle: TextStyle(
                        //                       color: Colors.grey
                        //                   )
                        //               ),
                        //             ),
                        //           ),
                        //           Image.asset('asset/messageSendicon.png')
                        //         ],
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            )
            ));
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
            //Get.off(
                // ProjectHomePage(key: scafkey,));
            },
          icon: Icon(
            FontAwesomeIcons.bars,
            color: Colors.black,
          )));
}
