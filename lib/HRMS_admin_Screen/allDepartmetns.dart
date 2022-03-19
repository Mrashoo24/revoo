import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/HRMS_admin_Screen/departments/adddepartment.dart';

import '../constants/constants.dart';
import 'adbranchpg2.dart';

class Departments extends StatefulWidget {
  const Departments({required Key key}) : super(key: key);

  @override
  _DepartmentsState createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {
  var selectedValue = 0;



  @override
  Widget build(BuildContext context) {

    List<TableRow> tableRow = [
      TableRow(
        children: [
          Container(
            height: 30,
            child: Center(
              child: Text(
                'Dept Name',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: Text(
                'Head',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: AutoSizeText(
                'No.Employee',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          Container(
            height: 60,

            child: Center(
              child: Text(
                'Arsalan',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: Text(
                'Software En.',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: AutoSizeText(
                'IT',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          Container(
            height: 60,

            child: Center(
              child: Text(
                'Arsalan',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: Text(
                'Software En.',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Center(
              child: AutoSizeText(
                'IT',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    ];

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Departments',
                  style: TextStyle(color: kblue, fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Image.asset('asset/filter.png'),
                  SizedBox(width: 10,),
                  Text(
                    'Filter by:',
                    style: TextStyle(color: kblue, fontSize: 14),
                  ),
                  SizedBox(width: 8,),
                  Container(
                    height: 30,
                    width: Get.width*0.33,
                    decoration: BoxDecoration(
                        color:bgGrey,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: DropdownButton(
                        underline: Text(''),

                        borderRadius: BorderRadius.circular(10),
                        value: selectedValue,
                        onChanged: (int? value){



                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        items: [

                          DropdownMenuItem(child: Text('By branch'),value: 0,),
                          DropdownMenuItem(child: Text('By branch'),value: 1,),
                          DropdownMenuItem(child: Text('By branch'),value: 2,)

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  InkWell(
                      onTap: () {

                        Get.to(AddDepartments());

                      },
                      child: Image.asset('asset/addnew.png')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: Get.width,
                height: 300,
                child: Table(
                  border: TableBorder.symmetric(inside:BorderSide(color: Kdblue),outside:BorderSide(color: Colors.white)),
                  children: tableRow,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
