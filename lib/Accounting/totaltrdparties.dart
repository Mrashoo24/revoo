import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/constants/constants.dart';

class Totaltrdparties extends StatefulWidget {
  const Totaltrdparties({Key? key}) : super(key: key);

  @override
  _TotaltrdpartiesState createState() => _TotaltrdpartiesState();
}

class _TotaltrdpartiesState extends State<Totaltrdparties> {

  bool value = false;
  bool avalue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Container(
          height: Get.height,
          width: Get.width,

          padding: EdgeInsets.only(left: 10, right: 10),

          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Third-Parties',
                    style: TextStyle(
                      fontSize: 30,
                      color: kblue,
                    ),
                  ),
                  Image.asset('asset/addnew.png'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Past Request',
                        style: TextStyle(
                          fontSize: 20,
                          color: kblue,
                        ),
                      ),
                      Image.asset("asset/dpdn.png")
                    ],
                  ),
                ],
              ),

              SizedBox(height: 5),
              Container(
                height: 120,
                width: Get.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _dailCard('Added', 20),
                    _dailCard('Deleted', 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
  }
}



Widget _bottomNevigationBar() {
  return Container(
    height: 50,
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
                              child: Image.asset('asset/twopeopleicon.png')),
                          ClipRect(child: Image.asset('asset/homeicon.png')),
                          Opacity(
                              opacity: 0.01,
                              child: ClipRect(
                                  child:
                                  Image.asset('asset/twopeopleicon.png'))),
                          ClipRect(child: Image.asset('asset/GroupShare.png')),
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

