import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:revoo/constants/constants.dart';



class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _showTasks();
}

class _showTasks extends State<Home> {
  bool value = false;
  bool avalue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,

            padding: EdgeInsets.only(left: 10, right: 10),

            child: ListView(
              children: [
                Row(
                  children: [
                    Text("Reports",style: TextStyle(color: kblue,fontSize: 35),),
                    SizedBox(width: 50),
                    Image.asset("asset/clockline.png"),
                    SizedBox(width: 50),
                    Image.asset("asset/graphhh.png",color: kblue,)
                  ],
                ),

                SizedBox(height: 5),
                Container(
                  height: 120,
                  width: Get.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _dailCard('Sent', 20),
                      _dailCard('Waiting', 5),
                      _dailCard('Late', 25),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ));
  }



}





Widget _dailCard(name, number) {
  return Container(
    width: 120,
    height: 80,
    margin: EdgeInsets.only(left: 15),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('asset/cardbvvvg.png'),
      ),
    ),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$name',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                'asset/EllipseforuserTeams.png',
                fit: BoxFit.fitWidth,
              ),
              Image.asset('asset/EllipsesmallForuserTeams.png'),
              Text('$number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    ),
  );
}
