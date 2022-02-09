import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {


  bool obsecure = true;
  bool obsecure1 = true;

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
                  bottom: 35,
                  right : -35,

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
                      padding: const EdgeInsets.only(right: 30.0,left: 30.0,top: 15,bottom: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Image.asset('asset/logo.png',width: 200,),
                          SizedBox(
                            height: 20,
                          ),

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
                          SizedBox(height: 20,),
                          TextFormField(
                            obscureText: obsecure,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                                hintText: 'Set Password',
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
                                suffixIcon: InkWell(
                                      onTap: (){
                                        setState(() {
                                          obsecure == true ? obsecure = false : obsecure = true;
                                        });
                                      },
                                    child:Icon(CupertinoIcons.eye_slash_fill,color: Colors.yellow.shade700,)
                                )


                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            obscureText: obsecure1,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                                suffixIcon: InkWell(
                                    onTap: (){
                                      setState(() {
                                        obsecure1 == true ? obsecure1 = false : obsecure1 = true;
                                      });
                                    },
                                    child: Icon(CupertinoIcons.eye_slash_fill,color: Colors.yellow.shade700,))


                            ),
                          ),
                          SizedBox(height: 20,),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text('SIGN UP',style: TextStyle(
                                  color: Colors.white,fontSize: 20
                              ),)),
                            ),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Colors.blueAccent,Colors.lightBlueAccent])
                            ),
                          ),

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
