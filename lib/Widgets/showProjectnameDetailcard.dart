import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revoo/Widgets/projectNameinprofile.dart';

class showProjectnameDetailcard extends StatefulWidget {


@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  return _ShowContents();
}

}

class _ShowContents extends State<showProjectnameDetailcard> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Card(
        color: Colors.grey.withOpacity(0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpansionTile(
              title: projectNameinprofile(selected: true),
              trailing: GestureDetector(
                onTap: () {},
                child: ImageIcon(
                  AssetImage('asset/threedots.png'),
                  color: Colors.white,
                ),
              ),
              children: [
                Text('hi'),
                Text('hi'),
                Text('hi'),
                Text('hi'),Text('hi'),

              ],
            )
          ],
        ),
      ),
    );
  }

}