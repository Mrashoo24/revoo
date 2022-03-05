import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:revoo/Login/login.dart';
import 'package:revoo/profile/userProfileTeams.dart';
import 'package:revoo/profile/userProjectsProfile.dart';
import 'package:revoo/projectDashboard.dart';

import 'Messages/chattingScreen.dart';
import 'Messages/mssages.dart';
import 'ModuleSprintScreen/modulesSprintsPage.dart';
import 'Tasks/TasksScreen.dart';
import 'Teams/ProjectsTeamList.dart';
import 'Widgets/popupsPM.dart';
import 'Widgets/projectNameinprofile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      //home: LoginScreen(),
     //home: userProjectProfile(),
      //home: UserProfileTeams(),
      //home: ProjectHomePage(key: scafkey),
      //home: ProjectTeamsList(),
      //home: ModulesSprintsPage(),
      //home: Messages(),
     // home: chattingPage(),
      //home: allTasks(),
      home: ProjectHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
