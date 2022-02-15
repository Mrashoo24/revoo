import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class projectNameinprofile extends StatelessWidget {
  final String unselectedimg = 'asset/rectangleforprofileunselected.png';
  final String selectedimage = 'asset/rectangleforprofileseleccted.png';
  final String uparrowwigdet = 'asset/arrowup.png';
  final String downarrowwigdet = 'asset/arrowdown.png';
  final bool selected;
  final String projectName = 'Project name';

  projectNameinprofile({required this.selected});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        width: Get.width * 0.9,
        height: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: selected
                ? AssetImage('asset/rectangleforprofileseleccted.png')
                : AssetImage(
                    'asset/rectangleforprofileunselected.png',
                  ),
            fit: BoxFit.fitWidth,
          ),
        ),

        child: Wrap(
              children: [
                Text(
                  '${projectName}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffEAEBED),
                    fontFamily: 'Neue Haas Grotesk Display Pro',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: ImageIcon(
                    AssetImage(
                      selected ? 'asset/arrowup.png' : 'asset/arrowdown.png',
                    ),
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.35,
                ),
              ],
            ),
            // children: [
            //   Card(
            //         color: Colors.black,
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 Text('Type'),
            //                 Text('Team'),
            //                 Text('Status'),
            //                 Text('Lead'),
            //                 Text('DeadLine'),
            //               ],
            //             ),
            //             Column(children: [
            //               Text('Type'),
            //               Text('Team'),
            //               Text('Status'),
            //               Text('Lead'),
            //               Text('DeadLine'),
            //             ]),
            //           ],
            //         )),
            // ]
    );
  }
}
