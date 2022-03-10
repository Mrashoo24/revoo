import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Hostoryvndrname extends StatefulWidget {
  const Hostoryvndrname({Key? key}) : super(key: key);

  @override
  _HostoryvndrnameState createState() => _HostoryvndrnameState();
}

class _HostoryvndrnameState extends State<Hostoryvndrname> {
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
        Center(
          child: Text(
            'Request of Quotation',
            style: TextStyle(
              fontSize: 30,
              color: kblue,
            ),
          ),
        ),

        SizedBox(height: 5),
        Container(
          height: 120,
          width: Get.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _dailCard('Total', 20),
              _dailCard('Pending', 5),

            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Past Request',
              style: TextStyle(
                fontSize: 22,
                color: kblue,
              ),
            ),

            Container(

              width: Get.width,
              height: 100,

              child: Column(
                children: [
                  Align(
                      child: Text("Data Created Feb 17,22",style: TextStyle(color: Colors.white,fontSize: 20),)),
                ],
              ),

              color: Kdblue,
            )
          ],
        ),
      ],
    ),
  ),
)
    );
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