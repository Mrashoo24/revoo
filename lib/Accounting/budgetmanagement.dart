import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class BudgetMgmt extends StatefulWidget {
  const BudgetMgmt({Key? key}) : super(key: key);

  @override
  _BudgetMgmtState createState() => _BudgetMgmtState();
}

class _BudgetMgmtState extends State<BudgetMgmt> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Align(
              alignment: Alignment.topCenter,
              child: Text("Budget Management",style: TextStyle(color: kblue,fontSize: 30),)),
        ),
      ),


    );
  }
}
