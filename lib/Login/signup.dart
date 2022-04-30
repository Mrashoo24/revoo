import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/Controllers/authcontroller.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key key = const Key('Signup')}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  bool obsecure = true;
  bool obsecure1 = true;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          child: Stack(
            children: [
              Positioned(
                  top:-160,
                  left: -100,

                  child: Container(child: Image.asset('asset/bigcircle.png', width: 400,),)



              ),
              Positioned(
                  bottom: 165,
                  right : -15,

                  child: Container(child: Image.asset('asset/smallcircle.png', width: 200,),)



              ),


              Center(
                child: Padding(

                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    color: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0,left: 30.0,top: 25,bottom: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Image.asset('asset/logo.png',width: 200,),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                                hintText: 'Your Company Name',

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
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                                hintText: 'Your E-mail',
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
                          // SizedBox(height: 20,),
                          // TextFormField(
                          //   controller: passwordController,
                          //   obscureText: obsecure,
                          //   decoration: InputDecoration(
                          //       filled: true,
                          //       fillColor: Colors.white,
                          //       contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                          //       hintText: 'Set Password',
                          //       hintStyle: TextStyle(
                          //           color: Colors.grey
                          //       ),
                          //       border: OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.white)
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.white)
                          //       ),
                          //       enabledBorder:OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.white)
                          //       ),
                          //       suffixIcon: InkWell(
                          //             onTap: (){
                          //               setState(() {
                          //                 obsecure == true ? obsecure = false : obsecure = true;
                          //               });
                          //             },
                          //           child:Icon(CupertinoIcons.eye_slash_fill,color: Colors.yellow.shade700,)
                          //       )
                          //
                          //
                          //   ),
                          // ),
                          // SizedBox(height: 20,),
                          // TextFormField(
                          //   controller: passwordController,
                          //   obscureText: obsecure1,
                          //   decoration: InputDecoration(
                          //       filled: true,
                          //       fillColor: Colors.white,
                          //       contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                          //       hintText: 'Confirm Password',
                          //       hintStyle: TextStyle(
                          //           color: Colors.grey
                          //       ),
                          //       border: OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.white)
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.white)
                          //       ),
                          //       enabledBorder:OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.white)
                          //       ),
                          //       suffixIcon: InkWell(
                          //           onTap: (){
                          //             setState(() {
                          //               obsecure1 == true ? obsecure1 = false : obsecure1 = true;
                          //             });
                          //           },
                          //           child: Icon(CupertinoIcons.eye_slash_fill,color: Colors.yellow.shade700,))
                          //
                          //
                          //   ),
                          // ),
                          SizedBox(height: 20,),

                          GestureDetector(
                            onTap: (){
                              // AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());

                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('Submit',style: TextStyle(
                                    color: Colors.white,fontSize: 20
                                ),)),
                              ),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [Colors.blueAccent,Colors.lightBlueAccent])
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),

                          Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                  onTap: (){
                                    Get.to(LoginScreen());
                                  },
                                  child: Text('Already hav an account?',style: TextStyle(color: Colors.yellow.shade700),))),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );


  }
}
