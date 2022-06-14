import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Models/taskmodel.dart';
import '../../constants/constants.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  bool loading = false;
  TextEditingController tasktitle = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController assignedto = TextEditingController();
  TextEditingController projectname = TextEditingController();
  TextEditingController moduletype = TextEditingController();
  TextEditingController startdate = TextEditingController();
  TextEditingController enddate = TextEditingController();
 // TextEditingController status = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Add New Title',style: TextStyle(color: kblue,fontWeight: FontWeight.bold,fontSize: 20),),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width:80,
                          child: Text('Task Title',style: TextStyle(color: kblue),)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                          controller: tasktitle,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                              hintText: 'Enter task name',

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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width:80,
                          child: Text('Description ',style: TextStyle(color: kblue),)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                           controller: description,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                              hintText: 'Enter Discription',

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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width:80,
                          child: Text('Assign to ',style: TextStyle(color: kblue),)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                           controller: assignedto,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                              hintText: 'Assign To',

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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width:80,
                          child: Text('Projrct',style: TextStyle(color: kblue),)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                           controller: projectname,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                              hintText: 'Enter Project Name',

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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width:80,
                          child: Text('Module Type',style: TextStyle(color: kblue),)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                           controller: moduletype,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                              hintText: 'Enter Type',

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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width:80,
                          child: Text('Start Date',style: TextStyle(color: kblue),)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                           controller: startdate,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                              hintText: 'Enter Start Date',

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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width:80,
                          child: Text(' End date ',style: TextStyle(color: kblue),)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                           controller: enddate,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                              hintText: 'End Date ',

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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Kdblue)
                    ),
                    onPressed: () {
                      Get.back();
                    }, child: Text('Cancel'),
                  ),
                  SizedBox(width: 10,),

                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Kdblue),
                    ),
                    onPressed: (){
                      if(tasktitle.text.isEmpty||description.text.isEmpty||assignedto.text.isEmpty||projectname.text.isEmpty||moduletype.text.isEmpty||moduletype.text.isEmpty||startdate.text.isEmpty||enddate.text.isEmpty) {
                        print('not good');
                        Get.snackbar('Error', 'Please Enter All Details');
                      }else{
                        print('all good1');
                        setState((){
                          loading = true;
                        });
                        FirebaseFirestore.instance.collection('Addtask').add(
                          AddTaskOne(
                            assignto:assignedto.text,
                            description:description.text,
                            enddate:enddate.text,
                            moduletype:moduletype.text,
                            projectname:projectname.text,
                            startdate:startdate.text,
                            taskTitle:tasktitle.text,

                          ).toJson(),
                        );
                        Get.back();
                      }
                    }, child: Text('ADD'),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
