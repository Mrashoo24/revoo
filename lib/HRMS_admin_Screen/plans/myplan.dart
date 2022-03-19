import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class MyPlan extends StatefulWidget {
  const MyPlan({Key? key}) : super(key: key);

  @override
  _MyPlanState createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
        Text('Basic Plan',style: TextStyle(fontSize: 30,color: Colors.grey),),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date Bought'),
                Divider(thickness: 2,height: 10,color: Colors.black,),
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      enabled: false,
                      fillColor: bgGrey,
                      contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                      hintText: 'Jan 19, 2021',
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
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date Expire'),
                Divider(thickness: 2,height: 10,color: Colors.black,),
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      enabled: false,
                      fillColor: bgGrey,
                      contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                      hintText: 'Jul 08, 2022',
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
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Next Payment'),
                Divider(thickness: 2,height: 10,color: Colors.black,),
                TextFormField(
                  decoration: InputDecoration(
                    enabled: false,
                      filled: true,
                      fillColor: bgGrey,
                      contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                      hintText: 'March 19, 2022',
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

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Apps Included'),
                Divider(thickness: 2,height: 10,color: Colors.black,),
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      enabled: false,
                      fillColor: bgGrey,
                      contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                      hintText: '15',
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

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('No.of Employee'),
                Divider(thickness: 2,height: 10,color: Colors.black,),
                TextFormField(
                  decoration: InputDecoration(
                    enabled: false,
                      filled: true,
                      fillColor: bgGrey,
                      contentPadding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                      hintText: '150',
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

              ],
            ),
          )
        ],
      ),
    );
  }
}
