import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:revoo/Employee/employeedash202.dart';

import 'package:revoo/First/welcomscreen.dart';
import 'package:revoo/Login/login.dart';
import 'package:revoo/WelcomeScreens/SplashScreen.dart';
import 'package:revoo/home/admindashboard.dart';
import 'package:revoo/home/homepage.dart';
import 'package:revoo/piechart.dart';

import 'Employee/employeedash1stpg.dart';
import 'Employee/employee_homepage.dart';

import 'Employee/watchdashboard.dart';
import 'HRMS_admin_Screen/adbranchpg2.dart';
import 'HRMS_admin_Screen/adbranchpg1.dart';
import 'HRMS_admin_Screen/adbranchpg3.dart';
import 'HRMS_admin_Screen/adbranchpg4.dart';

import 'HRMS_admin_Screen/hrmsHome.dart';
import 'Pos/calc.dart';

import 'Pos/cashinouta.dart';
import 'Pos/cashinoutb.dart';
import 'Pos/cashinoutc.dart';
import 'Pos/yoursessionsa.dart';
import 'Pos/yoursessionsb.dart';
import 'Project_Management/Messages/chattingScreen.dart';
import 'Project_Management/Messages/mssages.dart';
import 'Project_Management/ModuleSprintScreen/modulesSprintsPage.dart';
import 'Project_Management/Tasks/TasksScreen.dart';
import 'Project_Management/Teams/ProjectsTeamList.dart';
import 'Project_Management/projectDashboard.dart';
import 'Purchasing/addcategory.dart';
import 'Purchasing/addnewvendora.dart';
import 'Purchasing/addnewvendorb.dart';
import 'Purchasing/addnwprdct.dart';
import 'Login/signup.dart';
import 'Login/yourapps.dart';
import 'Employee/dailyupdates.dart';
import 'Purchasing/billsninvoice.dart';
import 'Purchasing/calendarss.dart';
import 'Purchasing/categories.dart';
import 'Purchasing/createRQF.dart';
import 'Purchasing/historyvndrname.dart';
import 'Purchasing/invoice.dart';
import 'Purchasing/logout homepage.dart';
import 'Purchasing/reports.dart';
import 'Purchasing/request4quotation.dart';
import 'Purchasing/rfqstatusa.dart';
import 'Purchasing/products.dart';
import 'Purchasing/rfqstatusb.dart';
import 'Purchasing/timepass.dart';
import 'Purchasing/vendors.dart';




void main() {
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
      home: Cashinoutc(),
      debugShowCheckedModeBanner: false,
    );
  }
}
