
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/Purchasing/addnewvendora.dart';

import '../constants/constants.dart';

class Vendorsa extends StatefulWidget {
  const Vendorsa({Key? key}) : super(key: key);

  @override
  _HRMSadmincustState createState() => _HRMSadmincustState();
}

class _HRMSadmincustState extends State<Vendorsa> {
  String initialValue = '';

  var itemList = [
    '',
    'Std1',
    'Std2',
    'Std3',
    'Std4',
    'Std5',
    'Std6',
    'Std7'
  ];


  RelativeRect buttonMenuPosition(BuildContext context1) {
    final RenderBox bar = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
    Overlay.of(context)?.context.findRenderObject() as RenderBox;
    const Offset offset = Offset(20, 20);
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(bar.size.center(offset), ancestor: overlay),
        bar.localToGlobal(bar.size.centerRight(offset), ancestor: overlay),
      ),
      offset & overlay.size,
    );
    return position;
  }



  @override
  Widget build(BuildContext context) {




    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,

          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child:  Column(
                children: [

                  SizedBox(height: 30),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Vendors',style: TextStyle(color:kblue,fontSize: 30),
                            ),

                          ),
                          InkWell(onTap: (){

                            Get.to(Addnewvendora());
                          },child: Image.asset('asset/addnew.png')),

                        ],
                      ),

                      SizedBox( height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'asset/filterimg.png',height: 20,width: 15,

                          ),


                          SizedBox( width : 5),
                          Text("Filter Result by :",style: TextStyle(color:kblue,fontSize: 20,

                          )
                          ),
                          Container(
                            width:110 ,
                            height:25,
                            decoration: BoxDecoration(
                                color:  bgGrey,
                                borderRadius: BorderRadius.circular(10)

                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [

                                  SizedBox( width: 40),
                                  DropdownButton(

                                    icon: Icon(Icons.keyboard_arrow_down,color: Kdblue,),

                                    items: itemList.map((String items) {

                                      return DropdownMenuItem(value: items, child: Text(items));

                                    }).toList(), onChanged: (String? value) {  },
                                  ),


                                ],
                              ),
                            ),



                          ),

                        ],

                      ),

                      SizedBox( height: 20),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return

                            Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(

                                padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(

                                color: Kdblue,


                                borderRadius: BorderRadius.circular(15),

                              ),
                              child:
                              buildListTile(
                                  buttonMenuPosition, context,
                                  title: 'Vendor Name 1',
                                  tagcolor: kyellow),

                            ),
                          );
                        }
                      ),




                    ],
                  ),

                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
  ListTile buildListTile(RelativeRect buttonMenuPosition(BuildContext context),
      BuildContext context,
      {required String title, required Color tagcolor}) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Container(
            width: Get.width * 0.31,
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: tagcolor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: AutoSizeText(
                      '1',
                      style: TextStyle(color: Colors.white, fontSize: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'RFQ',
                style: TextStyle(color: Colors.white, fontSize: 10),
              )
            ],
          ),

        ],
      ),
      subtitle: Text(
        'Sector 20 US',
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
      trailing: InkWell(
        child: Icon(Icons.more_vert, color: Colors.white),
        onTap: () {
          final RelativeRect position = buttonMenuPosition(context);

          showMenu(
            color: Kdblue,
            context: context,
            position: position,
            items: [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Text(
                      'Edit',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),

            ],
          );
        },
      ),
    );
  }

}

