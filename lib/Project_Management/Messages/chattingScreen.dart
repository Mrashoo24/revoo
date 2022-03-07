import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:revoo/constants/constants.dart';

class chattingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _chattingState();
}

class _chattingState extends State<chattingPage> {
  
  String name = 'Name of the employee';
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar:  _buildappBar(),
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
        ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: ListView(
          children: [
            Container(
              height: 45,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(5),
              child: ListTile(
                leading: ImageIcon(AssetImage('asset/iconnavigationchevron.png')),

                title: Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 20,
                    ),
                    Text(' $name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kyellow,
                      ),),
                  ],
                ),
              ),
            ),

            // ListTile(
            //   leading: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(20)),
            //     child: Container(
            //       height: 5,
            //       width: 5,
            //       color: kyellow,
            //     ),),
            //   title: Container(
            //     height: 10,
            //     width: 50,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.all(Radius.circular(20)),
            //       color: Kdblue
            //     ),
            //   ),
            // ),
            // ListTile(
            //   leading: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(20)),
            //     child: Container(
            //       height: 5,
            //       width: 5,
            //       color: Kdblue,
            //     ),),
            //   title: Container(
            //     height: 10,
            //     width: 40,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.all(Radius.circular(20))
            //     ),
            //   ),
            // ),
            // ListTile(
            //   leading: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(20)),
            //     child: Container(
            //       height: 5,
            //       width: 5,
            //       color: kyellow,
            //     ),),
            //   title: Container(
            //     height: 30,
            //     width: 50,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.all(Radius.circular(20)),
            //         color: Kdblue
            //     ),
            //   ),
            // ),
            // ListTile(
            //   leading: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(20)),
            //     child: Container(
            //       height: 5,
            //       width: 5,
            //       color: Kdblue,
            //     ),),
            //   title: Container(
            //     height: 25,
            //     width: 40,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.all(Radius.circular(20))
            //     ),
            //   ),
            // ),

            _Sender(),
            _Reciver(),
            _Sender(),
            _Reciver(),  _Sender(),
            _Reciver(),

           Container(
             alignment: Alignment.bottomCenter,
             color: bgGrey,
             margin: EdgeInsets.only(top: 40),
             padding: EdgeInsets.all(10),
             child: Expanded(
               child: Row(
                 // alignment: WrapAlignment.spaceBetween,
                 children: [
                   Container(
                     margin: EdgeInsets.only(bottom: 20,top: 20),
                     height: 50,
                     decoration: BoxDecoration(
                         border:Border.all(color: Kdblue,width: 2),
                       color: bgGrey
                     ),
                     width: Get.width*0.8,
                     child: TextFormField(
                       decoration: InputDecoration(
                           hintText: ' Type your messages',
                           hintStyle: TextStyle(
                               color: Colors.grey
                           )
                       ),
                     ),
                   ),
                   SizedBox(width: 20,),
                   Image.asset('asset/messageSendicon.png',height: 20,width: 20,)
                 ],
               ),
             ),
           ),
          ],
        ),
      ),

    ));
  }

  Widget _Sender(){
    return Container(
      margin: EdgeInsets.all(5),
      height: 50,
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              height: 10,
              width: 10,
              color: Kdblue,
            ),),
          SizedBox(width: 20,),
          Container(
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Kdblue
            ),
          )
        ],
      ),
    );
  }

  Widget _Reciver(){
    return Container(
      margin: EdgeInsets.all(5),
      height: 60,
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              color: kyellow
            ),
          ),
          SizedBox(width: 20,),
          ClipRRect(borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              height: 10,
              width: 10,
              color: kyellow,
            ),),
        ],
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
