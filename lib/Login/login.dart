import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              color: Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                        Image.asset('asset/logo.png'),
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
                    SizedBox(height: 10,),
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

                    Container(
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
                    SizedBox(height: 10,),

                    Align(
                      alignment: Alignment.centerLeft,
                        child: Text('Don\'t have an account?',style: TextStyle(color: Colors.yellow.shade700),)),
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
      ),
    );
  }
}
