import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/Login/login.dart';
import 'package:revoo/constants/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key = const Key('Welcome')}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(
          body: Stack(
            children: [
              ClipRect(
                child: Image.asset('asset/bg.png',width: Get.width,scale:0.4,fit: BoxFit.fill,),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: Get.width*0.08,bottom: Get.height*0.1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            child: Text('Welcome to \nRevoo!',style: TextStyle(fontSize: 40,color: Colors.white),
                            )),
                      ),
                      Container(
                          child: Text('Its a revolutionary App made for you company',style: TextStyle(fontSize: 18,color: Colors.white),
                          )),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          Get.to(LoginScreen());
                        },
                        child: Row(
                          children: [
                            Container(
                                child: Text('Continue',style: TextStyle(fontSize: 25,color: kyellow),
                                )),
                            SizedBox(width: 20,),
                            Image.asset('asset/rightarrow.png')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding:  EdgeInsets.only(top: Get.height*0.1,right: Get.width*0.04),
                  child: Image.asset('asset/logo.png',width: 250,),
                ),
              )
            ],
          ),
        ),

    );
  }
}
