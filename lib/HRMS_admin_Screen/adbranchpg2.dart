import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constants.dart';

class DBcrud2 extends StatefulWidget {
  const DBcrud2({Key? key}) : super(key: key);

  @override
  _DBcrudState createState() => _DBcrudState();
}

class _DBcrudState extends State<DBcrud2> {

  var _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(

          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('asset/dpbrCRUD.png')),

          ),








          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
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
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Create Branch',style: TextStyle(color:kblue,fontSize: 30),),

                      Divider(
                        height: 10,
                        thickness: 4,color:Kdblue,endIndent: 90, indent: 90,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Your Name',

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

                      Align
                        (
                          alignment: Alignment.centerRight,
                          child: Text('*optional',style: TextStyle(color:Colors.grey,fontSize: 10),)),

                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Last Name',

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
                      ),                       SizedBox(height: 12,),

                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'E-mail',

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
                      ),                       SizedBox(height: 12,),

                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Password',

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
                      ),                       SizedBox(height: 12,),

                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Confirm Password',

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
                            ),
                        ),
                      ),

                      Align
                        (
                          alignment: Alignment.centerRight,
                          child: Text('*optional',style: TextStyle(color:Colors.grey,fontSize: 10),)),
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Company Name',

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
                      ),                       SizedBox(height: 12,),

                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Number of Employees',

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
                      ),                       SizedBox(height: 12,),

                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Country',

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
                      Align
                        (
                          alignment: Alignment.centerRight,
                          child: Text('*optional',style: TextStyle(color:Colors.grey,fontSize: 10),)),


                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: 'Language',

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

                     ],
                  ),                      Text('By clicking continue, you agree to the',style: TextStyle(color:kblue,fontSize: 12),),

                  Container(
                    child: RichText(
    text: TextSpan(
    text: ' Terms & Continue ',
    style: TextStyle(
    color: kyellow,
      fontSize: 12,
    ),children: [
      TextSpan(
        text: 'and',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      TextSpan(
        text: ' Privacy Policy ',
        style: TextStyle(
          color: kyellow,
          fontSize: 12,
        ),
      ),
      TextSpan(
        text: 'of Revoo',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
    ],
    ),
                    ),

                  ),

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
                        child: Center(
                          child: Text(
                            'Duplicate',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
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
}



