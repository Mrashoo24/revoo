import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  double percent = 0;
  static int TimeInMinut = 25;
  int TimeInSec = TimeInMinut * 60;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xff1542bf),Color(0xf51aff)
                  ],
                  begin: FractionalOffset(0.5,1)

              ),
            ),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 18.0),
                  child: Text(
                    "Promo Clock", style: TextStyle(color: Colors.blueGrey, fontSize: 50
                  )
                  ),
                ),
                Expanded(
                    child: CircularPercentIndicator(
                  percent: percent,
                animation: true,
                animateFromLastPercent: true,
                    radius: 220,
                    lineWidth: 20.0,
                    progressColor: Colors.pink,
                    center: Text("$TimeInMinut",
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 70.0

                    ),),),
                ),
                SizedBox(height: 50.0),
                Expanded(child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.pink[200],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),topLeft: Radius.circular(30.0)
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 30,left: 20, right: 20
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(child:
                        Row(
                          children: <Widget>[
                            Expanded(child: Column(
                              children: <Widget>[
                              Text(
                                "Pause Timer",
                                style: TextStyle(
                                  color: Colors.brown,fontSize: 30,

                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "24",style: TextStyle(
                                  color: Colors.brown,fontSize: 80
                              ),
                              )
                            ],)
                            ),

                          ],
                        )
                        ),

                      ],

                    ),
                  ),
                )
                )
              ],
            ),
        ),
        ),
    );
  }
}
