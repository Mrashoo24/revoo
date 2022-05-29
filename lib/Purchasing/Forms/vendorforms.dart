import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:revoo/Purchasing/Forms/vendorReports.dart';
import 'package:revoo/constants/constants.dart';

class AllVendorForms extends StatefulWidget {
 final String reqId ;
 final String name ;
  const AllVendorForms({Key? key, required this.reqId, required this.name}) : super(key: key);

  @override
  _AllVendorFormsState createState() => _AllVendorFormsState();
}

class _AllVendorFormsState extends State<AllVendorForms> {
  var firebase = FirebaseFirestore.instance.collection("RFQform");
  bool value = false;
  bool avalue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,

            padding: EdgeInsets.only(left: 10, right: 10),

            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>> (
                stream: firebase.snapshots() ,
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return kprogressbar;
                  }

                  var prodList = snapshot.requireData.docs;

                  var sentForms =   prodList.where((element) => double.parse(element.get('vendors')) > 0 ).toList();

                  var waitingForm =    prodList.where((element) => double.parse(element.get('recievedforms')) > 0 ).toList();

                  var lateForm =    prodList.where((element) => DateFormat('yyyy/MM/dd').parse(element.get('expirydate') ).isAfter(DateTime.now())
                      && element.get('status') == '0'
                  ).toList();


                  return ListView(
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: (){
                                Get.back();
                              },
                              child: Icon(CupertinoIcons.arrow_left,color: Kdblue,)),
                          Center(
                            child: Text(
                              'Forms',
                              style: TextStyle(
                                fontSize: 30,
                                color: kblue,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 5),
                      // Container(
                      //   height: 120,
                      //   width: Get.width,
                      //   child: ListView(
                      //     scrollDirection: Axis.horizontal,
                      //     children: [
                      //       _dailCard('Sent', sentForms.length),
                      //       _dailCard('Waiting', waitingForm.length),
                      //       _dailCard('Late', lateForm.length),
                      //     ],
                      //   ),
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            thickness: 2,
                          ),
                        ],
                      ),

                      Container(
                        height: Get.height * 0.7,
                        //color: Colors.black,
                        child: ListView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index){
                              return Container(
                                child: Column(
                                    children : [
                                      _TasksCard('13/02/2022', 'Vendor $index','16/02/2022'),
                                      // _TasksCard('RFQ Name'),
                                      // _TasksCard('RFQ Name'),
                                      // _TasksCard('RFQ Name'),
                                      // _TasksCard('RFQ Name'),
                                      // _TasksCard('RFQ Name'),
                                      // _TasksCard('RFQ Name'),
                                    ]
                                ),
                              );
                            }
                        ),
                      )

                    ],
                  );
                }
            ),
          ),
        ));
  }

  Widget _TasksCard(cdate, text ,date) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15),),
        color: kblue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  Container(
                    child: Text('Vendor Name',
                      style: TextStyle(color: kyellow, fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),


              Row(
                children: [
                  Container(
                    child: Text('Sent Date',
                      style: TextStyle(color: kyellow, fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    cdate,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),


              Row(
                children: [
                  Container(
                    child: Text('Delivery Date',
                      style: TextStyle(color: kyellow, fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    date,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),


            ],
          ),
          SizedBox(height: 20,),

          ElevatedButton(onPressed: (){

            Get.to(VendorQoutations());

          }, child: Text('View Quotation'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kyellow)
            ),
          )
        ],
      ),
    );
  }
}







AppBar _buildappBar() {
  return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: Image.asset('asset/bellicon.png')),
        IconButton(onPressed: () {}, icon: Image.asset('asset/gareicon.png')),
        IconButton(
            onPressed: () {}, icon: Image.asset('asset/userprofileicon.png')),
      ],
      leading: IconButton(
          onPressed: () {
            // Get.to(ProjectHomePage(
            //   key: scafkey,
            // ));
          },
          icon: Icon(
            FontAwesomeIcons.bars,
            color: Colors.black,
          )));
}
//
// Widget _bottomNevigationBar() {
//   return Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//         image: AssetImage('asset/Rectangleforbnb.png'),
//         fit: BoxFit.fitWidth,
//       )),
//       child: ClipRRect(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(100),
//           topRight: Radius.circular(100),
//         ),
//         child: BottomNavigationBar(
//             elevation: 0,
//             backgroundColor: Color(0xff1B57A7),
//             type: BottomNavigationBarType.fixed,
//             showSelectedLabels: false,
//             showUnselectedLabels: false,
//             items: [
//               BottomNavigationBarItem(
//                 icon: ImageIcon(
//                   AssetImage('asset/twopeopleicon.png'),
//                   color: Colors.white,
//                 ),
//                 label: 'share',
//               ),
//               BottomNavigationBarItem(
//                 icon: ImageIcon(
//                   AssetImage('asset/homeicon.png'),
//                   color: Colors.white,
//                 ),
//                 label: 'home',
//               ),
//               BottomNavigationBarItem(
//                 icon: ImageIcon(
//                   AssetImage('asset/userprofileicon.png'),
//                   color: Colors.white,
//                 ),
//                 label: 'home',
//               ),
//               BottomNavigationBarItem(
//                 icon: ImageIcon(
//                   AssetImage('asset/mssage.png'),
//                   color: Colors.white,
//                 ),
//                 label: 'home',
//               ),
//             ]),
//       ));
// }

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
