import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:revoo/constants/constants.dart';

class PopUpsPM extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _popUPs();
}

class _popUPs extends State<PopUpsPM> {
  int card1 = 1;
  int card2 = 2;

  List<String> card1items = ['Type', 'Team', 'Lead', 'Deadline'];
  List<String> card2items = [
    'Task Name',
    'Description',
    'Assigned',
    'Deadline'
  ];
  List<String> card1hint = [
    'Type of your project','',
    'Type your lead',
    'Type your due date',
  ];
  List<String> card2hint = [
    'Type your tasks heading',
    'Type your tasks description','',
    'Type your due date',''
  ];

  TextEditingController typeproject = TextEditingController();
  TextEditingController typelead = TextEditingController();
  TextEditingController typeProjectDate = TextEditingController();
  TextEditingController TaskDescription = TextEditingController();
  TextEditingController taskHeading = TextEditingController();
  TextEditingController taskDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.all(10),
              child: Expanded(
                child: Column(
                  children: [
                    Text(
                      'Pop-ups for Project Management',
                      style: TextStyle(
                        fontSize: 20,
                        color: kblue,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _cardView(card1),
                    _cardView(card2),
                  ],
                ),
              ),
            )));
  }

  Widget _cardView(cardnum) {
    return Card(
      color: bgGrey,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              cardnum == 1 ? 'Create a project' : 'Add Tasks',
              style: TextStyle(
                fontSize: 24,
                color: kblue,
              ),
            ),
            SizedBox(height: 10,),
            _inputItems(cardnum, 0),
            SizedBox(height: 10,),
            _inputItems(cardnum, 1),
            SizedBox(height: 10,),
            _inputItems(cardnum, 2),
            SizedBox(height: 20,),
            _inputItems(cardnum, 3),
            SizedBox(height: 20,),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Clear',style: TextStyle(
                  color: Kdblue
                ),),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.white),
                      padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        //borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Kdblue)
                      )
                    )
                  ),

                ),
                SizedBox(width: 20,),
                ElevatedButton(onPressed: () {}, child: Text('Create'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Kdblue)
                  ),),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _itemsContainer(name) {
    return Container(
      width: 120,
      child: Text(
        '$name',
        textAlign: TextAlign.start,
      ),
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
      fontSize: 12,
      color: Color(0xff707070),
    );
  }

  Widget _inputItems(cardnum, itemnum) {
    if (cardnum == 1 && itemnum == 1 || cardnum == 2 && itemnum==2) {
      return Wrap(
        children: [
          _itemsContainer(
              cardnum == 1 ? card1items[itemnum] : card2items[itemnum]),
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Container(
                color: Colors.white,
                height: 30,
                width: 200,
              ),
              _empName()
            ],
          )
        ],
      );
    }
    else {
      return Wrap(
        children: [
          _itemsContainer(
              cardnum == 1 ? card1items[itemnum] : card2items[itemnum]),
          Container(
            width: 200,
            height: 30,
            child: TextFormField(
              controller: typeproject,
              decoration: InputDecoration(
                focusedBorder: null,
                filled: true,
                fillColor: Colors.white,
                hintText: cardnum == 1
                    ? card1hint[itemnum]
                    : card2hint[itemnum],
                hintStyle: _textStyle(),
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: null,

                //suffixIcon: itemnum ==2 ? ImageIcon(AssetImage('asset/calendar.png')) : null,
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _empName() {
    return Container(
      height: 20,
      width: 100,
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: kyellow
      ),
      padding: EdgeInsets.all(2),
      child: Text('Employeename', style: TextStyle(color: kblue,
          fontSize: 12),textAlign: TextAlign.center,),
    );
  }
}
