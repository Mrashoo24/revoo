import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:revoo/constants/constants.dart';
import '../Controllers/dailyUpdatesController.dart';
import '../home/homepage.dart';

class AllEmployeeUpdates extends StatefulWidget {
  const AllEmployeeUpdates({Key? key}) : super(key: key);

  @override
  _AllEmployeeUpdatesState createState() => _AllEmployeeUpdatesState();
}

class _AllEmployeeUpdatesState extends State<AllEmployeeUpdates> {
  DateTimeRange daterange = DateTimeRange(start: DateTime(1998,05,07), end: DateTime(2100,05,09));
  var selectedValue = 0;
  Future pickDate() async{
    DateTimeRange? newDateRange = await showDateRangePicker(context: context,initialDateRange: daterange, firstDate: DateTime(1900), lastDate: DateTime(2100));
    if(newDateRange == null) return;
    setState(() {
      daterange = newDateRange;
    });
    var ndate = await newDateRange.toString();
    print(ndate);
  }




  @override
  Widget build(BuildContext context) {

    final start = daterange.start;
    final end = daterange.end;
    var startd = "${(start.year).toString()}/${(start.month).toString()}/${(start.day).toString()}";
    var endd = "${(end.year).toString()}/${(end.month).toString()}/${(end.day).toString()}";

    FirebaseFirestore firebase = FirebaseFirestore.instance;

    var array1 = [
      {'name':'Arsalan','date':'2022/03/01'},
      {'name':'Sachin','date':'2022/04/02'}
    ];
   //
    var array2 = array1.where((element) => DateFormat('yyyy/MM/dd').parse(element['date']!).isAfter(DateFormat('yyyy/MM/dd').parse('2022/04/03')));
   //
    print('array2 ffffff = $array2');

    return Container(
      child: SingleChildScrollView(
          child: GetX(

            init: Get.put<UpdatesController >(UpdatesController()),

            builder: (UpdatesController updateController){

              if(updateController.dailyupdate.value.isEmpty){
                return Text("No data");
              }


              var newListofUpdates = updateController.dUpdate.where(

                      (element) {
                        print(element.date);

                    return DateFormat('yyyy/MM/dd')
                        .parse(element.date!)
                        .isAfter(DateFormat('yyyy/MM/dd').parse(startd)) && DateFormat('yyyy/MM/dd')
                        .parse(element.date!)
                        .isBefore(DateFormat('yyyy/MM/dd').parse(endd));
                  }).toList();

              print(newListofUpdates.length);
              // array1.where((element) => DateFormat('yyyy/MM/dd').parse(element['date']!).isAfter(DateFormat('yyyy/MM/dd').parse('2022/04/03')));

              return Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Daily Updates',
                                style: TextStyle(color: kblue, fontSize: 25),
                              ),
                              SizedBox(height: 13,),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child:ElevatedButton(
                                      onPressed: pickDate,
                                      child:Text('${start.day}/${start.month}/${start.year}'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: ElevatedButton(
                                     onPressed: pickDate,
                                      child:Text('${end.day}/${end.month}/${end.year}'),
                                    ),
                                  ),
                                ],
                              )
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 15.0),
                              //   child: Text(
                              //     '<Feb 07, 22>',
                              //     style: TextStyle(color: kblue, fontSize: 14),
                              //   ),
                              // ),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(HomePageMain());
                            },
                            child: Card(
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Container(
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
                                  child: Text('Your\nLogin',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                ),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [Kdblue,bluess]),
                                    borderRadius: BorderRadius.circular(10)
                                ),

                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                      itemCount:newListofUpdates.length,

                      shrinkWrap: true,
                      itemBuilder:(context,index){
                        return Container(
                          color: bgGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      newListofUpdates[index].name! + newListofUpdates[index].designation!,
                                      style: TextStyle(color: kblue, fontSize: 12),
                                    ),
                                    Text(
                                      newListofUpdates[index].date!,
                                      style: TextStyle(color: kblue, fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: Get.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: kblue,
                                          ),
                                          Text(
                                            newListofUpdates[index].update!,
                                            style: TextStyle(color: kblue, fontSize: 12),
                                          ),
                                        ],

                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                  )
                ],
              );
            },
          )
      ),
    );
  }
}