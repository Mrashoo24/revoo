import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../Models/projectaddmodel.dart';
import '../../constants/constants.dart';

class AddProject extends StatefulWidget {
  const AddProject({Key? key}) : super(key: key);

  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  bool loading = false;
  TextEditingController name = TextEditingController();
  TextEditingController teamname = TextEditingController();
  TextEditingController leadname = TextEditingController();
  TextEditingController deadline = TextEditingController();
  TextEditingController projecttype = TextEditingController();
  TextEditingController startdate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var firestore = FirebaseFirestore.instance;
    return Container(
      color: bgGrey,
      width: Get.width,

      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                    width:80,
                    child: Text('Name')),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      controller:name,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          hintText: 'Name of Project',

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
          SizedBox(height: 10,),
          Container(
            child: Row(
              children: [
                Container(
                    width:80,
                    child: Text('Project Type')),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      controller: projecttype,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          hintText: 'Enter Project type',

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
          SizedBox(height: 10,),
          Container(
            child: Row(
              children: [
                Container(
                    width:80,
                    child: Text('Team')),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      controller : teamname,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          hintText: 'Team Name',
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
          SizedBox(height: 10,),
          Container(
            child: Row(
              children: [
                Container(
                    width:80,
                    child: Text('Lead')),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      controller: leadname,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          hintText: 'Lead Name',

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
          SizedBox(height: 10,),
          Container(
            child: Row(
              children: [
                Container(
                    width:80,
                    child: Text('Start Date')),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      controller: startdate,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          hintText: 'Select start Date',

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
          SizedBox(height: 10,),
          Container(
            child: Row(
              children: [
                Container(
                    width:80,
                    child: Text('Deadline')),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      controller: deadline,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          hintText: 'Select Deadline',

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

          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Kdblue),
                  ),
                  onPressed: ()async{
    if(name.text.isEmpty||teamname.text.isEmpty||leadname.text.isEmpty||deadline.text.isEmpty||projecttype.text.isEmpty||startdate.text.isEmpty) {
    print('not good');
    Get.snackbar('Error', 'Please Enter All Details');
    }else{
      print('all good1');
      setState((){
        loading = true;
      });
      FirebaseFirestore.instance.collection('Create Project').add(
              ProjectModel(
                name:name.text,
        deadline:deadline.text,
                leadName:leadname.text,
                teamName:teamname.text,
                projecttype:projecttype.text,
                startdate:startdate.text,
      ).toJson(),
      );
      Get.back();
    }
    }, child: Text('ADD  ')
              ),
              SizedBox(width: 20,),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Kdblue)
                  ),
                  onPressed: () {
                    Get.back();
                  }, child: Text('Cancel')),
            ],
          ),
        ],
      ),

    );
  }
}
///