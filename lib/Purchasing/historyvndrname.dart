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
  body: SingleChildScrollView(
    child: Container(
      height: Get.height,
      width: Get.width,

      padding: EdgeInsets.only(left: 10, right: 10),

      child: ListView(
        children: [
          Align(
              alignment: Alignment(-0.8,0),
              child: Column(
                children: [
                  Text("History",style: TextStyle(color: kblue,fontSize: 32,)),
                  Text("Vendore Name",style: TextStyle(color: kblue,fontSize: 15,)),
                ],
              )),
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
          ),SizedBox(height: 20),
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
              SizedBox(height: 8,),
              Container(

                width: Get.width,
                height: 100,


                decoration: BoxDecoration(
                  color: Kdblue,
                    borderRadius: BorderRadius.circular(10), ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Data Created: Feb 17,22",style: TextStyle(color: Colors.white,fontSize: 19),

                              ),
                              SizedBox(width: 130,),
                              CircleAvatar(radius: 8,backgroundColor: Colors.green,),
                            ],
                          ),
                          Row(
                            children: [
                              Text("RFQ IOT Device",style: TextStyle(color: kyellow,fontSize: 25),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("BioMetric, Sensors, Chip Connector, \nRasberry device  ",style: TextStyle(color: Colors.white,fontSize: 10,),),
                              SizedBox(width: 130,),
                              Text("2000",style: TextStyle(color:  kyellow,fontSize: 25,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


              ),

              SizedBox(height: 8,),
              Container(

                width: Get.width,
                height: 100,


                decoration: BoxDecoration(
                  color: Kdblue,
                  borderRadius: BorderRadius.circular(10), ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Data Created: Feb 17,22",style: TextStyle(color: Colors.white,fontSize: 19),

                              ),
                              SizedBox(width: 130,),
                              CircleAvatar(radius: 8,backgroundColor: Colors.green,),
                            ],
                          ),
                          Row(
                            children: [
                              Text("RFQ IOT Device",style: TextStyle(color: kyellow,fontSize: 25),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("BioMetric, Sensors, Chip Connector, \nRasberry device  ",style: TextStyle(color: Colors.white,fontSize: 10,),),
                              SizedBox(width: 130,),
                              Text("2000",style: TextStyle(color:  kyellow,fontSize: 25,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


              ),

              SizedBox(height: 8,),
              Container(

                width: Get.width,
                height: 100,


                decoration: BoxDecoration(
                  color: Kdblue,
                  borderRadius: BorderRadius.circular(10), ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Data Created: Feb 17,22",style: TextStyle(color: Colors.white,fontSize: 19),

                              ),
                              SizedBox(width: 130,),
                              CircleAvatar(radius: 8,backgroundColor: Colors.red,),
                            ],
                          ),
                          Row(
                            children: [
                              Text("RFQ IOT Device",style: TextStyle(color: kyellow,fontSize: 25),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("BioMetric, Sensors, Chip Connector, \nRasberry device  ",style: TextStyle(color: Colors.white,fontSize: 10,),),
                              SizedBox(width: 130,),
                              Text("2000",style: TextStyle(color:  kyellow,fontSize: 25,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


              ),

              SizedBox(height: 8,),
              Container(

                width: Get.width,
                height: 100,


                decoration: BoxDecoration(
                  color: Kdblue,
                  borderRadius: BorderRadius.circular(10), ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Data Created: Feb 17,22",style: TextStyle(color: Colors.white,fontSize: 19),

                              ),
                              SizedBox(width: 130,),
                              CircleAvatar(radius: 8,backgroundColor: Colors.green,),
                            ],
                          ),
                          Row(
                            children: [
                              Text("RFQ IOT Device",style: TextStyle(color: kyellow,fontSize: 25),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("BioMetric, Sensors, Chip Connector, \nRasberry device  ",style: TextStyle(color: Colors.white,fontSize: 10,),),
                              SizedBox(width: 130,),
                              Text("2000",style: TextStyle(color:  kyellow,fontSize: 25,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


              ),

              SizedBox(height: 8,),
              Container(

                width: Get.width,
                height: 100,


                decoration: BoxDecoration(
                  color: Kdblue,
                  borderRadius: BorderRadius.circular(10), ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Data Created: Feb 17,22",style: TextStyle(color: Colors.white,fontSize: 19),

                              ),
                              SizedBox(width: 130,),
                              CircleAvatar(radius: 8,backgroundColor: Colors.red,),
                            ],
                          ),
                          Row(
                            children: [
                              Text("RFQ IOT Device",style: TextStyle(color: kyellow,fontSize: 25),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("BioMetric, Sensors, Chip Connector, \nRasberry device  ",style: TextStyle(color: Colors.white,fontSize: 10,),),
                              SizedBox(width: 130,),
                              Text("2000",style: TextStyle(color:  kyellow,fontSize: 25,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


              ),

              SizedBox(height: 8,),
              Container(

                width: Get.width,
                height: 100,


                decoration: BoxDecoration(
                  color: Kdblue,
                  borderRadius: BorderRadius.circular(10), ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Data Created: Feb 17,22",style: TextStyle(color: Colors.white,fontSize: 19),

                              ),
                              SizedBox(width: 130,),
                              CircleAvatar(radius: 8,backgroundColor: Colors.green,),
                            ],
                          ),
                          Row(
                            children: [
                              Text("RFQ IOT Device",style: TextStyle(color: kyellow,fontSize: 25),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("BioMetric, Sensors, Chip Connector, \nRasberry device  ",style: TextStyle(color: Colors.white,fontSize: 10,),),
                              SizedBox(width: 130,),
                              Text("2000",style: TextStyle(color:  kyellow,fontSize: 25,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


              ),

              SizedBox(height: 8,),
              Container(

                width: Get.width,
                height: 100,


                decoration: BoxDecoration(
                  color: Kdblue,
                  borderRadius: BorderRadius.circular(10), ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Data Created: Feb 17,22",style: TextStyle(color: Colors.white,fontSize: 19),

                              ),
                              SizedBox(width: 130,),
                              CircleAvatar(radius: 8,backgroundColor: Colors.red,),
                            ],
                          ),
                          Row(
                            children: [
                              Text("RFQ IOT Device",style: TextStyle(color: kyellow,fontSize: 25),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("BioMetric, Sensors, Chip Connector, \nRasberry device  ",style: TextStyle(color: Colors.white,fontSize: 10,),),
                              SizedBox(width: 130,),
                              Text("2000",style: TextStyle(color:  kyellow,fontSize: 25,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


              ),


            ],
          ),
        ],
      ),
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