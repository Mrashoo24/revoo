import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/Controllers/ordersController.dart';

import '../Controllers/inventoryreportcontroller.dart';
import '../constants/constants.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf;
import 'package:revoo/constants/commonWidgets.dart';
import 'package:revoo/constants/constants.dart';
import 'package:universal_html/html.dart' as html;
import 'package:collection/collection.dart';

import '../model/orderModel.dart';
class SalesReport extends StatefulWidget {
  const SalesReport({Key? key}) : super(key: key);

  @override
  _SalesReportState createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {

  String dateSelected  = DateFormat('yyyy/MM/dd').format(DateTime.now().subtract(Duration(days: 1)));
  String todateSelected = DateFormat('yyyy/MM/dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    var itemList = ['', 'Std1', 'Std2', 'Std3', 'Std4', 'Std5', 'Std6', 'Std7','std67'];

    var itemList1 = [
      '',
      'in',
      'out',
    ];

    List<List<String>>  listofreport = [];

    String initialValue = 'Product category';

    int _value = 2;

    Future<void> delayReport({
      required String reportName,
      required String userName,
      required String fromdate,
      required String todate,
      required List<List<String>> listofreport,
      required headers,
      required logo,
      required companyName
    }) async {
      final certificatePdf = pdf.Document();



      // Uint8List bytes1 = await CommonWidgets().getImage('https://www.thehomelyy.com/assets/imgs/logo.png');


      // print('bytes = $bytes1');

      final profileImage = pdf.MemoryImage(
        (await rootBundle.load('asset/anlogos.jpg')).buffer.asUint8List(),
      );

      certificatePdf.addPage(
        pdf.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pdf.EdgeInsets.all(32.0),
          build: (pdf.Context context) {
            return <pdf.Widget>[
              pdf.Header(
                child: pdf.Column(
                  crossAxisAlignment: pdf.CrossAxisAlignment.start,
                  children: [
                    pdf.Row(
                        mainAxisAlignment: pdf.MainAxisAlignment.center,
                        children: [
                          pdf.Image(profileImage,height: 100,width: 100),
                        ]
                    ),
                    pdf.Row(
                        mainAxisAlignment: pdf.MainAxisAlignment.center,
                        children: [
                          pdf.Text(
                            '$companyName',
                            textAlign: pdf.TextAlign.center,
                            style: pdf.TextStyle(
                                fontWeight: pdf.FontWeight.bold,
                                fontSize: 16,
                                decoration: pdf.TextDecoration.underline,
                                color: PdfColor.fromHex('0D3974')
                            ),
                          ),
                        ]
                    ),
                    pdf.Text('Date: ' + fromdate,style: pdf.TextStyle(color:PdfColor.fromHex('0D3974'))),
                    todate == null ? pdf.SizedBox()  : pdf.Text('To Date: ' + todate,style: pdf.TextStyle(color:PdfColor.fromHex('0D3974'))),

                  ],
                ),
              ),
              pdf.Row(
                  mainAxisAlignment: pdf.MainAxisAlignment.center,
                  children: [
                    pdf.Text(
                      '$reportName',
                      textAlign: pdf.TextAlign.center,
                      style: pdf.TextStyle(
                          fontWeight: pdf.FontWeight.bold,
                          fontSize: 24,
                          decoration: pdf.TextDecoration.underline,
                          color: PdfColor.fromHex('0D3974')
                      ),
                    ),
                  ]
              ),

//               pdf.Paragraph(
//                 margin: const pdf.EdgeInsets.only(top: 12.0),
//                 text: '''
// The Sharjah Education Council of the Government of Sharjah testifies that , an Emirati national, has been working for us since and remains at the helm to date, and the following are their job data:''',
//               ),
              pdf.SizedBox(height: 30),
              pdf.Table.fromTextArray(
                  headers: headers,
                  headerDecoration: pdf.BoxDecoration(
                    color: PdfColor.fromHex('DEB539'),
                  ),
                  data: listofreport,
                  border: pdf.TableBorder.all(),
                  cellAlignment: pdf.Alignment.center,
                  cellStyle: pdf.TextStyle(color: PdfColor.fromHex('1B57A7')),
                  cellAlignments: {
                    1: pdf.Alignment.center,
                  },
                  headerStyle: pdf.TextStyle(color: PdfColor.fromHex('0D3974'))

              ),
            ];
          },
        ),
      );

      var  bytes = await certificatePdf.save();

      final blob = html.Blob([bytes], 'application/pdf');

      final url = html.Url.createObjectUrlFromBlob(blob);

      html.window.open(url, "_blank");
      html.Url.revokeObjectUrl(url);

    }

    return SafeArea(
      child: Scaffold(
        body: GetX<OrdersController>(
          init: Get.put(OrdersController()),
            builder: (inventoryControl) {


              var inventoryreport1 =         inventoryControl.ordersList.where((element) => DateFormat('yyyy/MM/dd').parse(element.date!)
                  .subtract(Duration(days: 1))
                  .isBefore(DateFormat('yyyy/MM/dd').parse(todateSelected!))

                  &&
                  DateFormat('yyyy/MM/dd').parse(element.date!)
                      .add(Duration(days: 1))
                      .isAfter(DateFormat('yyyy/MM/dd').parse(dateSelected!))

              ).toList();


              return Container(
                width: Get.width,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [

                        SizedBox(height: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Sales\nReports",
                                    style: TextStyle(color: kblue, fontSize: 25),

                                  ),

                                ),
                                InkWell(
                                  onTap: () async {

                                    await Future.forEach(inventoryreport1,
                                            (OrderModel element) async {

                                          listofreport.add([
                                           element.date.toString(),
                                            element.customer ?? '',
                                            element.cnumber ?? '',
                                            element.product ?? '',
                                            'PCS',
                                            element.quantity ?? '',
                                           (double.parse( element.price!) * double.parse(element.quantity!)).toString(),
                                            element.status ?? '',
                                          ]);



                                        });

                                    QuerySnapshot<Map<String, dynamic>> newListCompany = await FirebaseFirestore.instance.collection('Company')
                                        .get();

                                    delayReport(reportName: 'Inventory Report', userName: 'userName', fromdate: dateSelected, todate: todateSelected,
                                      listofreport: listofreport,
                                      headers: [
                                        'Date',
                                        'Customer Name',
                                        'Customer Number',
                                        'Product Name',
                                        'Product Unit Price',
                                        'Quantity',
                                        'Product Total',
                                        'Order Status',
                                      ],
                                      logo: newListCompany.docs[0].get('logo'),
                                      companyName: newListCompany.docs[0].get('company_name'),);



                                  },child:  Container(
                                  width: 130,
                                  height: 36,
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(border: Border.all(
                                      color: Kdblue,width: 2
                                  )),
                                  child: Container(

                                      child:Center(
                                          child: Text('Print PDF')
                                      )
                                  ),
                                ),
                                ),

                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    DatePicker.showDatePicker(context,
                                        showTitleActions: true,
                                        minTime: DateTime.now()
                                            .subtract(const Duration(days: 120)),
                                        maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                                          print('change $date');
                                          setState(() {
                                            dateSelected = DateFormat('yyyy/MM/dd').format(date);
                                          });
                                        }, onConfirm: (date) {
                                          print('confirm $date');
                                          setState(() {
                                            dateSelected = DateFormat('yyyy/MM/dd').format(date);
                                          });
                                        },
                                        currentTime: DateTime.now(),
                                        locale: LocaleType.en);
                                  },
                                  child: Container(
                                    color: kyellow,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(dateSelected == null
                                          ? "From Date"
                                          : DateFormat("yyyy/MM/dd")
                                          .parse(dateSelected!)
                                          .day
                                          .toString() +
                                          "-" +
                                          DateFormat("yyyy/MM/dd")
                                              .parse(dateSelected!)
                                              .month
                                              .toString() +
                                          "-" +
                                          DateFormat("yyyy/MM/dd")
                                              .parse(dateSelected!)
                                              .year
                                              .toString()),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    DatePicker.showDatePicker(context,
                                        showTitleActions: true,
                                        minTime:  DateTime.now(),
                                        maxTime: DateTime.now().add(Duration(days: 1)),
                                        onChanged: (date) {
                                          print('change $date');
                                          setState(() {
                                            todateSelected = DateFormat('yyyy/MM/dd').format(date);
                                          });
                                        }, onConfirm: (date) {
                                          print('confirm $date');
                                          setState(() {
                                            todateSelected = DateFormat('yyyy/MM/dd').format(date);
                                          });
                                        },
                                        currentTime: DateTime.now(),
                                        locale: LocaleType.en);
                                  },
                                  child: Container(
                                    color: kyellow,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(todateSelected == null
                                          ? "To Date"
                                          : DateFormat("yyyy/MM/dd")
                                          .parse(todateSelected!)
                                          .day
                                          .toString() +
                                          "-" +
                                          DateFormat("yyyy/MM/dd")
                                              .parse(todateSelected!)
                                              .month
                                              .toString() +
                                          "-" +
                                          DateFormat("yyyy/MM/dd")
                                              .parse(todateSelected!)
                                              .year
                                              .toString()),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: GetX(
                                init: Get.put<Inventoryreportcontroller>(Inventoryreportcontroller()),
                                builder:(Inventoryreportcontroller inventoryreport){

                                  var inventoryreport1 =         inventoryControl.ordersList.where((element) => DateFormat('yyyy/MM/dd').parse(element.date!)
                                      .subtract(Duration(days: 1))
                                      .isBefore(DateFormat('yyyy/MM/dd').parse(todateSelected!))

                                      &&
                                      DateFormat('yyyy/MM/dd').parse(element.date!)
                                          .add(Duration(days: 1))
                                          .isAfter(DateFormat('yyyy/MM/dd').parse(dateSelected!))

                                  ).toList();


                                return   Column(
                                    children: [
                                    DataTable (
                                    horizontalMargin: 18,
                                    columnSpacing: 22,

                                    columns: [
                                      DataColumn(
                                        label: Text(
                                          "Date",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.grey.shade600),
                                        ),),

                                      DataColumn(
                                          label: Center(
                                            child: Text(
                                              "Product Name",
                                              style: TextStyle(
                                                  fontSize: 12 , color: Colors.grey.shade600),
                                            ),
                                          )),
                                      DataColumn(
                                          label: Center(
                                            child: Center(
                                              child: Center(
                                                child: Text(
                                                  "Quantity",
                                                  style: TextStyle(
                                                      fontSize: 12, color: Colors.grey.shade600),
                                                ),
                                              ),
                                            ),
                                          )),
                                      DataColumn(
                                          label: Center(
                                            child: Center(
                                              child: Center(
                                                child: Text(
                                                  "Unit Price",
                                                  style: TextStyle(
                                                      fontSize: 12, color: Colors.grey.shade600),
                                                ),
                                              ),
                                            ),
                                          )),
                                      DataColumn(
                                          label: Center(
                                            child: Center(
                                              child: Center(
                                                child: Text(
                                                  "Total",
                                                  style: TextStyle(
                                                      fontSize: 12, color: Colors.grey.shade600),
                                                ),
                                              ),
                                            ),
                                          )),
                                      DataColumn(
                                        label: Text(
                                          "Customer Name",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.grey.shade600),
                                        ),),
                                      DataColumn(
                                        label: Text(
                                          "Customer Number",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.grey.shade600),
                                        ),),
                                    ],





                                    rows: inventoryreport1.mapIndexed((index, element) => DataRow(cells: [
                                      DataCell(Text(
                                        inventoryreport1[index].date.toString(),
                                        style: TextStyle(fontSize: 12),
                                      )),
                                      DataCell(
                                        Container(
                                          height: 25,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: bgGrey,
                                          ),
                                          child: Align(
                                              alignment: Alignment.center,

                                              child: Text(
                                                inventoryreport1[index].product.toString(),
                                                style: TextStyle(color: Colors.orange),
                                              )),
                                        ),
                                      ),

                                      DataCell(
                                        Container(

                                          height: 20,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: bgGrey,
                                          ),

                                          child: Align(
                                              alignment: Alignment.center,

                                              child: Text(
                                                inventoryreport1[index].quantity.toString(),
                                                style: TextStyle(color: Colors.orange),
                                              )),

                                        ),
                                      ),

                                      DataCell(
                                        Center(
                                          child: Container(
                                            height: 20,
                                            margin: EdgeInsets.symmetric(vertical: 10),
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
                                                inventoryreport1[index].price.toString(),
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      DataCell(
                                        Center(
                                          child: Container(

                                            margin: EdgeInsets.symmetric(vertical: 10),
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
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  (double.parse(inventoryreport1[index].price!) * double.parse(inventoryreport1[index].quantity!)).toString(),
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      DataCell(
                                        Center(
                                          child: Container(
                                            height: 20,
                                            margin: EdgeInsets.symmetric(vertical: 10),
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
                                                inventoryreport1[index].customer.toString(),
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      DataCell(
                                        Center(
                                          child: Container(
                                            height: 20,
                                            margin: EdgeInsets.symmetric(vertical: 10),
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
                                                inventoryreport1[index].cnumber.toString(),
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),).toList(),

                                    border: TableBorder.all(color:kblue),
                                  )
                                    ],
                                  );


                                  // return ListView.builder(
                                  //
                                  //     shrinkWrap: true,
                                  //     physics: NeverScrollableScrollPhysics(),
                                  //     itemCount:inventoryreport1.length,itemBuilder: (context, index) {
                                  //   return
                                  //     DataTable (
                                  //       horizontalMargin: 18,
                                  //       columnSpacing: 22,
                                  //
                                  //       columns: [
                                  //         DataColumn(
                                  //           label: Text(
                                  //             "Date",
                                  //             style: TextStyle(
                                  //                 fontSize: 10, color: Colors.grey.shade600),
                                  //           ),),
                                  //
                                  //         DataColumn(
                                  //             label: Center(
                                  //               child: Padding(
                                  //                 padding: const EdgeInsets.only(right: 20.0),
                                  //
                                  //                 child: Text(
                                  //                   "Product Name",
                                  //                   style: TextStyle(
                                  //                       fontSize: 12 , color: Colors.grey.shade600),
                                  //                 ),
                                  //               ),
                                  //             )),
                                  //         DataColumn(
                                  //             label: Center(
                                  //               child: Padding(
                                  //                 padding: const EdgeInsets.only(right: 20.0),
                                  //                 child: Center(
                                  //                   child: Center(
                                  //                     child: Text(
                                  //                       "Quantity",
                                  //                       style: TextStyle(
                                  //                           fontSize: 12, color: Colors.grey.shade600),
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //             )),
                                  //         DataColumn(
                                  //           label: Text(
                                  //             "Customer Name",
                                  //             style: TextStyle(
                                  //                 fontSize: 10, color: Colors.grey.shade600),
                                  //           ),),
                                  //         DataColumn(
                                  //           label: Text(
                                  //             "Customer Number",
                                  //             style: TextStyle(
                                  //                 fontSize: 10, color: Colors.grey.shade600),
                                  //           ),),
                                  //       ],
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //       rows: [
                                  //         DataRow(cells: [
                                  //           DataCell(Text(
                                  //             inventoryreport1[index].date.toString(),
                                  //             style: TextStyle(fontSize: 12),
                                  //           )),
                                  //           DataCell(
                                  //             Container(
                                  //               width: 50,
                                  //               height: 25,
                                  //               decoration: BoxDecoration(
                                  //                 borderRadius: BorderRadius.circular(10),
                                  //                 color: bgGrey,
                                  //               ),
                                  //               child: Align(
                                  //                   alignment: Alignment.center,
                                  //
                                  //                   child: Text(
                                  //                     inventoryreport1[index].product.toString(),
                                  //                     style: TextStyle(color: Colors.orange),
                                  //                   )),
                                  //             ),
                                  //           ),
                                  //
                                  //           DataCell(
                                  //             Container(
                                  //
                                  //               height: 20,
                                  //
                                  //               decoration: BoxDecoration(
                                  //                 borderRadius: BorderRadius.circular(10),
                                  //                 color: bgGrey,
                                  //               ),
                                  //
                                  //               child: Align(
                                  //                   alignment: Alignment.center,
                                  //
                                  //                   child: Text(
                                  //                     inventoryreport1[index].quantity.toString(),
                                  //                     style: TextStyle(color: Colors.orange),
                                  //                   )),
                                  //
                                  //             ),
                                  //           ),
                                  //
                                  //           DataCell(
                                  //             Center(
                                  //               child: Container(
                                  //                 height: 20,
                                  //                 margin: EdgeInsets.symmetric(vertical: 10),
                                  //                 decoration: BoxDecoration(
                                  //                   gradient: LinearGradient(
                                  //                     colors: [
                                  //                       Colors.blue.shade900,
                                  //                       Colors.blue,
                                  //                     ],
                                  //                     begin: Alignment.topLeft,
                                  //                     end: Alignment.bottomRight,
                                  //                   ),
                                  //                   borderRadius: BorderRadius.circular(10),
                                  //                 ),
                                  //                 child: Center(
                                  //                   child: Text(
                                  //                     inventoryreport1[index].customer.toString(),
                                  //                     style: TextStyle(
                                  //                         color: Colors.white, fontSize: 10),
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //
                                  //           DataCell(
                                  //             Center(
                                  //               child: Container(
                                  //                 height: 20,
                                  //                 margin: EdgeInsets.symmetric(vertical: 10),
                                  //                 decoration: BoxDecoration(
                                  //                   gradient: LinearGradient(
                                  //                     colors: [
                                  //                       Colors.blue.shade900,
                                  //                       Colors.blue,
                                  //                     ],
                                  //                     begin: Alignment.topLeft,
                                  //                     end: Alignment.bottomRight,
                                  //                   ),
                                  //                   borderRadius: BorderRadius.circular(10),
                                  //                 ),
                                  //                 child: Center(
                                  //                   child: Text(
                                  //                     inventoryreport1[index].cnumber.toString(),
                                  //                     style: TextStyle(
                                  //                         color: Colors.white, fontSize: 10),
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ]),
                                  //       ],
                                  //       border: TableBorder.all(color:kblue),
                                  //     );
                                  //
                                  // });
                                }),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
