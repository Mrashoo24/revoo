import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../constants/constants.dart';
import '../Widgets/projectNameinprofile.dart';



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

              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
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
                  Container(
                     width: Get.width,

                      child: Row(
                        children: [
                          Text(
                            "All projects",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff1B57A7),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.3,
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
                                "create a project..",
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
                      buildContent(context,0),
                      buildContent(context,1),
                      buildContent(context,2),
                      buildContent(context,3),
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
  Widget buildContent(BuildContext context,index){
    return
      ExpansionPanelList(
        animationDuration: Duration(milliseconds: 500),

        expansionCallback: (index,bool){
          expandName = !bool;
          setState(() {

          });

        },

      children: [
        ExpansionPanel(headerBuilder: (context,opened){
          return ListTile(
            title: Text('Item 1'),
          );
        },
            canTapOnHeader: true,
            isExpanded:expandName,
            body: Column(
          children: [
            ContentElements(),
            ContentElements(),
            ContentElementsforStatus(),
            ContentElements(),
            ContentElements(),
          ],
        ))
      ],
    );

    //   ExpansionTile(
    //     backgroundColor: Kdblue,
    //   expandedAlignment: Alignment.center,
    //     title:  projectNameinprofile(selected: false),
    //   trailing: GestureDetector(
    //     onTap: () {},
    //     child: ImageIcon(
    //       AssetImage('asset/threedots.png'),
    //       color: Colors.blue,
    //     ),
    //   ),
    //   children: [
    //     ContentElements(),
    //     ContentElements(),
    //     ContentElementsforStatus(),
    //     ContentElements(),
    //     ContentElements(),
    //   ],
    // );
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

Widget ContentElements (){
  return Container(
    padding : EdgeInsets.symmetric(horizontal: 20,vertical: 0),
    color: Colors.grey.withOpacity(0.3),
    child:
        Wrap(
          spacing: 50,
          runSpacing: 10,
          alignment: WrapAlignment.spaceBetween,
          children: [
            Text(' Type '),
            Text('Front-end Development project'),
            SizedBox(width: Get.width,child:Divider(thickness: 1,color: Colors.blueAccent,) ,)
          ],
        ),
    );
}


Widget ContentElementsforStatus (){
  return Container(
    padding : EdgeInsets.symmetric(horizontal: 30,vertical: 0),
    color: Colors.grey.withOpacity(0.3),
    child:
    Wrap(
      spacing: 80,
      runSpacing: 10,
      alignment: WrapAlignment.spaceEvenly,
      children: [
        Text(' Status '),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Review'),
            GestureDetector(
              onTap: (){Marked(true);},
              onDoubleTap: (){Marked(false);},
              child: Wrap(
                spacing: 20,
                children: [
                  Text("Marked complete"),
                  Marked(false),
                ],
              ),
            ),
          ],
        ),
        SizedBox(width: Get.width,
          child:Divider(thickness: 1,color: Colors.blueAccent,) ,)
      ],
    ),
  );
}

Widget Marked(bool value){
  return Container(
    height: 10,
    width: 10,
    color: value ? Colors.blue : Colors.white,
    // decoration: BoxDecoration(
    //   border: Border.all(color: Colors.blue)
    // ),
  );
}