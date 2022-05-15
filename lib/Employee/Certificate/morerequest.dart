import 'package:flutter/material.dart';
class MoreRequest extends StatefulWidget {
  const MoreRequest({Key? key}) : super(key: key);

  @override
  State<MoreRequest> createState() => _MoreRequestState();
}

class _MoreRequestState extends State<MoreRequest> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child:Container(
              margin: EdgeInsets.only(top: 33),
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
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context,inddex){
                  return Card(
                    elevation: 20,
                    // color: Color.fromARGB(255, 133, 208, 144),
                    child:Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color:Color.fromARGB(255, 100, 100, 100),
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
                                  Text('Certificate with detailed salary'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Date'),
                                  Text('2022-04-25'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Stuts'),
                                  Text('Pending from HR'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ) ,
                  );

                }),
          )
        ],
      ),
    );
  }
}
