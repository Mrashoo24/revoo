import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/Login/signup.dart';
import 'package:revoo/home/admindashboard.dart';


 
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key= const Key('LoginScreen')}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    print(Get.height);
    return SafeArea(

      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                      top:-180,
left:  Get.height < 800 ?-120 :Get.height < 1000 ? -120 : -120 ,

                      child: ClipRect(
                        child: Image.asset('asset/bigcircle.png', width: Get.height < 800 ?450 :Get.height < 1000 ? 500 : 400 ,),
                      )



                  ),
                  Positioned(
                      bottom: Get.height < 800 ?-73 :Get.height < 1000 ? 122 : 73,
                      right : Get.height < 800 ?-40 :Get.height < 1000 ? -20 : 40 ,

                      child: ClipRRect(child: Image.asset('asset/smallcircle.png', width: Get.height > 600 ?200 :Get.height > 800 ? 300 : 400 ,),)



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
                                height: 17,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
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
                              ),
                              SizedBox(height: 30,),
                              TextFormField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
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
                                    ),
                                  suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.yellow.shade700,)


                                ),
                              ),
                              SizedBox(height: 20,),

                              InkWell(
                                onTap: (){
                                  Get.to(AdminDashboard());
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('SIGN IN',style: TextStyle(
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
                                        Get.to(Signup());
                                      },
                                      child: Text('Don\'t have an account?',style: TextStyle(color: Colors.yellow.shade700),))),
                              SizedBox(height: 10,),

                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text('Forgot Password?',style: TextStyle(color: Colors.yellow.shade700),),
                                  )),
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
        ),
      ),
    );
  }
}
