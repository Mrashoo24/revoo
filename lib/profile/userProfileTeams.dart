import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class userProfileTeams extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _teamState();
  }
}

class _teamState extends State<userProfileTeams> {
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
                          "Welcome, Roshan Prajapati",
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
                                          'My Tems',
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
                                              textAlign: TextAlign.center,)
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
                                        'My Tems',
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
                                            textAlign: TextAlign.center,)
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
                                      fontSize: 25,
                                      color: Color(0xff1B57A7),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.5,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'asset/addicon.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        Container(
                            height: 40,
                            width: Get.width,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Image.asset(
                                      'asset/blackcircleForuserTeams.png'),
                                  SizedBox(width: 10,),
                                  Image.asset(
                                      'asset/blackcircleForuserTeams.png'),
                                  SizedBox(width: 10,),
                                  Image.asset(
                                      'asset/blackcircleForuserTeams.png'),
                                  SizedBox(width: 10,),
                                  Image.asset(
                                      'asset/blackcircleForuserTeams.png'),
                                  SizedBox(width: 10,),
                                  Image.asset(
                                      'asset/blackcircleForuserTeams.png'),
                                  SizedBox(width: 10,),
                                  Image.asset(
                                      'asset/blackcircleForuserTeams.png'),
                                  SizedBox(width: 10,),
                                  Image.asset(
                                      'asset/blackcircleForuserTeams.png'),
                                ],
                              )),
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
                                      fontSize: 25,
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
                        Expanded(child: Row(
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
                        SizedBox(height: 10,),
                        Text("My Calendar",style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('asset/RectangleforSendMessages.png'),
                              fit: BoxFit.fitWidth
                            )
                          ),
                          child: Column(
                            children: [
                              Wrap(
                                children: [
                                  Text("Send message to "),
                                  Text("Employeee's name")
                                ],
                              ),
                              SizedBox(height: 10,),
                              Wrap(
                                children: [
                                  Container(
                                    height: 25,
                                    width: Get.width*0.7,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'Type your messages',
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blueAccent,
                                              )
                                          ),
                                          hintStyle: TextStyle(
                                              color: Colors.grey
                                          )
                                      ),
                                    ),
                                  ),
                                  Image.asset('asset/messageSendicon.png')
                                ],
                              )
                            ],
                          ),
                        )
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
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.bars,
            color: Colors.black,
          )));
}
