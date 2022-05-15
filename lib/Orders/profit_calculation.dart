import 'package:charts_flutter/flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revoo/graph/piechart.dart';

import '../constants/constants.dart';

class ProfitCalculation extends StatefulWidget {
  const ProfitCalculation({Key? key}) : super(key: key);

  @override
  _ProfitCalculationState createState() => _ProfitCalculationState();
}

class _ProfitCalculationState extends State<ProfitCalculation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Profit Calculations',style: GoogleFonts.alegreyaSans(color:kblue,fontSize: 29),
        ),
        Container(
          height: 200,
          child: PieChartMine(dataMap: {
            "Purcahse": 10000,
            "Sales": 30000,
          },),
        ),
        
      ],
    );
  }
}
