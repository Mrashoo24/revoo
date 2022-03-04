import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class Addnwprdct extends StatefulWidget {
  const Addnwprdct({Key? key}) : super(key: key);

  @override
  _AddnwprdctState createState() => _AddnwprdctState();
}

class _AddnwprdctState extends State<Addnwprdct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,

          child: SingleChildScrollView(
            child: Padding(
              padding:   EdgeInsets.all(20.0),
              child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (){

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
                  SizedBox(height: 25),
                  Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Add New Product',style: TextStyle(fontSize: 30,color: kblue),)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 175,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Kdblue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Text('Purchased :',style: TextStyle(color: Colors.white,fontSize: 15),),
                              SizedBox(width: 10,),
                              Container(
                                width: 65,
                                height: 22,
                                decoration: BoxDecoration(color: bgGrey),
                                child: Center(child: Text("24",style: TextStyle(color: kyellow,fontSize:15),)),
                              ),

                            ],
                          ),
                        ),

                      ),SizedBox(width: 19,),
                      Container(
                        width: 160,
                        height: 36,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(border: Border.all(
                            color: Kdblue,width: 2
                        )),
                        child: Padding(
                          padding:   EdgeInsets.only(left: 32),
                          child: Row(
                            children: [
                              Text('Print Label',style: TextStyle(fontSize: 17,color: kblue),),
                              SizedBox(width: 10,),
                              Image.asset('asset/dropdwn.png'),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,


                        ),
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color:  Colors.grey,
                        ),


                      ),SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text('Product name',style: TextStyle(fontSize: 16,color:kblue ),),
                          Divider(
                            height: 5,thickness: 15,
                          ),
                          Container(
                            height: 40,
                            width: 190,

                            child: TextFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: bgGrey,

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
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Upload a profile picture',style: TextStyle(color: kblue),),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Column(
                      children: [

                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Product type',style: TextStyle(fontSize: 18,color:kblue ),)),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 37,

                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                          child: TextFormField(
                            decoration: InputDecoration(

                                filled: true,
                                fillColor: bgGrey,

                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder:OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                )

                            ),
                          ),
                        ),


                        SizedBox(height: 30),



                        Container(
                          height: 110,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    Text('Price sale',style: TextStyle(fontSize: 18,color:kblue ),),
                                    Divider(
                                      height: 5,thickness: 1,color: kblue,
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      height: 40,

                                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),


                                      child: TextFormField(
                                        decoration: InputDecoration(

                                            filled: true,
                                            fillColor: bgGrey,

                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            ),
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            )

                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                              Flexible(
                                child: Column(
                                  children: [
                                    Text('Cost price',style: TextStyle(fontSize: 18,color:kblue ),),
                                    Divider(
                                      height: 5,thickness: 1,color: kblue,
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),


                                      child: TextFormField(
                                        decoration: InputDecoration(

                                            filled: true,
                                            fillColor: bgGrey,

                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            ),
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            )

                                        ),
                                      ),
                                    ),




                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Align(
                            alignment: Alignment.centerLeft,
                            child
                            : Text('Tags',style: TextStyle(fontSize: 18,color:kblue ),)),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),
                        Container(
                          height: 42,
                          width: 400,

                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: bgGrey,

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
                        ),

                        Align(alignment: Alignment.centerLeft,
                            child: Text('Product category',style: TextStyle(fontSize: 18,color:kblue ),)),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),


                           Align(
                             alignment: Alignment.centerLeft,
                             child: Container(
                              height: 42,
                              width: 400,

                              child: TextFormField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: bgGrey,
                                    hintText:"Product category heading " ,

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
                          )

                           ),

                        Container(
                          height: 42,
                          width: 400,

                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: bgGrey,

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
                        ),




                      ],
                    ),
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
                  padding:  EdgeInsets.only(bottom: 20.0),
                  child: Image.asset('asset/bnbAdd.png'),
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}
