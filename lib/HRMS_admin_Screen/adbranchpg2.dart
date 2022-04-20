import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/HRMS_admin_Screen/adbranchpg4.dart';

import '../constants/constants.dart';
import '../home/homepage.dart';

class AddBranches extends StatefulWidget {


  const AddBranches({Key? key,}) : super(key: key);

  @override
  _DBcrudState createState() => _DBcrudState();
}

class _DBcrudState extends State<AddBranches> {

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var firestore =  FirebaseFirestore.instance;




    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'Create Branch',
                style: TextStyle(color: kblue, fontSize: 30),
              ),
              Divider(
                height: 10,
                thickness: 4,
                color: Kdblue,
                endIndent: 90,
                indent: 90,
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Kdblue),
        ),
        body: Container(
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('asset/dpbrCRUD.png')),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(


                        controller: name,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 25, bottom: 25),
                            hintText: 'Branch Name',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '*optional',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          )),
                      TextFormField(
                        controller: address,

                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 25, bottom: 25),
                            hintText: 'Address',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: location,

                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding:
                            EdgeInsets.only(left: 20, top: 25, bottom: 25),
                            hintText: 'Location',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                  Text(
                    'By clicking continue, you agree to the',
                    style: TextStyle(color: kblue, fontSize: 12),
                  ),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        text: ' Terms & Continue ',
                        style: TextStyle(
                          color: kyellow,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: 'and',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: ' Privacy Policy ',
                            style: TextStyle(
                              color: kyellow,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: 'of Revoo',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              side: BorderSide(width: 3.0, color: kblue),
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 11),
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          child: Center(
                              child: Text(
                            '< Back',
                            style: TextStyle(color: kblue, fontSize: 15),
                          ))),
                      SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () async {
                        await firestore.collection('Company').doc('jdeN29JAU0tlAscbbdFx').collection('Branch').add(
                           {
                             'Branch Name':name.text,
                             'Address':address.text,
                             'Location' : location.text,
                           }
                         ).then(
                                (value) async {
                          await firestore.collection('Company').doc('jdeN29JAU0tlAscbbdFx').collection('Branch').doc(value.id).update
                            ({
                            'bid' : value.id
                          });
                        }
                        );
                     var docSnap =  await firestore.collection('Company').doc('jdeN29JAU0tlAscbbdFx').collection('Branch').doc('qOhsmhAMWFKFBcP6EtPx').get();
                     print(docSnap.data());
                          Get.to(HomePageMain());
                        },
                        child: Container(
                          width: 110,
                          height: 41,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade900,
                                Colors.blue,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
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
