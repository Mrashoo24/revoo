import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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

import '../../Controllers/inventoryreportcontroller.dart';
import '../../Vendorproduct mangment/model/inventorymodel.dart';

class VendorQoutations extends StatefulWidget {
  const VendorQoutations({Key? key}) : super(key: key);

  @override
  _VendorQoutationstate createState() => _VendorQoutationstate();
}

class _VendorQoutationstate extends State<VendorQoutations> {

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

    Inventoryreportcontroller inventReportContollrer =   Get.put<Inventoryreportcontroller>(Inventoryreportcontroller());

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
        body: GetX<Inventoryreportcontroller>(
            builder: (inventoryControl) {


              var inventoryreport1 =         inventoryControl.inventory.where((element) => DateFormat('yyyy/MM/dd').parse(element.date!)
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
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: (){
                                          Get.back();
                                        },
                                        child: Icon(CupertinoIcons.arrow_left,color: Kdblue,)),
                                    Center(
                                      child: Text(
                                        'Vendor Name',
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: kblue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () async {

                                    await Future.forEach(inventoryreport1,
                                            (Inventoryreportmodel element) async {

                                          listofreport.add([
                                            element.date.toString(),
                                            element.name.toString(),
                                            element.quantity.toString(),
                                            element.type.toString(),
                                          ]);



                                        });

                                    QuerySnapshot<Map<String, dynamic>> newListCompany = await FirebaseFirestore.instance.collection('Company')
                                        .get();

                                    delayReport(reportName: 'Inventory Report', userName: 'userName', fromdate: dateSelected, todate: todateSelected,
                                      listofreport: listofreport,
                                      headers: [
                                        'Date',
                                        'Name',
                                        'Quantity',
                                        'Type'
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
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: SingleChildScrollView(
                            child: GetX(
                                init: Get.put<Inventoryreportcontroller>(Inventoryreportcontroller()),
                                builder:(Inventoryreportcontroller inventoryreport){

                                  var inventoryreport1 =         inventoryreport.inventory.where((element) => DateFormat('yyyy/MM/dd').parse(element.date!)
                                      .subtract(Duration(days: 1))
                                      .isBefore(DateFormat('yyyy/MM/dd').parse(todateSelected!))

                                      &&
                                      DateFormat('yyyy/MM/dd').parse(element.date!)
                                          .add(Duration(days: 1))
                                          .isAfter(DateFormat('yyyy/MM/dd').parse(dateSelected!))

                                  ).toList();



                                  return ListView.builder(

                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:3,itemBuilder: (context, index) {
                                    return
                                      DataTable (
                                        horizontalMargin: 18,
                                        columnSpacing: 22,

                                        columns: [
                                          DataColumn(
                                            label: Text(
                                              "Product",
                                              style: TextStyle(
                                                  fontSize: 10, color: Colors.grey.shade600),
                                            ),),
                                          DataColumn(
                                            label: Text(
                                              "Unit",
                                              style: TextStyle(
                                                  fontSize: 10, color: Colors.grey.shade600),
                                            ),),
                                          DataColumn(
                                              label: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right: 20.0),

                                                  child: Text(
                                                    "Unit Price",
                                                    style: TextStyle(
                                                        fontSize: 12 , color: Colors.grey.shade600),
                                                  ),
                                                ),
                                              )),
                                          DataColumn(
                                              label: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right: 20.0),
                                                  child: Center(
                                                    child: Center(
                                                      child: Text(
                                                        "Quantity",
                                                        style: TextStyle(
                                                            fontSize: 12, color: Colors.grey.shade600),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )),

                                          DataColumn(
                                              label: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                child: Center(

                                                  child: Text(
                                                    "Amount",
                                                    style: TextStyle(
                                                        fontSize: 12, color: Colors.grey.shade600),
                                                  ),
                                                ),
                                              )),
                                        ],





                                        rows: [
                                          DataRow(cells: [
                                            DataCell(Text(
                                              'ProductName: $index',
                                              style: TextStyle(fontSize: 12),
                                            )),
                                            DataCell(
                                              Container(
                                                width: 50,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: bgGrey,
                                                ),
                                                child: Align(
                                                    alignment: Alignment.center,

                                                    child: Text(
                                                      'PCs',
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
                                                      '100',
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
                                                      '2',
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
                                                      '200',
                                                      style: TextStyle(
                                                          color: Colors.white, fontSize: 10),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ],
                                        border: TableBorder.all(color:kblue),
                                      );

                                  });
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
