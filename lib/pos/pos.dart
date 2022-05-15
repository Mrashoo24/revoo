import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../constants/constants.dart';

class Pos extends StatelessWidget {
  
  List tablerow =["Product name","Qty","Price","Weight"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                height: 41,
                width: Get.width,
                color: kblue,
            
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Image.asset("asset/smalllogo.png",),
                    SizedBox(width: 10),
            
              Text("Cash in/out",style: TextStyle(color: Colors.white),),
                    
              Spacer(),
                    Image.asset("asset/backbutton.png"),
                 
                  ],
                ),
              ),
               Container(
                 margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Success!",style: TextStyle(fontSize: 25,color: kyellow),),
                        Image.asset("asset/addnew.png",height: 30,)
                      ],
                    ),
               ),
               Container(
                margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                height: 40,
                width: Get.width/0.1,
                color: kblue,
            
                child: Center(child: Text("Print Invoice",style: TextStyle(color: Colors.white),)),
              ),
              Container(
                margin: EdgeInsets.only(top: 30,left: 20,right: 20),
                child: Column(
                children: [
                  Row(
                    children: [
                      Text("Order no.",style: TextStyle(fontSize: 13),),
                      SizedBox(width: 3,),
                      Text("2039",style: TextStyle(fontSize: 13,color: kyellow)),
                      Spacer(),
                      Text("Invoice No",style: TextStyle(fontSize: 13)),
                      SizedBox(width: 3,),
                      Text("#6546",style: TextStyle(fontSize: 13,color: kyellow))
                    ],
                  ),
                  Divider(thickness: 1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Reference Code",style: TextStyle(fontSize: 18)),
                      Text("POSS334",style: TextStyle(fontSize: 18,color: kyellow))
                    ],
                  ),
                  Divider(thickness: 1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date Issued",style: TextStyle(fontSize: 18)),
                      Text("Feb 13, 2022",style: TextStyle(fontSize: 18,color: kyellow))
                    ],
                  ),
                  Divider(thickness: 1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Date",style: TextStyle(fontSize: 18)),
                      Text("Feb 13, 2022",style: TextStyle(fontSize: 18,color: kyellow))
                    ],
                  ),
                  Divider(thickness: 1,)
                ],
              )),
              Container(
                margin: EdgeInsets.only(top: 30,left: 20,right: 20),
                child: Column(
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bill to",style: TextStyle(fontSize: 18)),
                      Text("Mr. Ajay Sharma",style: TextStyle(fontSize: 18,color: kyellow))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Email",style: TextStyle(fontSize: 18)),
                      Text("ajay42@gmail.com",style: TextStyle(fontSize: 18,color: kyellow))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Phone",style: TextStyle(fontSize: 18)),
                      Text("9862658958",style: TextStyle(fontSize: 18,color: kyellow))
                    ],
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Address",style: TextStyle(fontSize: 18)),
                      Text("456-484. Mumbai\nIndia",style: TextStyle(fontSize: 18,color: kyellow))
                    ],
                  ),
                  Divider(thickness: 1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Net Weight",style: TextStyle(fontSize: 18)),
                       Text("80Kg",style: TextStyle(fontSize: 18,color: kyellow))
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: Get.width,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text("product\nname")),
                        DataColumn(label: Text("Qty")),
                         DataColumn(label: Text("Price")),
                         DataColumn(label: Text("Price"))
                        ],
                        rows: [
                          DataRow(cells: [
                          DataCell(Text("product 1")),
                          DataCell(Text("30",style: TextStyle(fontSize: 13,color: kyellow))),
                           DataCell(Text("30",style: TextStyle(fontSize: 13,color: kyellow))),
                            DataCell(Text("30",style: TextStyle(fontSize: 13,color: kyellow)))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("product 1")),
                          DataCell(Text("30",style: TextStyle(fontSize: 13,color: kyellow))),
                           DataCell(Text("30",style: TextStyle(fontSize: 13,color: kyellow))),
                            DataCell(Text("30",style: TextStyle(fontSize: 13,color: kyellow)))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("product 1")),
                          DataCell(Text("30",style: TextStyle(fontSize: 13,color: kyellow))),
                           DataCell(Text("30",style: TextStyle(fontSize: 13,color: kyellow))),
                            DataCell(Text("30",style: TextStyle(fontSize: 13,color: kyellow)))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("product 1")),
                          DataCell(Text("30",style: TextStyle(fontSize: 13,color: kyellow))),
                           DataCell(Text("30",style: TextStyle(fontSize: 13,color: kyellow))),
                            DataCell(Text("30",style: TextStyle(fontSize: 13,color: kyellow)))
                        ])
                        ],
                      ),
                    // child: Table(
                    //   defaultColumnWidth: FixedColumnWidth(120),
                    //   border:TableBorder.all(  
                    //         color: Colors.black,  
                    //         style: BorderStyle.solid,  
                    //         width: 1),
                    //  children: [
                    //    TableRow(
                    //      children: [
                    //        TableCell(child: Text("product name"),
                    //        ),
                    //        TableCell(child: Text("product name"),),
                    //        TableCell(child: Text("product name"),),
                    //       //  TableCell(child: Text("product name"),)
                    //      ]
                    //    ),
                    //    TableRow(
                    //      children: [
                    //        TableCell(child: Text("product name"),
                    //        ),
                    //        TableCell(child: Text("product name"),),
                    //        TableCell(child: Text("product name"),),
                    //       //  TableCell(child: Text("product name"),)
                    //      ]
                    //    ),
                    //   //  TableRow(
                    //   //    children: [
                    //   //      TableCell(child: Text("product name"))
                    //   //    ]
                    //   //  ),
                    //  ],
                    // ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Text("Net Total"),
                    SizedBox(width: 10,),
                    Text("Rs 24,000/-",style: TextStyle(fontSize: 13,color: kyellow))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Text("Taxes"),
                    SizedBox(width: 10,),
                    Text("Rs 4,000/-",style: TextStyle(fontSize: 13,color: kyellow))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Text("Total"),
                    SizedBox(width: 10,),
                    Text("Rs 28,000/-",style: TextStyle(fontSize: 13,color: kyellow))
                    ],
                  ),SizedBox(height: 50,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}