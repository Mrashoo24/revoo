import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import '../graph/linegraph.dart';
import '../graph/piechart.dart';

class DuningMangement extends StatefulWidget {
  const DuningMangement({Key? key}) : super(key: key);

  @override
  _DuningMangementState createState() => _DuningMangementState();
}

class _DuningMangementState extends State<DuningMangement> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Duning Management',style: GoogleFonts.alegreyaSans(color:kblue,fontSize: 29),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 400,
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Container(
                    height: 300,
                    child: DateTimeComboLinePointChart.withSampleData()
                ),
              SizedBox(height: 10,),
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [

                  Text('Net Revenue',style:TextStyle(color:kblue,fontSize: 20),),


                  Text('\$ 56000/-',style: TextStyle(color:kyellow,fontSize: 20),)


                ],
              )
              ],
            )
          ),
        ),

      ],
    );
  }
}
