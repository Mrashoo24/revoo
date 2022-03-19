import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/HRMS_admin_Screen/adbranchpg1.dart';

import '../constants/constants.dart';
import 'adbranchpg2.dart';

class DBcrud4 extends StatefulWidget {
  const DBcrud4({Key? key}) : super(key: key);

  @override
  _DBcrud3State createState() => _DBcrud3State();
}

class _DBcrud3State extends State<DBcrud4> {

  int groupvalue = 0;
  int yesvslue = 0;
  int novalue = 1;

  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];







  @override
  Widget build(BuildContext context) {

    RelativeRect buttonMenuPosition(BuildContext context) {

      final RenderBox bar = context.findRenderObject() as RenderBox;
      final RenderBox overlay =
      Overlay.of(context)?.context.findRenderObject() as RenderBox;
      const Offset offset = Offset.zero;
      final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(
          bar.localToGlobal(bar.size.centerRight(offset),
              ancestor: overlay),
          bar.localToGlobal(
              bar.size.centerRight(offset)
              ,
              ancestor: overlay),
        ),
        offset & overlay.size,
      );
      return position;
    }
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('asset/dpbrCRUD.png')),

          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (){
                            print('clicked');
                          },
                          child: Image.asset('asset/navicon.png',)),
                      Row(
                        children: [
                          SizedBox(width: 110),
                          Image.asset('asset/bellicon.png'),
                          SizedBox(width: 20),
                          Image.asset('asset/settingsicon.png'),
                          SizedBox(width: 20),
                          Image.asset('asset/usericon.png'),
                        ],
                      ),


                    ],
                  ),
                  SizedBox(height: 30),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Create Branch',style: TextStyle(color:kblue,fontSize: 25),
                            ),

                          ),
                          InkWell(onTap: (){
                            Get.to(DBcrud2());
                          },child: Image.asset('asset/addnew.png')),

                        ],
                      ),
                      SizedBox( height: 25),

                      Container(
                        width: 400,
                        height: 500,
                        decoration: BoxDecoration(

                          color: bgGrey,

                          borderRadius: BorderRadius.circular(40),

                        ),
                        child: Align(
                          alignment: Alignment.topLeft,

                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 180,top:30,bottom: 10),
                                child: Text(
                                  'Branchs(s)',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,

                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 400,

                                  decoration: BoxDecoration(

                                    gradient: LinearGradient(
                                      colors: [
                                        kblue,
                                        Kdblue,
                                      ],


                                    ),

                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45)),

                                  ),
                                  child: Column(
                                    children: [
                                      buildListTile(buttonMenuPosition, context,title: 'Branch Name 1',tagcolor: kyellow),
                                      Divider(
                                        height: 10,
                                        thickness: 4,color:Kdblue,endIndent: 10, indent: 10,
                                      ),
                                      SizedBox(height: 10),
                                      buildListTile(buttonMenuPosition, context,title: 'Branch Name 2',tagcolor: kyellow),

                                      Divider(
                                        height: 30,
                                        thickness: 4,color:Kdblue,endIndent: 10, indent: 10,
                                      ),SizedBox(height: 10),
                                      buildListTile(buttonMenuPosition, context,title: 'Branch Name 3',tagcolor: bluess),

                                      Divider(
                                        height: 10,
                                        thickness: 4,color:Kdblue,endIndent: 10, indent: 10,
                                      ),SizedBox(height:30),
                                      buildListTile(buttonMenuPosition, context,title: 'Branch Name 4',tagcolor: bluess),

                                      Divider(
                                        height: 10,
                                        thickness: 4,color:Kdblue,endIndent: 10, indent: 10,
                                      ),SizedBox(height:20),

                                      buildListTile(buttonMenuPosition, context,title: 'Branch Name 4',tagcolor: bluess),


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

                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(

          height: 100,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(

                  child: Stack(
                    children: [
                      Align(

                        child: Container(
                          height: Get.height*0.08,
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                            color: Kdblue,

                          ),
                          child: Align(
                            alignment: Alignment.center,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ClipRect(child: Image.asset('asset/share.png')),
                                ClipRect(child: Image.asset('asset/homedash.png')),
                                Opacity(
                                    opacity: 0.01,
                                    child: ClipRect(child: Image.asset('asset/share.png'))
                                ),
                                ClipRect(child: Image.asset('asset/groupdash.png')),
                                ClipRect(child: Image.asset('asset/pathdash.png')),

                              ],
                            ),
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),

                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset('asset/bnbAdd.png'),
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }

  ListTile buildListTile(RelativeRect buttonMenuPosition(BuildContext context), BuildContext context,{required String title,required Color tagcolor}) {
    return ListTile(
                                      title: Row(
                                        children: [
                                          Container(
                                            width: Get.width*0.31,
                                              child: Text(title,style: TextStyle(color: Colors.white),),


                                          ),
                                          SizedBox(width: 40),
                                          CircleAvatar(
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(

                                                color: tagcolor,

                                                borderRadius: BorderRadius.circular(40),

                                              ),
                                            child: Center(child: AutoSizeText('1',style: TextStyle(color: Colors.white,fontSize: 2),),),
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          Text('Employees',style: TextStyle(color: Colors.white,fontSize: 10),)
                                        ],
                                      ),
                                      trailing : InkWell(child: Icon(Icons.more_vert,color: Colors.white),
                                      onTap: (){

                                        final RelativeRect position =
                                        buttonMenuPosition(context);


                                        showMenu(
                                          color: Kdblue,
                                          context: context, position: position, items: [


                                          PopupMenuItem<int>(
                                            value: 0,
                                            child: Row(
                                                children: [
                                              Text('Action',style: TextStyle(fontSize: 25,color: Colors.white),),
                                                  Icon(Icons.more_vert,color: Colors.white),
                                              ],
                                            ),
                                        ),
                                          PopupMenuItem<int>(
                                            value: 0,
                                            child:Divider(
                                              height: 33,
                                              thickness: 2,color:Colors.white,endIndent: 10, indent: 10,
                                            ),
                                          ),
                                          PopupMenuItem<int>(
                                            value: 0,
                                            child: Row(
                                              children: [
                                                Image.asset('asset/actiona.png'),
                                                SizedBox(width: 10),
                                                InkWell(
                                                  onTap: (){
                                                    print('clickedf');


                                                     showDialog(context: context, builder: (context){
                                                       return    StatefulBuilder(
                                                       builder: (context, setState1) {
                                                       return AlertDialog(
                                                         contentPadding : EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                                         shape: RoundedRectangleBorder(
                                                           borderRadius: BorderRadius.circular(50)
                                                         ),
                                                         content: SingleChildScrollView(
                                                           child: Column(
                                                             children: [
                                                               Container(
                                                               width: 400,
                                                               height: 400,
                                                               decoration: BoxDecoration(
                                                               border: Border.all(
                                                               width: 2,
                                                               color: kblue
                                                               ),
                                                               borderRadius: BorderRadius.circular(50)


                                                               ),
                                                               child:Padding(
                                                               padding:  EdgeInsets.only(top: 8.0),
                                                               child: Column(

                                                               children: [

                                                               Align(
                                                               alignment: Alignment(1.0, 10.0)    ,


                                                               child: InkWell(
                                                                 onTap: (){
                                                                   Get.back();
                                                                 },
                                                                 child: Padding(
                                                                   padding: const EdgeInsets.all(10.0),
                                                                   child: CircleAvatar(
                                                                   child: Icon(Icons.close,),
                                                                   backgroundColor: Kdblue,radius: 12,
                                                                   ),
                                                                 ),
                                                               ),

                                                               ),
                                                               Text('Duplicate Branch',style: TextStyle(fontSize: 30,color: kblue),

                                                               ),SizedBox(height:10),
                                                               Container(
                                                                 width: 200,height: 50,
                                                                 child: TextFormField(

                                                                 decoration: InputDecoration(
                                                                 filled: true,
                                                                 fillColor: bgGrey,
                                                                 contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                                                                 hintText: 'Choose a Name',

                                                                 hintStyle: TextStyle(
                                                                 color: Colors.grey
                                                                 ),
                                                                 border: OutlineInputBorder(
                                                                 borderSide: BorderSide(color: Colors.white)
                                                                 ),
                                                                 focusedBorder: OutlineInputBorder(

                                                                 borderSide: BorderSide(color: Colors.white)
                                                                 ),
                                                                 enabledBorder:OutlineInputBorder(
                                                                 borderSide: BorderSide(color: Colors.white)
                                                                 )
                                                                 ),

                                                                 ),
                                                               ),SizedBox(height: 20),
                                                                 Text('Copy all attributes',style: TextStyle(fontSize: 28,color: Colors.grey),),
                                                               ButtonBar(
                                                               alignment: MainAxisAlignment.center,
                                                               children: [
                                                               Row(
                                                               children: [
                                                               Radio(
                                                               value: yesvslue,
                                                               groupValue: groupvalue,
                                                               onChanged: (int? value) {
                                                               setState(() {
                                                               groupvalue = value!;
                                                               });
                                                               setState1(() {

                                                               });
                                                               },
                                                               ),Text('Yes',style: TextStyle(fontSize: 15,color: Colors.grey),),
                                                               Radio(
                                                               value: novalue,
                                                               groupValue: groupvalue,
                                                               onChanged: (int? value) {
                                                               setState(() {
                                                               groupvalue = value!;
                                                               });
                                                               setState1(() {

                                                               });
                                                               },
                                                               ),Text('No',style: TextStyle(fontSize: 15,color: Colors.grey),),

                                                               ],
                                                               ),
                                                               ],
                                                               ),
                                                               SizedBox(height: 25),
                                                               Row(
                                                               mainAxisSize: MainAxisSize.min,
                                                               children: [
                                                               ElevatedButton(onPressed: (){
                                                                    Get.back();
                                                               },

                                                               style: ElevatedButton.styleFrom(
                                                               elevation: 0,
                                                               shape:RoundedRectangleBorder(
                                                               borderRadius: BorderRadius.all(Radius.circular(10))
                                                               ),
                                                               side: BorderSide(width: 3.0, color: kblue ),
                                                               primary: Colors.white,
                                                               padding: EdgeInsets.symmetric(horizontal: 32, vertical: 11),
                                                               textStyle: TextStyle(
                                                               fontSize: 30,
                                                               fontWeight: FontWeight.bold)),
                                                               child: Center(child: Text('< Back',style: TextStyle(
                                                               color: kblue,fontSize: 15
                                                               ),))),
                                                               SizedBox(width: 25,),
                                                               InkWell(
                                                                 onTap: (){
                                                                   Get.to(DBcrud4());
                                                                 },
                                                                 child: Container(
                                                                 width: 110,
                                                                 height: 41,
                                                                 decoration: BoxDecoration(
                                                                 gradient: LinearGradient(
                                                                 colors: [
                                                                 Colors.blue.shade900,
                                                                 Colors.blue,
                                                                 ],
                                                                 begin: Alignment.topLeft,
                                                                 end: Alignment.bottomRight,
                                                                 ),
                                                                 borderRadius: BorderRadius.circular(10),


                                                                 ),
                                                                 child: Padding(
                                                                 padding: const EdgeInsets.all(8.0),
                                                                 child: Center(
                                                                 child: Text('Duplicate',style: TextStyle(
                                                                 color: Colors.white,fontSize: 15
                                                                 ),),
                                                                 ),
                                                                 ),

                                                                 ),
                                                               ),
                                                               ],
                                                               ),



                                                               ],
                                                               ),

                                                               ),

                                                               ),
                                                             ],
                                                           ),
                                                         ),
                                                       );
                                                       }
                                                       );
                                                     });
                                                  },
                                                  child: Text('Duplicate',style: TextStyle(fontSize: 20,color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),

                                          ), PopupMenuItem<int>(
                                            value: 1,
                                            child: Row(
                                              children: [
                                                Image.asset('asset/actionb.png'),
                                                SizedBox(width: 10),
                                                InkWell(
                                                  onTap: (){
                                                    print('clickedf');


                                                    showDialog(context: context, builder: (context){
                                                    return    StatefulBuilder(
                                                    builder: (context, setState1) {
                                                    return AlertDialog(
                                                    contentPadding : EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                                    shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50)
                                                    ),
                                                    content: SingleChildScrollView(
                                                    child:Column(
                                                                children: [
                                                                  Container(
                                                                  width: 400,
                                                                  height: 400,
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width: 2,
                                                                        color: kblue
                                                                    ),
                                                                      borderRadius: BorderRadius.circular(50)
                                                                  ),
                                                                  child:Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Column(

                                                                      children: [

                                                                        Align(
                                                                          alignment: Alignment.topRight,


                                                                          child: CircleAvatar(
                                                                            child: Icon(Icons.close),
                                                                            backgroundColor: Kdblue,
                                                                          ),

                                                                        ),
                                                                        Text('Rename Branch Name',style: TextStyle(fontSize: 30,color: kblue),

                                                                        ),SizedBox(height:10),
                                                                        TextFormField(
                                                                          decoration: InputDecoration(
                                                                              filled: true,
                                                                              fillColor: bgGrey,
                                                                              contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                                                                              hintText: 'Choose a Name',

                                                                              hintStyle: TextStyle(
                                                                                  color: Colors.grey
                                                                              ),
                                                                              border: OutlineInputBorder(
                                                                                  borderSide: BorderSide(color: Colors.white)
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(color: Colors.white)
                                                                              ),
                                                                              enabledBorder:OutlineInputBorder(
                                                                                  borderSide: BorderSide(color: Colors.white)
                                                                              )
                                                                          ),

                                                                        ),

                                                                        SizedBox(height: 100),
                                                                        Row(
                                                                          mainAxisSize: MainAxisSize.min,
                                                                          children: [
                                                                            ElevatedButton(onPressed: (){

                                                                            },

                                                                                style: ElevatedButton.styleFrom(
                                                                                    elevation: 0,
                                                                                    shape:RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                                                                    ),
                                                                                    side: BorderSide(width: 3.0, color: kblue ),
                                                                                    primary: Colors.white,
                                                                                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 11),
                                                                                    textStyle: TextStyle(
                                                                                        fontSize: 30,
                                                                                        fontWeight: FontWeight.bold)),
                                                                                child: Center(child: Text('< Back',style: TextStyle(
                                                                                    color: kblue,fontSize: 15
                                                                                ),))),
                                                                            SizedBox(width: 25,),
                                                                            Container(
                                                                              width: 110,
                                                                              height: 41,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Colors.blue.shade900,
                                                                                    Colors.blue,
                                                                                  ],
                                                                                  begin: Alignment.topLeft,
                                                                                  end: Alignment.bottomRight,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(10),


                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Center(
                                                                                  child: Text('Duplicate',style: TextStyle(
                                                                                      color: Colors.white,fontSize: 15
                                                                                  ),),
                                                                                ),
                                                                              ),

                                                                            ),
                                                                          ],
                                                                        ),



                                                                      ],
                                                                    ),

                                                                  ),


                                                                  ),
                                                                ],
                                                    ),
                                                    ),
                                                    );
                                                    }
                                                    );
                                                    });
                                                  },
                                                  child: Text('Rename',style: TextStyle(fontSize: 20,color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ),

                                          PopupMenuItem<int>(
                                            value: 2,
                                            child: Row(
                                              children: [
                                                Image.asset('asset/actionc.png'),
                                                SizedBox(width: 10),
                                                InkWell(
                                                  onTap: (){
                                                    print('clickedf');

                                                    showDialog(context: context, builder: (context){
                                                    return    StatefulBuilder(
                                                    builder: (context, setState1) {
                                                    return AlertDialog(
                                                    contentPadding : EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                                    shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50)
                                                    ),
                                                    content: SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: 400,
                                                            height: 400,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 2,
                                                                    color: kblue
                                                                ),
                                                                borderRadius: BorderRadius.circular(50)


                                                            ),
                                                            child:Padding(
                                                              padding:  EdgeInsets.only(top: 8.0),
                                                              child: Column(

                                                                children: [

                                                                  Align(
                                                                    alignment: Alignment(1.0, 10.0)    ,


                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(10.0),
                                                                      child: CircleAvatar(
                                                                        child: Icon(Icons.close,),
                                                                        backgroundColor: Kdblue,radius: 12,
                                                                      ),
                                                                    ),

                                                                  ),

                                                                  SizedBox(height:10),
                                                                  Container(
                                                                    width: 200,height: 50,

                                                                  ),
                                                                  SizedBox(height: 15),

                                                                  Image.asset('asset/dldim.png'),
                                                                  Text('Your download starts in...',style: TextStyle(fontSize: 22,color: Colors.grey),),
                                                                  Text('5s',style: TextStyle(fontSize: 22,color: kblue),),
                                                                  SizedBox(height: 10),
                                                                  Text('Cancel',style: TextStyle(fontSize: 22,color: kblue),),



                                                                  SizedBox(height: 25),
                                                                  Row(
                                                                    mainAxisSize: MainAxisSize.min,

                                                                  ),



                                                                ],
                                                              ),

                                                            ),

                                                          ),
                                                        ],
                                                      ),

                                                    ),
                                                    );

                                                    }
                                                    );
                                                    });
                                                  },
                                                  child: Text('Download',style: TextStyle(fontSize: 20,color: Colors.white),),
                                                )
                                              ],
                                            ),

                                          ),
                                          PopupMenuItem<int>(
                                            value: 3,
                                            child: Row(
                                              children: [
                                                Image.asset('asset/actiond.png'),
                                                SizedBox(width: 10),
                                                InkWell(
                                                  onTap: (){
                                                    print('clickedf');


                                                    Get.defaultDialog(
                                                      title: '',

                                                      content:   StatefulBuilder(
                                                          builder: (context, setState1) {
                                                            return Container(
                                                              width: 400,
                                                              height: 400,
                                                              decoration: BoxDecoration(

                                                                color: Colors.white,



                                                              ),
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Column(

                                                                  children: [

                                                                    Align(
                                                                      alignment: Alignment.topRight,


                                                                      child: CircleAvatar(
                                                                        child: Icon(Icons.close),
                                                                        backgroundColor: Kdblue,
                                                                      ),

                                                                    ),
                                                                    Text('Duplicate Branch',style: TextStyle(fontSize: 30,color: kblue),

                                                                    ),SizedBox(height:10),


                                                                    SizedBox(height: 25),
                                                                    Row(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      children: [
                                                                        Container(
                                                                          width: 230,
                                                                          height: 50,
                                                                          decoration: BoxDecoration(
                                                                            color: greytxtbx,
                                                                            borderRadius: BorderRadius.circular(0),


                                                                          ),
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(8.0),
                                                                            child: Center(
                                                                              child: Text('Duplicate',style: TextStyle(
                                                                                  color: Colors.white,fontSize: 15
                                                                              ),),
                                                                            ),
                                                                          ),

                                                                        ),
                                                                      ],
                                                                    ),



                                                                  ],
                                                                ),

                                                              ),

                                                            );
                                                          }
                                                      ),




                                                    );

                                                  },
                                                  child: Text('Add Domain',style: TextStyle(fontSize: 20,color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),

                                          ), PopupMenuItem<int>(
                                            value: 4,
                                            child: Row(
                                              children: [
                                                Image.asset('asset/actione.png'),
                                                SizedBox(width: 10),
                                                Text('Tags',style: TextStyle(fontSize: 20,color: Colors.white),
                                                )
                                              ],
                                            ),

                                          ), PopupMenuItem<int>(
                                            value: 5,
                                            child: Row(
                                              children: [
                                                Image.asset('asset/actionf.png'),
                                                SizedBox(width: 10),
                                                InkWell(
                                                  onTap: (){
                                                    print('clickedf');

                                                    showDialog(context: context, builder: (context){
                                                      return    StatefulBuilder(
                                                          builder: (context, setState1) {
                                                            return AlertDialog(
                                                              contentPadding : EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(50)
                                                              ),
                                                              content: SingleChildScrollView(
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      width: 400,
                                                                      height: 400,
                                                                      decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                              width: 2,
                                                                              color: kblue
                                                                          ),
                                                                          borderRadius: BorderRadius.circular(50)


                                                                      ),
                                                                      child:Padding(
                                                                        padding:  EdgeInsets.only(top: 8.0),
                                                                        child: Column(

                                                                          children: [

                                                                            Align(
                                                                              alignment: Alignment(1.0, 10.0)    ,


                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(10.0),
                                                                                child: CircleAvatar(
                                                                                  child: Icon(Icons.close,),
                                                                                  backgroundColor: Kdblue,radius: 12,
                                                                                ),
                                                                              ),

                                                                               ),

                                                                            SizedBox(height:5),
                                                                            Image.asset('asset/exclamatory.png'),
                                                                            Text('Deleting Branch',style: TextStyle(fontSize: 30,color: kblue),),
                                                                            Text('Lorem ipsum dolor sit amet',style: TextStyle(fontSize: 12,color: Colors.grey),),
                                                                            SizedBox(height:15),
                                                                            Text('Backup Branch?',style: TextStyle(fontSize: 22,color: kblue),),
                                                                            Text('       Click here to create\n a backup for your branch!',style: TextStyle(fontSize: 15,color: kyellow),),
                                                                            SizedBox(height: 10),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                ElevatedButton(onPressed: (){

                                                                                },

                                                                                    style: ElevatedButton.styleFrom(
                                                                                        elevation: 0,
                                                                                        shape:RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.all(Radius.circular(10))
                                                                                        ),
                                                                                        side: BorderSide(width: 3.0, color: kblue ),
                                                                                        primary: Colors.white,
                                                                                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 11),
                                                                                        textStyle: TextStyle(
                                                                                            fontSize: 30,
                                                                                            fontWeight: FontWeight.bold)),
                                                                                    child: Center(child: Text('< Back',style: TextStyle(
                                                                                        color: kblue,fontSize: 15
                                                                                    ),))),
                                                                                SizedBox(width: 25,),
                                                                                Container(
                                                                                  width: 110,
                                                                                  height: 41,
                                                                                  decoration: BoxDecoration(
                                                                                     color: reddy,
                                                                                    borderRadius: BorderRadius.circular(10),


                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Center(
                                                                                      child: Text('Duplicate',style: TextStyle(
                                                                                          color: Colors.white,fontSize: 15
                                                                                      ),),
                                                                                    ),
                                                                                  ),

                                                                                ),
                                                                              ],
                                                                            ),

                                                                          ],
                                                                        ),

                                                                      ),

                                                                    ),
                                                                  ],
                                                                ),

                                                              ),
                                                            );

                                                          }
                                                      );

                                                    });
                                                  },
                                                  child: Text('Delete',style: TextStyle(fontSize: 20,color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),

                                          ),PopupMenuItem<int>(
                                            value: 6,
                                            child:Divider(
                                              height: 10,
                                              thickness: 2,color:Colors.white,endIndent: 10, indent: 10,
                                            ),
                                          ),PopupMenuItem<int>(
                                            value: 7,
                                            child: InkWell(
                                              onTap: (){
                                                print('clickedf');


                                                showDialog(context: context, builder: (context){
                                                  return    StatefulBuilder(
                                                      builder: (context, setState1) {
                                                        return AlertDialog(
                                                          contentPadding : EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(50)
                                                          ),
                                                          content: SingleChildScrollView(
                                                            child:Column(
                                                              children: [
                                                                Container(
                                                                  width: 500,
                                                                  height: 500,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width: 2,
                                                                          color: kblue
                                                                      ),
                                                                      borderRadius: BorderRadius.circular(50)
                                                                  ),
                                                                  child:Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Center(
                                                                      child: Column(

                                                                        children: [

                                                                          Align(
                                                                            alignment: Alignment.topRight,


                                                                            child: CircleAvatar(
                                                                              child: Icon(Icons.close),
                                                                              backgroundColor: Kdblue,
                                                                            ),

                                                                          ),
                                                                          Text('Invite Users',style: TextStyle(fontSize: 30,color: kblue),

                                                                          ),SizedBox(height:10),
                                                                          TextFormField(
                                                                            decoration: InputDecoration(
                                                                                filled: true,
                                                                                fillColor: bgGrey,
                                                                                contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                                                                                hintText: 'Enter Name',

                                                                                hintStyle: TextStyle(
                                                                                    color: Colors.grey
                                                                                ),
                                                                                border: OutlineInputBorder(
                                                                                    borderSide: BorderSide(color: Colors.white)
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(color: Colors.white)
                                                                                ),
                                                                                enabledBorder:OutlineInputBorder(
                                                                                    borderSide: BorderSide(color: Colors.white)
                                                                                )
                                                                            ),

                                                                          ),
                                                                          TextFormField(
                                                                            decoration: InputDecoration(
                                                                                filled: true,
                                                                                fillColor: bgGrey,
                                                                                contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                                                                                hintText: 'Enter E-mail',

                                                                                hintStyle: TextStyle(
                                                                                    color: Colors.grey
                                                                                ),
                                                                                border: OutlineInputBorder(
                                                                                    borderSide: BorderSide(color: Colors.white)
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(color: Colors.white)
                                                                                ),
                                                                                enabledBorder:OutlineInputBorder(
                                                                                    borderSide: BorderSide(color: Colors.white)
                                                                                )
                                                                            ),

                                                                          ),
                                                                          TextFormField(
                                                                            decoration: InputDecoration(
                                                                                filled: true,
                                                                                fillColor: bgGrey,
                                                                                contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                                                                                hintText: 'Determine Role',

                                                                                hintStyle: TextStyle(
                                                                                    color: Colors.grey
                                                                                ),
                                                                                border: OutlineInputBorder(
                                                                                    borderSide: BorderSide(color: Colors.white)
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(color: Colors.white)
                                                                                ),
                                                                                enabledBorder:OutlineInputBorder(
                                                                                    borderSide: BorderSide(color: Colors.white)
                                                                                )
                                                                            ),

                                                                          ), DropdownButtonHideUnderline(
                                                                            child: DropdownButton(
                                                                              hint: Text(
                                                                                'Select Item',
                                                                                style: TextStyle(
                                                                                  fontSize: 14,
                                                                                  color: Theme
                                                                                      .of(context)
                                                                                      .hintColor,
                                                                                ),
                                                                              ),
                                                                              items: items
                                                                                  .map((item) =>
                                                                                  DropdownMenuItem<String>(
                                                                                    value: item,
                                                                                    child: Text(
                                                                                      item,
                                                                                      style: const TextStyle(
                                                                                        fontSize: 14,
                                                                                      ),
                                                                                    ),
                                                                                  ))
                                                                                  .toList(),
                                                                              value: selectedValue,
                                                                              onChanged: (value) {
                                                                                setState(() {
                                                                                  selectedValue = value as String;
                                                                                });
                                                                              },

                                                                            ),
                                                                          ),

                                                                          SizedBox(width: 50),
                                                                          Row(
                                                                            children: [
                                                                              Image.asset('asset/pluss.png'),
                                                                              Text('Add more users',style: TextStyle(fontSize: 15,color: kblue),),
                                                                            ],
                                                                          ),


                                                                          SizedBox(height: 20),
                                                                          Row(
                                                                            mainAxisSize: MainAxisSize.min,
                                                                            children: [
                                                                              ElevatedButton(onPressed: (){

                                                                              },

                                                                                  style: ElevatedButton.styleFrom(
                                                                                      elevation: 0,
                                                                                      shape:RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                                                                      ),
                                                                                      side: BorderSide(width: 3.0, color: kblue ),
                                                                                      primary: Colors.white,
                                                                                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 11),
                                                                                      textStyle: TextStyle(
                                                                                          fontSize: 30,
                                                                                          fontWeight: FontWeight.bold)),
                                                                                  child: Center(child: Text('< Back',style: TextStyle(
                                                                                      color: kblue,fontSize: 15
                                                                                  ),))),
                                                                              SizedBox(width: 25,),
                                                                              Container(
                                                                                width: 110,
                                                                                height: 41,
                                                                                decoration: BoxDecoration(
                                                                                  gradient: LinearGradient(
                                                                                    colors: [
                                                                                      Colors.blue.shade900,
                                                                                      Colors.blue,
                                                                                    ],
                                                                                    begin: Alignment.topLeft,
                                                                                    end: Alignment.bottomRight,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(10),


                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: Center(
                                                                                    child: Text('Duplicate',style: TextStyle(
                                                                                        color: Colors.white,fontSize: 15
                                                                                    ),),
                                                                                  ),
                                                                                ),

                                                                              ),
                                                                            ],
                                                                          ),



                                                                        ],
                                                                      ),
                                                                    ),

                                                                  ),


                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                  );
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset('asset/actionh.png'),
                                                  SizedBox(width: 10),
                                                  Text('Invite Users',style: TextStyle(fontSize: 20,color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),

                                          ), PopupMenuItem<int>(
                                            value: 8,
                                            child: Row(
                                              children: [
                                                Image.asset('asset/actionh.png'),
                                                SizedBox(width: 10),
                                                Text('Remove Users',style: TextStyle(fontSize: 20,color: Colors.white),
                                                )
                                              ],
                                            ),

                                          ),PopupMenuItem<int>(
                                            value: 9,
                                            child:Divider(
                                              height: 10,
                                              thickness: 2,color:Colors.white,endIndent: 10, indent: 10,
                                            ),
                                          ),PopupMenuItem<int>(
                                            value: 10,
                                            child: Row(
                                              children: [
                                                Image.asset('asset/actiong.png'),
                                                SizedBox(width: 10),
                                                Text('Contact Support',style: TextStyle(fontSize: 20,color: Colors.white),
                                                )
                                              ],
                                            ),

                                          ),

                                          PopupMenuItem<int>(
                                            value: 11,
                                            child:Container(
                                              width: 400,

                                              decoration: BoxDecoration(

                                                  color: kyellow,

                                                  borderRadius: BorderRadius.all( Radius.circular(10) )

                                              ),
                                              child: ListTile(

                                                title: Row(

                                                  children: [


                                                    SizedBox(width: 20,height: 50),
                                                    Text('Upgrade',style: TextStyle(fontSize: 30,color: Kdblue),

                                                    ),SizedBox(width: 15),

                                                    Image.asset('asset/actionj.png',color: Kdblue,),

                                                  ],

                                                ),

                                              ),
                                            ),
                                          ),
                                        ],
                                        );
                                      },
                                      ),
                                    );
  }
}
