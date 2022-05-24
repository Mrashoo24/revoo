import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf;
import 'package:revoo/constants/commonWidgets.dart';
import 'package:revoo/constants/constants.dart';
import 'package:universal_html/html.dart' as html;


class HRMSReports extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;

  const HRMSReports({Key? key, required this.userDoc}) : super(key: key);

  @override
  _HRMSReportsState createState() => _HRMSReportsState();
}

class _HRMSReportsState extends State<HRMSReports> {
  String? selectedReport;
  String? selectedEmployee;
  String? dateSelected;
  String? todateSelected;
  // var _certificatePdf = pdf.Document();
  // File? _certificate;
  // String? _fileName;
  List<List<String>> attendanceReportList = [];
  List<List<String>> outGeoReportList = [];
  List<List<String>> adminReportList = [];
  List<List<String>> servicesReportList = [];
  List<List<String>> workingReportList = [];


  var selectedFilter2 = DateFormat('yyyy').format(DateTime.now());

  var selectedFilter3 = DateFormat('MMM').format(DateTime.now());


  Set userSet = {};
  var _isDailyReport = false;
  var _isOpening = false;

  int _selectedValue = 0;
  
  var firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    var listofReports = [
      "Attendance Report All",
      "Daily Report All",
      "Employee Attendance Report",
      "Salary Report"
      // 'OutGeo Login',
      // 'Certificate report how many employees ask for certificate',
      // 'Administrative leave report',
      // 'Working Report',
    ];

    var dropList2 = [
      DropdownMenuItem(child: Text('2021'),value: '2021',),
      DropdownMenuItem(child: Text('2022'),value: '2022',),
      DropdownMenuItem(child: Text('2023'),value: '2023',),
      DropdownMenuItem(child: Text('2024'),value: '2024',),
      DropdownMenuItem(child: Text('2025'),value: '2025',),
      DropdownMenuItem(child: Text('2026'),value: '2026',),
      DropdownMenuItem(child: Text('2027'),value: '2027',),
      DropdownMenuItem(child: Text('2028'),value: '2028',),
      DropdownMenuItem(child: Text('2029'),value: '2029',),
      DropdownMenuItem(child: Text('2030'),value: '2030',),
    ];

    var dropList3 = [
      DropdownMenuItem(child: Text('Jan'),value: 'Jan',),
      DropdownMenuItem(child: Text('Feb'),value: 'Feb',),
      DropdownMenuItem(child: Text('Mar'),value: 'Mar',),
      DropdownMenuItem(child: Text('Apr'),value: 'Apr',),
      DropdownMenuItem(child: Text('May'),value: 'May',),
      DropdownMenuItem(child: Text('Jun'),value: 'Jun',),
      DropdownMenuItem(child: Text('Jul'),value: 'Jul',),
      DropdownMenuItem(child: Text('Aug'),value: 'Aug',),
      DropdownMenuItem(child: Text('Sep'),value: 'Sep',),
      DropdownMenuItem(child: Text('Oct'),value: 'Oct',),
      DropdownMenuItem(child: Text('Nov'),value: 'Nov',),
      DropdownMenuItem(child: Text('Dec'),value: 'Dec',),
    ];




    attendanceReportList.clear();

    // Future _savePdf(String report, String date) async {
    //   Directory documentDirectory = await getApplicationDocumentsDirectory();
    //   String documentPath = documentDirectory.path;
    //   String fileName = DateFormat('hh:mm:ss').format(DateTime.now()) +
    //       '${report}${date}.pdf';
    //   File file = File("$documentPath/$fileName");
    //   file.writeAsBytesSync(await _certificatePdf.save());
    //   await OpenFile.open(file.path);
    //   _certificate = file;
    //   _fileName = fileName;
    // }

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




    Future<void> employeeReport({
      required String reportName,
      required String userName,
      required String userId,
      required designation,
      required String fromdate,
      required String todate,
      required List<List<String>> listofreport,
      required headers,
      required logo,
      required companyName
    }) async {
      final certificatePdf = pdf.Document();

      // Uint8List bytes1 = (await NetworkAssetBundle(Uri.parse(logo))
      //     .load(logo))
      //     .buffer
      //     .asUint8List();
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
              pdf.SizedBox(height: 20),

              pdf.Text(
                'Employee Name: $userName',
                textAlign: pdf.TextAlign.center,
                style: pdf.TextStyle(
                  fontWeight: pdf.FontWeight.bold,
                  fontSize: 10,
                    color: PdfColor.fromHex('0D3974')
                ),
              ),
              pdf.SizedBox(height: 20),

              pdf.Text(
                'Employee Id: $userId',
                textAlign: pdf.TextAlign.center,
                style: pdf.TextStyle(
                  fontWeight: pdf.FontWeight.bold,
                  fontSize: 10,
                    color: PdfColor.fromHex('0D3974')
                ),
              ),
              pdf.SizedBox(height: 20),
              pdf.Text(
                'Designation: $designation',
                textAlign: pdf.TextAlign.center,
                style: pdf.TextStyle(
                  fontWeight: pdf.FontWeight.bold,
                  fontSize: 10,
                    color: PdfColor.fromHex('0D3974')
                ),
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

    Future<void> salaryReport({
      required String reportName,
      required String userName,
      required String userId,
      required designation,
      required String fromdate,
      required String todate,
      required List<List<String>> listofreport,
      required headers,
      required logo,
      required companyName
    }) async {
      final certificatePdf = pdf.Document();

      // Uint8List bytes1 = (await NetworkAssetBundle(Uri.parse(logo))
      //     .load(logo))
      //     .buffer
      //     .asUint8List();
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
              pdf.SizedBox(height: 20),

              pdf.Text(
                'Employee Name: $userName',
                textAlign: pdf.TextAlign.center,
                style: pdf.TextStyle(
                    fontWeight: pdf.FontWeight.bold,
                    fontSize: 10,
                    color: PdfColor.fromHex('0D3974')
                ),
              ),
              pdf.SizedBox(height: 20),

              pdf.Text(
                'Employee Id: $userId',
                textAlign: pdf.TextAlign.center,
                style: pdf.TextStyle(
                    fontWeight: pdf.FontWeight.bold,
                    fontSize: 10,
                    color: PdfColor.fromHex('0D3974')
                ),
              ),
              pdf.SizedBox(height: 20),
              pdf.Text(
                'Designation: $designation',
                textAlign: pdf.TextAlign.center,
                style: pdf.TextStyle(
                    fontWeight: pdf.FontWeight.bold,
                    fontSize: 10,
                    color: PdfColor.fromHex('0D3974')
                ),
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

      if(kIsWeb){

        var  bytes = await certificatePdf.save();

        final blob = html.Blob([bytes], 'application/pdf');

        final url = html.Url.createObjectUrlFromBlob(blob);

        html.window.open(url, "_blank");
        html.Url.revokeObjectUrl(url);

      }else{

        await openPDFANDROID(certificatePdf);

      }



        // _certificate = file;
        // _fileName = fileName;

    }



    // void workingReport({
    //   @required String reportName,
    //   String userName,
    //   String fromdate,
    //   String todate,
    //   List<List<String>> listofreport,
    // }) {
    //   _certificatePdf = pdf.Document();
    //
    //   _certificatePdf.addPage(
    //     pdf.MultiPage(
    //       pageFormat: PdfPageFormat.a4,
    //       margin: const pdf.EdgeInsets.all(32.0),
    //       build: (pdf.Context context) {
    //         return <pdf.Widget>[
    //           pdf.Header(
    //             child: pdf.Column(
    //               crossAxisAlignment: pdf.CrossAxisAlignment.start,
    //               children: [
    //                 pdf.Text('From Date: ' + fromdate),
    //                 pdf.Text('To Date: ' + todate),
    //               ],
    //             ),
    //           ),
    //           pdf.Text(
    //             '$reportName for $userName',
    //             textAlign: pdf.TextAlign.center,
    //             style: pdf.TextStyle(
    //               fontWeight: pdf.FontWeight.bold,
    //               fontSize: 24,
    //               decoration: pdf.TextDecoration.underline,
    //             ),
    //           ),
    //           pdf.SizedBox(height: 30),
    //           pdf.Table.fromTextArray(
    //             headers: [
    //               'Date',
    //               'In Time',
    //               'Out Time',
    //               'Status',
    //               'Difference',
    //               'Working Status',
    //               'Reason',
    //             ],
    //             headerDecoration: pdf.BoxDecoration(
    //               color: PdfColor.fromHex('#6392B0FF'),
    //             ),
    //             data: listofreport,
    //             border: pdf.TableBorder.all(),
    //             cellAlignment: pdf.Alignment.center,
    //             cellAlignments: {
    //               1: pdf.Alignment.center,
    //             },
    //           ),
    //         ];
    //       },
    //     ),
    //   );
    // }
    //
    // void alldailyreport({
    //   String userName,
    //   String date,
    //   List<List<String>> listofreport,
    // }) {
    //   _certificatePdf = pdf.Document();
    //   _certificatePdf.addPage(
    //     pdf.MultiPage(
    //       pageFormat: PdfPageFormat.a4,
    //       margin: const pdf.EdgeInsets.all(32.0),
    //       build: (pdf.Context context) {
    //         return <pdf.Widget>[
    //           pdf.Header(
    //             child: pdf.Column(
    //               crossAxisAlignment: pdf.CrossAxisAlignment.start,
    //               children: [
    //                 pdf.Text('Date: ' + date),
    //               ],
    //             ),
    //           ),
    //           pdf.Text(
    //             'Daily Report',
    //             textAlign: pdf.TextAlign.center,
    //             style: pdf.TextStyle(
    //               fontWeight: pdf.FontWeight.bold,
    //               fontSize: 24,
    //               decoration: pdf.TextDecoration.underline,
    //             ),
    //           ),
    //           pdf.SizedBox(height: 30),
    //           pdf.Table.fromTextArray(
    //             headers: [
    //               'Employee Name',
    //               'Designation',
    //               'Date',
    //               'In Time',
    //               'Out Time',
    //               'Status',
    //               'Working Time',
    //               'Working Status',
    //               'Reason'
    //             ],
    //             headerDecoration: pdf.BoxDecoration(
    //               color: PdfColor.fromHex('#6392B0FF'),
    //             ),
    //             data: listofreport,
    //             border: pdf.TableBorder.all(),
    //             cellAlignment: pdf.Alignment.center,
    //             cellAlignments: {
    //               1: pdf.Alignment.center,
    //             },
    //           ),
    //         ];
    //       },
    //     ),
    //   );
    // }
    //
    // void outGeoReport({
    //   String fromdate,
    //   String todate,
    //   List<List<String>> listofreport,
    // }) async {
    //   final certificatePdf = pdf.Document();
    //   certificatePdf.addPage(
    //     pdf.MultiPage(
    //       pageFormat: PdfPageFormat.a4,
    //       margin: const pdf.EdgeInsets.all(32.0),
    //       build: (pdf.Context context) {
    //         return <pdf.Widget>[
    //           pdf.Header(
    //             child: pdf.Column(
    //               crossAxisAlignment: pdf.CrossAxisAlignment.start,
    //               children: [
    //                 pdf.Text('From Date: ' + fromdate),
    //                 pdf.Text('To Date: ' + todate),
    //               ],
    //             ),
    //           ),
    //           pdf.Text(
    //             'OutGeo Report for Employees',
    //             textAlign: pdf.TextAlign.center,
    //             style: pdf.TextStyle(
    //               fontWeight: pdf.FontWeight.bold,
    //               fontSize: 24,
    //               decoration: pdf.TextDecoration.underline,
    //             ),
    //           ),
    //           pdf.SizedBox(height: 30),
    //           pdf.Table.fromTextArray(
    //             headers: [
    //               'Date',
    //               'Name',
    //               'Latitude',
    //               'Longitude',
    //             ],
    //             headerDecoration: pdf.BoxDecoration(
    //               color: PdfColor.fromHex('#6392B0FF'),
    //             ),
    //             data: listofreport,
    //             border: pdf.TableBorder.all(),
    //             cellAlignment: pdf.Alignment.center,
    //             cellAlignments: {
    //               1: pdf.Alignment.center,
    //             },
    //           ),
    //         ];
    //       },
    //     ),
    //   );
    //   Directory documentDirectory = await getApplicationDocumentsDirectory();
    //   String documentPath = documentDirectory.path;
    //   String fileName =
    //       DateFormat('hh:mm:ss').format(DateTime.now()) + '_OutGeo Report.pdf';
    //   File file = File("$documentPath/$fileName");
    //   file.writeAsBytesSync(await certificatePdf.save());
    //   await OpenFile.open(file.path);
    //   _certificate = file;
    //   _fileName = fileName;
    // }
    //
    // void adminLeaveReport({
    //   String fromdate,
    //   String todate,
    //   List<List<String>> listofreport,
    // }) async {
    //   final certificatePdf = pdf.Document();
    //   certificatePdf.addPage(
    //     pdf.MultiPage(
    //       pageFormat: PdfPageFormat.a4,
    //       margin: const pdf.EdgeInsets.all(32.0),
    //       build: (pdf.Context context) {
    //         return <pdf.Widget>[
    //           pdf.Header(
    //             child: pdf.Column(
    //               crossAxisAlignment: pdf.CrossAxisAlignment.start,
    //               children: [
    //                 pdf.Text('From Date: ' + fromdate),
    //                 pdf.Text('To Date: ' + todate),
    //               ],
    //             ),
    //           ),
    //           pdf.Text(
    //             'Administrative Leaves Report ${todateSelected}',
    //             textAlign: pdf.TextAlign.center,
    //             style: pdf.TextStyle(
    //               fontWeight: pdf.FontWeight.bold,
    //               fontSize: 24,
    //               decoration: pdf.TextDecoration.underline,
    //             ),
    //           ),
    //           pdf.SizedBox(height: 30),
    //           pdf.Table.fromTextArray(
    //             headers: [
    //               'Name',
    //               'From',
    //               'To',
    //               'Days',
    //             ],
    //             headerDecoration: pdf.BoxDecoration(
    //               color: PdfColor.fromHex('#6392B0FF'),
    //             ),
    //             data: listofreport,
    //             border: pdf.TableBorder.all(),
    //             cellAlignment: pdf.Alignment.center,
    //             cellAlignments: {
    //               1: pdf.Alignment.center,
    //             },
    //           ),
    //         ];
    //       },
    //     ),
    //   );
    //   Directory documentDirectory = await getApplicationDocumentsDirectory();
    //   String documentPath = documentDirectory.path;
    //   String fileName = DateFormat('hh:mm:ss').format(DateTime.now()) +
    //       ' ${todateSelected}_Administrative Leaves Report.pdf';
    //   File file = File("$documentPath/$fileName");
    //   file.writeAsBytesSync(await certificatePdf.save());
    //   await OpenFile.open(file.path);
    //   _certificate = file;
    //   _fileName = fileName;
    // }
    //
    // void servicesReport({
    //   String fromdate,
    //   String todate,
    //   List<List<String>> listofreport,
    // }) async {
    //   final certificatePdf = pdf.Document();
    //   certificatePdf.addPage(
    //     pdf.MultiPage(
    //       pageFormat: PdfPageFormat.a4,
    //       margin: const pdf.EdgeInsets.all(32.0),
    //       build: (pdf.Context context) {
    //         return <pdf.Widget>[
    //           pdf.Header(
    //             child: pdf.Column(
    //               crossAxisAlignment: pdf.CrossAxisAlignment.start,
    //               children: [
    //                 pdf.Text('From Date: ' + fromdate),
    //                 pdf.Text('To Date: ' + todate),
    //               ],
    //             ),
    //           ),
    //           pdf.Text(
    //             'Services Report for Employees',
    //             textAlign: pdf.TextAlign.center,
    //             style: pdf.TextStyle(
    //               fontWeight: pdf.FontWeight.bold,
    //               fontSize: 24,
    //               decoration: pdf.TextDecoration.underline,
    //             ),
    //           ),
    //           pdf.SizedBox(height: 30),
    //           pdf.Table.fromTextArray(
    //             headers: [
    //               'Date',
    //               'Employee Name',
    //               'Certificate Name',
    //             ],
    //             headerDecoration: pdf.BoxDecoration(
    //               color: PdfColor.fromHex('#6392B0FF'),
    //             ),
    //             data: listofreport,
    //             border: pdf.TableBorder.all(),
    //             cellAlignment: pdf.Alignment.center,
    //             cellAlignments: {
    //               1: pdf.Alignment.center,
    //             },
    //           ),
    //         ];
    //       },
    //     ),
    //   );
    //   Directory documentDirectory = await getApplicationDocumentsDirectory();
    //   String documentPath = documentDirectory.path;
    //   String fileName = DateFormat('hh:mm:ss').format(DateTime.now()) +
    //       '_Administrative Leaves Report.pdf';
    //   File file = File("$documentPath/$fileName");
    //   file.writeAsBytesSync(await certificatePdf.save());
    //   await OpenFile.open(file.path);
    //   _certificate = file;
    //   _fileName = fileName;
    // }

    print("report = $selectedReport");


    return Scaffold(

      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: firestore.collection('Employee').where('cid',isEqualTo:widget.userDoc.get('cid')).snapshots(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return kprogressbar;
          }

          List<QueryDocumentSnapshot<Map<String, dynamic>>> employyeList = snapshot.requireData.docs;

          List<String> dropDownEmployee =
          employyeList.map((e) {
            // if ((!e.designation.toLowerCase().contains('manager') &&
            //     !e.designation.toLowerCase().contains('hr')) &&
            //     (e.hrid == widget.userDoc.empId)) {
            //
            // }
            return e.get('name').toString();
          }).toList();

          dropDownEmployee.removeWhere((element) => element == null);

          List<String> dropDownManager = ['Manager'];
          // employyeList.map((e) {
          //   if (e.designation.toLowerCase().contains('manager')) {
          //     return e.name;
          //   }
          // }).toList();
          dropDownManager.removeWhere((element) => element == null);
          return Container(
            decoration: const BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage('assets/Images/background_image.jpg'),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //         DatePicker.showDatePicker(context,
                  //             showTitleActions: true,
                  //             minTime: DateTime.now(),
                  //             maxTime: _isDailyReport
                  //                 ? DateTime.now()
                  //                 : DateTime(2050, 6, 7),
                  //             onChanged: (date) {
                  //           print('change $date');
                  //           setState(() {
                  //             dateSelected = date.toString();
                  //           });
                  //         }, onConfirm: (date) {
                  //           print('confirm $date');
                  //           setState(() {
                  //             dateSelected = date.toString();
                  //           });
                  //         },
                  //             currentTime: DateTime.now(),
                  //             locale: LocaleType.en);
                  //       },
                  //       child: Container(
                  //         color: portica,
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(12.0),
                  //           child: Text(dateSelected == null
                  //               ? "From Date"
                  //               : DateFormat("yyyy-MM-dd")
                  //                       .parse(dateSelected)
                  //                       .day
                  //                       .toString() +
                  //                   "-" +
                  //                   DateFormat("yyyy-MM-dd")
                  //                       .parse(dateSelected)
                  //                       .month
                  //                       .toString() +
                  //                   "-" +
                  //                   DateFormat("yyyy-MM-dd")
                  //                       .parse(dateSelected)
                  //                       .year
                  //                       .toString()),
                  //         ),
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         DatePicker.showDatePicker(context,
                  //             showTitleActions: true,
                  //             minTime: _isDailyReport
                  //                 ? DateTime.now()
                  //                 : DateTime.now()
                  //                     .subtract(Duration(days: 120)),
                  //             maxTime: _isDailyReport
                  //                 ? DateTime.now()
                  //                 : DateTime(2050, 6, 7),
                  //             onChanged: (date) {
                  //           print('change $date');
                  //           setState(() {
                  //             todateSelected = date.toString();
                  //           });
                  //         }, onConfirm: (date) {
                  //           print('confirm $date');
                  //           setState(() {
                  //             todateSelected = date.toString();
                  //           });
                  //         },
                  //             currentTime: DateTime.now(),
                  //             locale: LocaleType.en);
                  //       },
                  //       child: Container(
                  //         color: portica,
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(12.0),
                  //           child: Text(todateSelected == null
                  //               ? "To Date"
                  //               : DateFormat("yyyy-MM-dd")
                  //                       .parse(todateSelected)
                  //                       .day
                  //                       .toString() +
                  //                   "-" +
                  //                   DateFormat("yyyy-MM-dd")
                  //                       .parse(todateSelected)
                  //                       .month
                  //                       .toString() +
                  //                   "-" +
                  //                   DateFormat("yyyy-MM-dd")
                  //                       .parse(todateSelected)
                  //                       .year
                  //                       .toString()),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  DropdownSearch<String>(
                    // maxHeight: Get.height * 0.5,
                    items: listofReports,
                    dropdownSearchDecoration :InputDecoration(
                      label: Text("Report Type"),
                      hintText: "Select Report",
                    ),

                    onChanged: (value) {
                      print(value);
                      setState(() {
                        selectedReport = value;
                        if (selectedReport == 'Daily Report') {
                          _isDailyReport = true;
                        } else {
                          _isDailyReport = false;
                        }
                      });
                    },
                    selectedItem: "Select Report",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // if (_isDailyReport == false)
                  //   selectedReport ==
                  //       "Certificate report how many employees ask for certificate" ||
                  //       selectedReport == "Administrative leave report" ||
                  //       selectedReport == "OutGeo Login"
                  //       ? const SizedBox()
                  //       :
                  //   Row(
                  //     children: [
                  //       SizedBox(
                  //         width: MediaQuery.of(context).size.width * 0.4,
                  //         child: RadioListTile(
                  //           activeColor: Colors.blue,
                  //           value: 1,
                  //           title: const Text(
                  //             'Employee',
                  //           ),
                  //           groupValue: _selectedValue,
                  //           onChanged: (value) => setState(
                  //                 () {
                  //               _selectedValue = value as int;
                  //             },
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: MediaQuery.of(context).size.width * 0.4,
                  //         child: RadioListTile(
                  //           activeColor: Colors.blue,
                  //           value: 2,
                  //           title: const Text(
                  //             'Manager',
                  //           ),
                  //           groupValue: _selectedValue,
                  //           onChanged: (value) => setState(
                  //                 () {
                  //               _selectedValue = value as int;
                  //             },
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (_isDailyReport == false)
                    selectedReport ==
                        "Attendance Report All" ||
                        selectedReport == "Daily Report All" ||
                        selectedReport == "OutGeo Login"
                        ? const SizedBox()
                        : DropdownSearch<String>(
                      // maxHeight: Get.height * 0.6,
                      dropdownSearchDecoration :InputDecoration(
                        label: Text("Report Type"),
                        hintText: "Select Report",
                      ),
                      items: dropDownEmployee,
                      onChanged: (value) {
                        print(value);

                        setState(() {
                          selectedEmployee = value;
                        });
                      },
                      selectedItem: "Select Employee",
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  selectedReport != 'Salary Report' ? SizedBox() :   DropdownButton(
                      value: selectedFilter2,
                      items: dropList2, onChanged: (String? value){
                    setState(() {
                      selectedFilter2 = value!;
                    });
                  }
                  ) ,

                  selectedReport != 'Salary Report' ? SizedBox() :    DropdownButton(
                      value: selectedFilter3,
                      items: dropList3, onChanged: (String? value){
                    setState(() {
                      selectedFilter3 = value!;
                    });
                  }
                  ),
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
                          color: Colors.yellow,
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
                      selectedReport == "Daily Report All"
                          ? SizedBox()
                          : InkWell(
                        onTap: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: _isDailyReport
                                  ? DateTime.now()
                                  : DateTime.now(),
                              maxTime: _isDailyReport
                                  ? DateTime.now()
                                  : DateTime(2050, 6, 7),
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
                          color: Colors.yellow,
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
                  const SizedBox(
                    height: 10,
                  ),
                  _isOpening
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Kdblue)),
                    onPressed: () async {
                      setState(() {
                        _isOpening = true;
                      });

                      if (selectedReport == "Daily Report All") {
                        if (dateSelected != null &&
                            selectedReport != null
                        ) {
                          print("clicked $selectedReport");



                          QuerySnapshot<Map<String, dynamic>> newListSnap = await firestore.collection('attendence_report')
                              .where('cid',isEqualTo:widget.userDoc.get('cid')!).where('date',isEqualTo: dateSelected).get();

                          var newList = newListSnap.docs;


                          // await AllApi()
                          //     .getDelayReportList(
                          //     widget.userModel.companyid,
                          //     selectedEmployee,
                          //     dateSelected,
                          //     todateSelected,
                          //     "late");
                          //
                          // delayReportList.clear();
                          await Future.forEach(newList,
                                  (QueryDocumentSnapshot<Map<String, dynamic>> element) async {

                                    QuerySnapshot<Map<String, dynamic>> newListUsers = await firestore.collection('Employee')
                                        .where('uid',isEqualTo:element.get('uid')!).get();

                                attendanceReportList.add([
                                  newListUsers.docs[0].get('empid'),
                                  newListUsers.docs[0].get('name'),
                                  element.get('checkin'),
                                  element.get('checkout'),
                                  element.get('status'),
                                  element.get('working_status'),
                                  element.get('reason'),
                                  element.get('reason'),
                                ]);
                              });


                          print("attendanceReportList = $attendanceReportList");

                          print("dateSelected = $dateSelected");

                          print("selectedEmployee = $selectedEmployee");

                          print("todateSelected = $todateSelected");

                          print('check = ${{
                            'reportName': 'Daily Report',
                            'userName': selectedEmployee ?? '',
                            'fromdate': dateSelected!,
                            'todate': todateSelected ?? '',
                            'listofreport': attendanceReportList,
                            'headers': [
                              // 'Emp\nId',
                              // 'Emp\nName',
                              // 'CHK\nIN',
                              // 'CHK\nOUT',
                              // 'In STS'
                              //     'Out STS'
                              //     'IF\nLATE IN',
                              // 'IF\nLATE OUT',
                              'Emp\nId',
                              'Emp\nName',
                              'CHK\nIN',
                              'CHK\nOUT',
                              'Ent. STS',
                                  'Ext. STS',
                                  'IF\nLATE Ent.',
                              'IF\nLATE Ext.',
                            ]
                          }}');


                          QuerySnapshot<Map<String, dynamic>> newListCompany = await firestore.collection('Company')
                              .where('cid',isEqualTo:widget.userDoc.get('cid')!).get();






                          await delayReport(
                            reportName: 'Daily Report',
                            userName: '',
                            fromdate: dateSelected!,
                            todate: todateSelected ?? '',
                            listofreport: attendanceReportList,
                            headers: [
                              // 'Emp\n  Id',
                              // ' Emp\nName',
                              // 'Chk\n  In',
                              // 'Chk\nout',
                              // '  In\nsts',
                              // 'Out\nsts',
                              // '     IF\nLATE IN',
                              // '        IF\nLATE OUT',

                              'Emp\nId',
                              'Emp\nName',
                              'Ck\nIn',
                              'Ck\nout',
                              'Ent.\nsts',
                              'Ext.\nsts',
                              'IF\nLATE Ent.',
                              'IF\nLATE Ext.',
                            ],
                            logo:newListCompany.docs[0].get('logo'),
                              companyName:newListCompany.docs[0].get('company_name')
                          );
                          setState(() {
                            _isOpening = false;
                          });

                          // await _savePdf("Delay Report", dateSelected);

                        } else {

                          Get.snackbar("Error", "Please Fill All Details",
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      }

                      if (selectedReport == "Attendance Report All") {
                        if (dateSelected != null &&
                            selectedReport != null && todateSelected !=null
                        ) {
                          print("clicked $selectedReport");

                          QuerySnapshot<Map<String, dynamic>> newListSnap = await firestore.collection('attendence_report')
                              .where('cid',isEqualTo:widget.userDoc.get('cid')!).where('date',isGreaterThanOrEqualTo: dateSelected,
                            isLessThanOrEqualTo: todateSelected
                          ).get();

                          var newList = newListSnap.docs;


                          // await AllApi()
                          //     .getDelayReportList(
                          //     widget.userModel.companyid,
                          //     selectedEmployee,
                          //     dateSelected,
                          //     todateSelected,
                          //     "late");
                          //
                          // delayReportList.clear();

                          var testList = [];
                          userSet.clear();
                          await Future.forEach(newList,
                                  (QueryDocumentSnapshot<Map<String, dynamic>> element) async {


                                    userSet.add(element.get('uid'));
                                    


                              });

                         await Future.forEach(userSet, (element) async {

                            QuerySnapshot<Map<String, dynamic>> newListUsers = await firestore.collection('Employee')
                                .where('uid',isEqualTo:element).get();

                            QuerySnapshot<Map<String, dynamic>> listUser = await firestore.collection('attendence_report')
                              .where('cid',isEqualTo:widget.userDoc.get('cid')!)
                                .where('uid',isEqualTo:element).where('date',isGreaterThan: dateSelected,
                                isLessThanOrEqualTo: todateSelected
                            ).get();

                            var wrkhour = 0.0;
                            var wrkday = 0;

                            var attendenceCount = listUser.docs.where((element) => element.get('status') != 'Absent').length;

                           await Future.forEach(listUser.docs,
                                   (QueryDocumentSnapshot<Map<String, dynamic>> element) async {

                             print('worlday = $wrkday');

                             wrkhour = wrkhour + double.parse(element.get('working_hours') == '' ? '0' : element.get('working_hours'));

                             print('wrkhour = $wrkhour');



                               });

                            attendanceReportList.add([
                              newListUsers.docs[0].get('empid'),
                              newListUsers.docs[0].get('name'),
                              wrkhour.toPrecision(2).toString(),
                              attendenceCount.toString(),
                            ]);

                          });



                          print("userSet = $userSet");
                          print("attendanceReportList = $attendanceReportList");

                          print("dateSelected = $dateSelected");

                          print("selectedEmployee = $selectedEmployee");

                          print("todateSelected = $todateSelected");


                          QuerySnapshot<Map<String, dynamic>> newListCompany = await firestore.collection('Company')
                              .where('cid',isEqualTo:widget.userDoc.get('cid')!).get();






                          await delayReport(
                              reportName: 'Attendance Report',
                              userName: '',
                              fromdate: dateSelected!,
                              todate: todateSelected ?? '',
                              listofreport: attendanceReportList,
                              headers: [
                                'Emp\nId',
                                'Emp\nName',
                                'Wrk\nHrs',
                                'Wrk\nDays',
                                
                              ],
                              logo:newListCompany.docs[0].get('logo'),
                              companyName:newListCompany.docs[0].get('company_name')
                          );
                          setState(() {
                            _isOpening = false;
                          });

                          // await _savePdf("Delay Report", dateSelected);

                        } else {

                          Get.snackbar("Error", "Please Fill All Details",
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      }

                      if (selectedReport == "Employee Attendance Report") {
                        if (dateSelected != null &&
                            selectedReport != null && todateSelected !=null
                            && selectedEmployee != null
                        ) {
                          print("clicked $selectedReport");

                          QuerySnapshot<Map<String, dynamic>> newListUsers = await firestore.collection('Employee')
                              .where('name',isEqualTo:selectedEmployee).get();

                          QuerySnapshot<Map<String, dynamic>> listUser = await firestore.collection('attendence_report')
                          .where('cid',isEqualTo: widget.userDoc.get('cid'))
                              .where('uid',isEqualTo:newListUsers.docs[0].get('uid')).where('date',isGreaterThanOrEqualTo: dateSelected,
                              isLessThanOrEqualTo: todateSelected).get();

                          var wrkhour = 0.0;
                          var wrkday = 0;

                          var attendenceCount = listUser.docs.where((element) => element.get('status') != 'Absent').length;

                          await Future.forEach(listUser.docs,
                                  (QueryDocumentSnapshot<Map<String, dynamic>> element) async {

                                print('worlday = $wrkday');

                                wrkhour = wrkhour + double.parse(element.get('working_hours') == '' ? '0' : element.get('working_hours'));


                              });

                          print('wrkhour = $wrkhour');
                          attendanceReportList.add([
                            wrkhour.toPrecision(2).toString(),
                            attendenceCount.toString(),
                          ]);


                          var newList = newListUsers.docs;


                          print("newList = ${newList}");
                          print("attendanceReportList = $attendanceReportList");

                          print("dateSelected = $dateSelected");

                          print("selectedEmployee = $selectedEmployee");

                          print("todateSelected = $todateSelected");


                          QuerySnapshot<Map<String, dynamic>> newListCompany = await firestore.collection('Company')
                              .where('cid',isEqualTo:widget.userDoc.get('cid')!).get();






                          await employeeReport(
                              reportName: 'Working Report',
                              userName: selectedEmployee.toString(),
                              userId: newList[0].get('empid'),
                              designation: newList[0].get('Designation'),
                              fromdate: dateSelected!,
                              todate: todateSelected ?? '',
                              listofreport: attendanceReportList,
                              headers: [
                                'Wrk\nHrs',
                                'Wrk\nDays',

                              ],
                              logo:newListCompany.docs[0].get('logo'),
                              companyName:newListCompany.docs[0].get('company_name')

                          );
                          setState(() {
                            _isOpening = false;
                          });

                          // await _savePdf("Delay Report", dateSelected);

                        } else {

                          Get.snackbar("Error", "Please Fill All Details",
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      }

                      if (selectedReport == "Salary Report") {
                        if (dateSelected != null &&
                            selectedReport != null && todateSelected !=null
                            && selectedEmployee != null
                        ) {
                          print("clicked $selectedReport");

                          QuerySnapshot<Map<String, dynamic>> newListUsers = await firestore.collection('Employee')
                              .where('name',isEqualTo:selectedEmployee).get();

                         var particularEmpModel = newListUsers.docs[0];

                          QuerySnapshot<Map<String, dynamic>> listUser = await firestore.collection('attendence_report')
                              .where('cid',isEqualTo: widget.userDoc.get('cid'))
                              .where('uid',isEqualTo:newListUsers.docs[0].get('uid')).get();

                          var compDocs = listUser.docs;


                          compDocs =
                              compDocs.where((element) {

                                return DateFormat('yyyy').format(DateFormat('yyyy/MM/dd').parse(element.get('date')))

                                    == selectedFilter2;

                              }).toList();

                          var newDocs =  compDocs.where((element) {

                            return DateFormat('MMM').format(DateFormat('yyyy/MM/dd').parse(element.get('date')))

                                == selectedFilter3;

                          }).toList();


                          var wrkhour = 0.0;
                          var wrkday = 0;

                          var attendenceCount = newDocs.where((element) => element.get('status') != 'Absent').length;

                          var absentCount = newDocs.where((element) => element.get('status') == 'Absent').length;

                          await Future.forEach(newDocs,
                                  (QueryDocumentSnapshot<Map<String, dynamic>> element) async {

                                print('worlday = $wrkday');

                                wrkhour = wrkhour + double.parse(element.get('working_hours') == '' ? '0' : element.get('working_hours'));


                              });

                          print('wrkhour = $wrkhour');



                          DocumentSnapshot<Map<String, dynamic>> shiftDetails = await firestore.collection('Shifts').doc(newListUsers.docs[0].get('shiftid'))
                              .get();
                          
                         var totalHoursTowrk = double.parse(shiftDetails.get('hours')) *
                              DateFormat('yyyy/MM/dd').parse(dateSelected!).difference(DateFormat('yyyy/MM/dd').parse(todateSelected!)).inDays;

                         var totalHoursAfterAbsent = wrkhour - (attendenceCount * double.parse(shiftDetails.get('hours')));

                         var difference = totalHoursTowrk - totalHoursAfterAbsent;



                          var basicpay =    double.parse(particularEmpModel.get('basic_pay'));
                          var hra =    double.parse(particularEmpModel.get('house_rent_allowance'));
                          var ma =    double.parse(particularEmpModel.get('medical_allowance'));
                          var conveyance =    double.parse(particularEmpModel.get('conveyance'));
                          var mealc =    double.parse(particularEmpModel.get('meal_coupon'));
                          var tra =    double.parse(particularEmpModel.get('travel_allowance'));

                  //deduction
                          var pf =  double.parse(particularEmpModel.get('general_provident_fund'));
                          var pt =  double.parse(particularEmpModel.get('profession_tax'));

                     var netpay =    double.parse(particularEmpModel.get('net_pay'));


                     var totaldeduction =   double.parse(particularEmpModel.get('total_deductions'));
                          var grosspay =   double.parse(particularEmpModel.get('gross_pay'));



                               var totalSalary = netpay /  (31 - absentCount);






                          attendanceReportList = [
                            [
                              'Basic Pay',
                              '$basicpay',
                              'Professional Tax',
                              '$pt'
                            ],
                            [
                            'HRA',
                            '$hra',
                            'PF',
                            '$pf'
                          ],
                            [
                              'Medical Allowance',
                              '$mealc',
                              '',
                              ''
                            ],
                            [
                              'Conveyance',
                              '$conveyance',
                              '',
                              ''
                            ],
                            [
                              'Meal Coupon',
                              '$mealc',
                              '',
                              ''
                            ],
                            [
                              'Travel Allowance',
                              '$tra',
                              '',
                              ''
                            ],
                            [
                              '',
                              '',
                              '',
                              ''
                            ],
                            [
                              '',
                              '',
                              '',
                              ''
                            ],
                            [
                              '',
                              '',
                              'Total Deduction',
                              '$totaldeduction'
                            ],
                            [
                              'Gross Pay',
                              '$grosspay',
                              'Net Pay',
                              '$totalSalary'
                            ],
                            [
                              '',
                              '',
                              '',
                              ''
                            ],
                          ];

                          //
                          // attendanceReportList.add([
                          //
                          //   wrkhour.toPrecision(2).toString(),
                          //   attendenceCount.toString(),
                          // ]);


                          var newList = newListUsers.docs;


                          print("newList = ${newList}");
                          print("attendanceReportList = $attendanceReportList");

                          print("dateSelected = $dateSelected");

                          print("selectedEmployee = $selectedEmployee");

                          print("todateSelected = $todateSelected");


                          QuerySnapshot<Map<String, dynamic>> newListCompany = await firestore.collection('Company')
                              .where('cid',isEqualTo:widget.userDoc.get('cid')!).get();






                          await salaryReport(
                              reportName: 'Salary Report',
                              userName: selectedEmployee.toString(),
                              userId: newList[0].get('empid'),
                              designation: newList[0].get('Designation'),
                              fromdate: dateSelected!,
                              todate: todateSelected ?? '',
                              listofreport: attendanceReportList,
                              headers: [
                                'EMOLUMENTS',
                                'AMOUNT',
                                'DEDUCTIONS',
                                'AMOUNT',

                              ],
                              logo:newListCompany.docs[0].get('logo'),
                              companyName:newListCompany.docs[0].get('company_name')

                          );
                          setState(() {
                            _isOpening = false;
                          });

                          // await _savePdf("Delay Report", dateSelected);

                        } else {

                          Get.snackbar("Error", "Please Fill All Details",
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      }
                      
                      setState(() {
                        _isOpening = false;
                      });
                      
                    },
                    child: const Text(
                      "Generate Report",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> openPDFANDROID(pdf.Document certificatePdf) async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    String fileName =
        DateFormat('hh:mm:ss').format(DateTime.now()) + '_OutGeo Report.pdf';
    File file = File("$documentPath/$fileName");
    file.writeAsBytesSync(await certificatePdf.save());
    await OpenFile.open(file.path);
  }


}
