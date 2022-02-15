import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/home/admindashboard.dart';

import '../constants/constants.dart';


class HomePageMain extends StatefulWidget {
  const HomePageMain({Key? key}) : super(key: key);

  @override
  _HomePageMainState createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {

  GlobalKey<ScaffoldState> scafkey = GlobalKey<ScaffoldState>();
  var selectedCard = 'Home'; //for changing name
  var selectedindex = 0; //for changing index of page

  var homepages = [
    AdminDashboard(), //0
    Container(), //1
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafkey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            scafkey.currentState?.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),

            child: Image.asset('asset/navicon.png'),
          ),
        ),
        actions: [
          Image.asset('asset/bellicon.png'),
          Image.asset('asset/settingsicon.png'),
          Image.asset('asset/usericon.png'),
          SizedBox(width: 12,),
        ],
      ),
      bottomNavigationBar: Container(

        height: 100,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(

                child: Stack(
                  children: [
                    Align(

                      child: Container(
                        height: Get.height*0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                          color: Kdblue,

                        ),
                        child: Align(
                          alignment: Alignment.center,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipRect(child: Image.asset('asset/share.png')),
                              ClipRect(child: Image.asset('asset/homedash.png')),
                              Opacity(
                                  opacity: 0.01,
                                  child: ClipRect(child: Image.asset('asset/share.png'))
                              ),
                              ClipRect(child: Image.asset('asset/groupdash.png')),
                              ClipRect(child: Image.asset('asset/pathdash.png')),

                            ],
                          ),
                        ),
                      ),
                      alignment: Alignment.bottomCenter,
                    ),

                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset('asset/bnbAdd.png'),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child:  Card(
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
                        backgroundImage: AssetImage('asset/profile.jfif'),
                        radius: 30,
                      ),
                      SizedBox(width: 20,),
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
                                    child: Text('Name of the person',style: TextStyle(fontSize: 20,color: kblue),
                                        textAlign: TextAlign.left
                                    )),
                              ),
                              Container(


                                  child: Text('Role/Designation',style: TextStyle(fontSize: 18,color: kblue),
                                      textAlign: TextAlign.left
                                  )),
                              InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Text('Veiw Profile',style: TextStyle(fontSize: 15,color: kyellow),
                                          )),
                                      SizedBox(width: 15,),
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

                  SizedBox(height: 30,),
                  buildNavCard('asset/home.png','Home'),
                  SizedBox(height: 5,),
                  Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                  buildNavCard('asset/checkgrp.png','Daily Logins'),
                  SizedBox(height: 5,),
                  Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                  buildNavCard('asset/checkpad.png','Daily Updates'),
                  SizedBox(height: 5,),
                  Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                  buildNavCard('asset/lvapproval.png','Leave Request/\nApprovals'),
                  SizedBox(height: 5,),
                  Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                  buildNavCard('asset/logoff.png','Logout'),
                  SizedBox(height: 5,),


                ],
              ),
            ),

          ),

        ),
      ),
      body: homepages[selectedindex],
    );
  }

  buildNavCard(String image,String name) {

    return InkWell(
      onTap: (){
        setState(() {
          selectedCard = name;
          selectedCard == 'Home' ? selectedindex = 0 :selectedindex = 1;
        });
      },
      child: Card(
        color: selectedCard == name ?  Colors.white : bgGrey,
        elevation: selectedCard == name ? 2 : 0,
        child: Container(
          height: 70,
          child: Padding(

            padding: const EdgeInsets.only(left: 15.0,top: 10,bottom: 10,right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Image.asset(image,color: Kdblue,width: 20,height: 20,),

                SizedBox(width: 10,),

                Text(name,style: TextStyle(color: Colors.grey,fontSize: 20),),

              ],
            ),
          ),
        ),

      ),
    );
  }

}
