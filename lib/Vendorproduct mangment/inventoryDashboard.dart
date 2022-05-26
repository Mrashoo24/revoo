import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/Vendorproduct%20mangment/serialnumber48.dart';
import 'package:revoo/Vendorproduct%20mangment/tansfer47.dart';
import 'package:revoo/Vendorproduct%20mangment/transaction44.dart';
import 'package:revoo/Vendorproduct%20mangment/transferadd46.dart';
import 'package:revoo/Vendorproduct%20mangment/vendorproduct38.dart';

import '../Controllers/authcontroller.dart';
import '../constants/commonWidgets.dart';
import '../constants/constants.dart';
import 'Batchmangment51.dart';
import 'goodissue42.dart';
import 'goodsissue43.dart';
import 'inventory reports52.dart';

class InventoryDashboard extends StatefulWidget {
  const InventoryDashboard({Key? key}) : super(key: key);

  @override
  _InventoryDashboardState createState() => _InventoryDashboardState();
}

class _InventoryDashboardState extends State<InventoryDashboard> {
  GlobalKey<ScaffoldState> scafkey = GlobalKey<ScaffoldState>();
  var selectedCard = 'Home'; //for changing name
  var selectedindex = 0; //for changing index of page

  var homepages = [
    Addproduct38(),
    Goodissue(),
    Goodsissue43(),
    Transaction44(),
    Transfercontact46(),
    Inventory52(),
    Serialnumber48(),

    Batchmangment(),






  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: (){print('clicked');
          scafkey.currentState?.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),

            child: Image.asset('asset/navicon.png'),
          ),
        ),
        actions: [
          Image.asset('asset/bellicon.png'),

          Image.asset('asset/settingsicon.png'),

          Image.asset('asset/usericon.png'),

          SizedBox(width: 12,),
        ],
      ),
      drawer: buildDrawer(),
      bottomNavigationBar: commonWidgets.buildBNB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: CommonWidgets().kfloatingButton(),

    key: scafkey,
      backgroundColor: Colors.white,
      body: homepages[selectedindex],
    );
  }


  buildDrawer(){
    return  Drawer(
      child:  Card(
        color: Colors.grey.shade200,
        shape: Border(
          right: BorderSide(style: BorderStyle.none),


        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: SingleChildScrollView(
            child: Column(

              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('asset/profile.jfif'),
                      radius: 30,
                    ),

                    SizedBox(width: 20,),

                    Align(

                      alignment: Alignment.bottomLeft,

                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text('Name of the person',style: TextStyle(fontSize: 20,color: kblue),
                                      textAlign: TextAlign.left
                                  )),
                            ),
                            Container(


                                child: Text('Role/Designation',style: TextStyle(fontSize: 18,color: kblue),
                                    textAlign: TextAlign.left
                                )),
                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                        child: Text('Veiw Profile',style: TextStyle(fontSize: 15,color: kyellow),
                                        )),
                                    SizedBox(width: 15,),
                                    Image.asset('asset/rightarrow.png')
                                  ],

                                ),

                              ),

                            ),


                          ],
                        ),
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),

                buildNavCard('asset/checkpad.png','Product List',0),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),

                buildNavCard('asset/lvapproval.png','Goods Receipts',1),
                SizedBox(height: 5,),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),

                buildNavCard('asset/lvapproval.png','Goods Issues',2),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                SizedBox(height: 5,),

                buildNavCard('asset/lvapproval.png','Transactions',3),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                SizedBox(height: 5,),

                buildNavCard('asset/lvapproval.png','Transfers',4),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                SizedBox(height: 5,),

                buildNavCard('asset/lvapproval.png','Inventory Report',5),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                SizedBox(height: 5,),

                buildNavCard('asset/lvapproval.png','Serial Number Management',6),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                SizedBox(height: 5,),

                buildNavCard('asset/lvapproval.png','Batch Number Management',7),
                Divider(height:0,thickness: 2,endIndent: 50,indent: 25,),
                SizedBox(height: 5,),

                buildNavCard('asset/logoff.png','Logout',8),
                SizedBox(height: 5,),


              ],
            ),
          ),

        ),

      ),
    );
  }


  buildNavCard(String image,String name,index) {

    return InkWell(
      onTap: (){
        if(index == 8){

          name == "Logout" ?
          AuthController.instance.logout()
              : print('');
          Get.back();
          Get.defaultDialog(title: '',content: Column(
            children: [
              Container(
                  height: 50,
                  width: 50,
                  child: ClipRRect(child: Image.asset('asset/exclamatorybx.png',fit: BoxFit.cover,))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap:(){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          child: Center(child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text('Deny',style: TextStyle(color: Kdblue),),
                          )),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Kdblue,width: 3)
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          child: Center(child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text('Accept',style: TextStyle(color: Colors.white),),
                          )),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Kdblue,
                              bluess
                            ]),
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Kdblue,width: 3)
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ));

        }else{
          setState(() {
            selectedCard = name;
            selectedindex = index;
          });
          Get.back();
        }

      },
      child: Card(
        color: selectedCard == name ?  Colors.white : bgGrey,
        elevation: selectedCard == name ? 2 : 0,
        child: Container(
          height: 70,
          child: Padding(

            padding: const EdgeInsets.only(left: 15.0,top: 10,bottom: 10,right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Image.asset(image,color: Kdblue,width: 20,height: 20,),

                SizedBox(width: 10,),

                Text(name,style: TextStyle(color: Colors.grey,fontSize: 16),),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
