import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:revoo/Controllers/authcontroller.dart';
import 'package:revoo/Employee/employeedash202.dart';

import 'package:revoo/First/welcomscreen.dart';
import 'package:revoo/Login/login.dart';
import 'package:revoo/WelcomeScreens/SplashScreen.dart';
import 'package:revoo/home/admindashboard.dart';
import 'package:revoo/home/homepage.dart';
import 'package:revoo/graph/piechart.dart';

import 'Employee/employeedash1stpg.dart';
import 'Employee/employee_homepage.dart';

import 'Employee/watchdashboard.dart';
import 'HRMS_admin_Screen/adbranchpg2.dart';
import 'HRMS_admin_Screen/adbranchpg1.dart';
import 'HRMS_admin_Screen/adbranchpg3.dart';
import 'HRMS_admin_Screen/adbranchpg4.dart';

import 'HRMS_admin_Screen/employeecheckin.dart';
import 'Login/signup.dart';
import 'Login/yourapps.dart';
import 'Employee/dailyupdates.dart';
import 'Pos/testhomepagea.dart';
import 'graph/linegraph.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 kIsWeb ?  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: "AIzaSyBr-TjYkCaHCSvuRN0U6UajSeJTNrzYv64",
    authDomain: "revoo-57e23.firebaseapp.com",
    storageBucket: "revoo-57e23.appspot.com",
    projectId: "revoo-57e23",
    messagingSenderId: "702579453139",
    appId: "1:702579453139:web:082dbb521cac125eac3826",
  ),).then((value) => Get.put(AuthController()))  :
 await Firebase.initializeApp().then((value) => Get.put(AuthController()))

  ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {



  const MyApp({Key key= const Key('MyApp')}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

      ),


        debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: LoginScreen()

        // DateTimeComboLinePointChart.withSampleData(),
      )


    );
  }
}
