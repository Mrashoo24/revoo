import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:revoo/constants/constants.dart';

class projectNameinprofile extends StatelessWidget {
  final String name;
  final String unselectedimg = 'asset/rectangleforprofileunselected.png';
  final String selectedimage = 'asset/rectangleforprofileseleccted.png';
  final String uparrowwigdet = 'asset/arrowup.png';
  final String downarrowwigdet = 'asset/arrowdown.png';
  final bool selected;
  final String projectName = 'Project name';

  projectNameinprofile({required this.selected,required this.name});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
          children: [
            Text(
              '${name}',
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

            // GestureDetector(
            //   onTap: () {},
            //   child: ImageIcon(
            //     AssetImage('asset/threedots.png'),
            //     color: Colors.blue,
            //   ),
            // ),
          ],
        );
  }
}
