import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/HRMS_admin_Screen/addemployee.dart';

import '../constants/constants.dart';

class AllEmployeePage extends StatefulWidget {
  const AllEmployeePage({Key? key}) : super(key: key);

  @override
  _AllEmployeePageState createState() => _AllEmployeePageState();
}

class _AllEmployeePageState extends State<AllEmployeePage> {
  var selectedValue = 0;



  @override
  Widget build(BuildContext context) {

    List<TableRow> tableRow = [
       TableRow(
        children: [
          Container(
            height: 30,
            child: Center(child: Text(' ')),
          ),
          Container(
            height: 30,
            child: Center(
              child: Text(
                'Name',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: Text(
                'Role',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: AutoSizeText(
                'Department',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: AutoSizeText(
                ' ',
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
            child: CircleAvatar(
              child: Image.asset(
                'asset/livephoto.png'
              ),
            ),
          ),
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
          Container(
            height: 60,
            child: Center(
              child: ElevatedButton(
                onPressed: (){

                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Kdblue)
                ),
                child: Text(
                  'EDIT',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          Container(
            height: 60,
            child: CircleAvatar(
              child: Image.asset(
                  'asset/livephoto.png'
              ),
            ),
          ),
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
          Container(
            height: 60,
            child: Center(
              child: ElevatedButton(
                onPressed: (){

                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Kdblue)
                ),
                child: Text(
                  'EDIT',
                  style: TextStyle(fontSize: 12),
                ),
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
                  'All Employees',
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
                      padding:   EdgeInsets.symmetric(horizontal: 8.0),
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

                          DropdownMenuItem(child: Text('By brancha'),value: 0,),
                        DropdownMenuItem(child: Text('By branchb'),value: 1,),
                        DropdownMenuItem(child: Text('By branchc'),value: 2,)

                      ],
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  InkWell(
                      onTap: () {

                        Get.to(AddEmployee());

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
