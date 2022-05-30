import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revoo/Controllers/requestscontroller.dart';
import 'package:intl/intl.dart';
import 'package:revoo/models/requests.dart';
class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  var backgroundColor = Color(0xFF1B57A7);
  var backgroundColor1;
  change_Color(){
    if(val == 'Accepted'){
      backgroundColor1 = Color.fromARGB(255, 50, 205, 50);
      print('green');
    }
    else if(val == 'Rejected'){
      backgroundColor1 = Color.fromARGB(255, 255, 0, 0);
      print('red');
    }
    else if(val == 'Pending'){
      backgroundColor1 = Color.fromARGB(255, 255, 215, 0);
      print('blue');
    }
    else{
      backgroundColor1 = Color(0xFF1B57A7);
      print('green');
    }
    setState(() {
      backgroundColor = backgroundColor1;
    });
  }
  ////////////////////////////////////////////////////
  // selectList(){
  //   if(val == 'Rejected'){
  //     Widget rejected(){
  //       return ListView.builder(itemCount:2,itemBuilder: (context, index) {
  //         return
  //         ListTile(
  //           title: Text('your request has been Rejected'),
  //         );
  //         ListTile(
  //           title: Text('your request has been Rejected'),
  //         );
  //       });
  //     }
  //   }
  //   else if(val == 'Accepted'){
  //     Widget Accepted(){
  //       return ListView.builder(itemCount:2,itemBuilder: (context, index) {
  //         return
  //         ListTile(
  //           title: Text('your request has been Accepted'),
  //         );
  //         ListTile(
  //           title: Text('your request has been Accepted'),
  //         );
  //       });
  //     }
  //   }
  //   else if(val == 'Pending'){
  //     Widget Accepted(){
  //       return ListView.builder(itemCount:2,itemBuilder: (context, index) {
  //         return
  //         ListTile(
  //           title: Text('your request has been Pending'),
  //         );
  //         ListTile(
  //           title: Text('your request has been Pending'),
  //         );
  //       });
  //     }
  //   }
  // }
  ///////////////////////////////////////////////////
  var list = ['Pending','Accepted','Rejected','All'];
  String val = 'All';

  DateTimeRange dateRange = DateTimeRange(start: DateTime(1998,05,07), end: DateTime(2022,05,09));
  // DateTimeRange dateRange = DateTimeRange(
  //     start: DateTime(2021,09,8),
  //     end: DateTime(2022,08,4),
  // );
  // var s = dateRange.start;


  Future pickDateRange() async{
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    print('skumar date rang${dateRange}');

    if(newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
    });
    var ndate = await newDateRange.toString();
    print(ndate);
  }
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    var startd = "${(start.year).toString()}/${(start.month).toString()}/${(start.day).toString()}";
    var endd = "${(end.year).toString()}/${(end.month).toString()}/${(end.day).toString()}";
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20,right: 20,top: 10),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Container( margin: EdgeInsets.only(right: 15),
                 // padding: EdgeInsets.all(10),
                 child: ElevatedButton(onPressed: pickDateRange, child: Text('${start.year}/${start.month}/${start.day}'),
                   style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF1B57A7)),
                ),),),
                Container(margin: EdgeInsets.only(left: 15),
                  // padding: EdgeInsets.all(10),
                  child:ElevatedButton(onPressed: pickDateRange, child: Text('${end.year}/${end.month}/${end.day}'),style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF1B57A7)),
                ),),),
              ],
            ),
          ),
          Center(
            child:Container(
              margin: EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10
                ),
                color: backgroundColor,
              ),
              width: MediaQuery.of(context).size.width*0.99,
              child: Center(
                child:  DropdownButton(

                  // Initial Value
                  value: val,
                  // onTap: change_Color,
                  // style: backgroundColor,

                  // Down Arrow Icon
                  // icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: list.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      val = newValue!;
                    });
                    change_Color();
                    // selectList();
                  },
                ),
              ),
            ),
          ),
          Container(
              child:SingleChildScrollView(
                child: GetX(init: Get.put<RequestController>(RequestController()),
                    builder:(RequestController requestcontroller){

                      if(requestcontroller.req.value.isEmpty){
                        return Text('No Data');
                      }
                      // if(val == 'Accepted' || val == 'Rejected' || val == 'Pending'){
                      //   var checkStatus = requestcontroller.request.where((element) => element.status! == val).toList();
                      //
                      //   print('val = $val and checkStatus = ${checkStatus.length}');
                      // }
                      // var checkStatus = requestcontroller.request;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      //Date filter
                      var newListofUpdates = requestcontroller.request.where(

                              (element) {
                            print(element.date);

                            return DateFormat('yyyy/MM/dd')
                                .parse(element.date!)
                                .isAfter(DateFormat('yyyy/MM/dd').parse(startd)) && DateFormat('yyyy/MM/dd')
                                .parse(element.date!)
                                .isBefore(DateFormat('yyyy/MM/dd').parse(endd));
                          }).toList();

                      print('length of filter item ${newListofUpdates.length}');
                      newListofUpdates.forEach((element) { print('element of filter date ${element.status}');});





///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                      var checkStatus = newListofUpdates.where((element) => element.status! == val).toList();

                      print('val = $val and checkStatus = ${checkStatus.length}');

                      if(val == 'All'){
                        checkStatus = newListofUpdates;
                      }
                      // if(val == 'Rejected'){
                      //   Widget Rejectedreason{}
                      // }




                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: checkStatus.length,
                          itemBuilder: (context,index){
                            return Card(
                              elevation: 5,
                              // color: Color.fromARGB(255, 133, 208, 144),
                              child:Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xFF1B57A7)),
                                      color:Color.fromARGB(255, 250, 250, 250),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Certificate Name:'),
                                            SizedBox(width: 40),
                                            Text(checkStatus[index].certificateName!),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Date'),
                                            Text(checkStatus[index].date!),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Status'),
                                            Text(checkStatus[index].status!),
                                          ],
                                        ),
                                        Visibility(
                                          visible: checkStatus[index].status == 'Rejected',
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Reason'),
                                              Text("checkStatus[index].reason!"),
                                            ],
                                          ),),
                                        Visibility(
                                          visible: checkStatus[index].status == 'Accepted',
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('View '),
                                              ElevatedButton(onPressed: (){}, child: Text('Click'),
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(Color(0xFF1B57A7)),
                                                ),),
                                            ],
                                          ),),
                                      ],
                                    ),
                                  ),
                                ],
                              ) ,
                            );

                          });
                    }
                ),
              )
          )
        ],
      ),
    );
  }
//  Future pickDateRange() async{
//    DateTimeRange? newdaterange = showDateRangePicker(
//       context: context,
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//       initialDateRange: dateRange,
//    );
//    if(newdaterange == null) return;
//    setState(() {
//      dateRange = newdaterange;
//    });
// }
}