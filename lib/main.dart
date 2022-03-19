import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:revoo/Employee/employeedash202.dart';

import 'package:revoo/First/welcomscreen.dart';
import 'package:revoo/Orders/ordersa.dart';

import 'package:revoo/Login/login.dart';
import 'package:revoo/WelcomeScreens/SplashScreen.dart';
import 'package:revoo/home/admindashboard.dart';
import 'package:revoo/home/homepage.dart';
import 'package:revoo/piechart.dart';
import 'package:revoo/pos/pos.dart';
import 'package:revoo/pos/pos.next.dart';
import 'package:revoo/testing.dart';

import 'Employee/employeedash1stpg.dart';
import 'Employee/employee_homepage.dart';

import 'Employee/watchdashboard.dart';
import 'Orders/addproductb.dart';
import 'Orders/ordersb.dart';
import 'Orders/customersa.dart';
import 'Orders/servicecallsa.dart';
import 'Orders/quotation.dart';
import 'Orders/productsa.dart';
import 'Orders/servicecallsb.dart';

import 'Orders/addcustomer56.dart';
import 'Orders/addcustomerb.dart';
import 'Orders/addcustomera.dart';
import 'Orders/addproducta.dart';

import 'Orders/createquatationa.dart';
 import 'HRMS_admin_Screen/practice.dart';
import 'Purchasing/addnwprdct29.dart';
import 'Login/signup.dart';
import 'Login/yourapps.dart';
import 'Employee/dailyupdates.dart';
import 'Vendorproduct mangment/Batchmangment51.dart';
import 'Vendorproduct mangment/batchmangment50.dart';
import 'Vendorproduct mangment/dialouge40.dart';
import 'Vendorproduct mangment/goodissue42.dart';
import 'Vendorproduct mangment/goodsissue43.dart';
import 'Vendorproduct mangment/inventory reports52.dart';
import 'Vendorproduct mangment/pos.62.dart';
import 'Vendorproduct mangment/practice.dart';


import 'Vendorproduct mangment/serialnumber48.dart';
import 'Vendorproduct mangment/tansfer47.dart';
import 'Vendorproduct mangment/transaction44.dart';
import 'Vendorproduct mangment/transfer45.dart';
import 'Vendorproduct mangment/transferadd46.dart';
import 'Vendorproduct mangment/vendoraddproduct39.dart';
import 'Vendorproduct mangment/vendorproduct38.dart';
import 'Vendorproduct mangment/vengoods41.dart';




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
      home:Addcustomer56(),
      debugShowCheckedModeBanner: false,
    );
  }
}
