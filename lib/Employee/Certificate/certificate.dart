import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';

import 'package:revoo/Employee/Certificate/request.dart';
import 'package:pdf/widgets.dart' as pdf;
import 'package:universal_html/html.dart' as html;



import 'morerequest.dart';
class Certificate extends StatefulWidget {
  const Certificate({Key? key}) : super(key: key);

  @override
  State<Certificate> createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  final _certificatePdf = pdf.Document();
  String selectedStatus = '0';

  Map<String, String> detailedSalaryFields = {};
  Map<String, String> totalSalaryFields = {};
  Map<String, String> withoutSalaryFields = {};


  void servicesReport({
    required String fromdate,
    required String todate,
    required List<List<String>> listofreport,total,headers
  }) async {

    print('length of data = ${headers.length} ${listofreport.length}');

    final certificatePdf = pdf.Document();
    certificatePdf.addPage(
      pdf.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pdf.EdgeInsets.all(32.0),
        build: (pdf.Context context) {
          return <pdf.Widget>[

            pdf.Header(
                child:  pdf.Center(
                  child: pdf.Column(
                    crossAxisAlignment: pdf.CrossAxisAlignment.center,
                    mainAxisAlignment: pdf.MainAxisAlignment.center,
                    children: [
                      pdf.Text('Company Name',style: pdf.TextStyle(fontSize: 36,fontWeight: pdf.FontWeight.bold)),
                      pdf.Text('Daily Report',style: pdf.TextStyle(fontSize: 24,fontWeight: pdf.FontWeight.bold,
                          decoration: pdf.TextDecoration.underline
                      )),
                      pdf.Text('From Date: ' + fromdate),
                      pdf.Text('To Date: ' + todate),
                    ],
                  ),
                )
            ),
            pdf.SizedBox(height: 30),
            pdf.Table.fromTextArray(
              cellStyle: pdf.TextStyle(fontSize: 8),
              headerStyle:pdf.TextStyle(fontSize: 6,color: PdfColors.white) ,
              headers: headers,
              headerDecoration: pdf.BoxDecoration(
                color: PdfColor.fromHex('#8A2BE2'),
              ),

              data: listofreport,
              border: pdf.TableBorder.all(width: 0.05),
              cellAlignment: pdf.Alignment.center,
              cellAlignments: {
                1: pdf.Alignment.center,
              },
            ),
            pdf.Divider(height: 10,thickness: 2),
            pdf.Row(
                children: [

                  pdf.Text('TOTAL'),
                  pdf.SizedBox(width: 20,),
                  pdf.Text('${listofreport[0][listofreport[0].length-1]} ${total.toString()}'),

                ]
            ),
            pdf.Divider(height: 10,thickness: 2),


          ];
        },
      ),
    );

    var  bytes = await certificatePdf.save();

    final blob = html.Blob([bytes], 'application/pdf');

    final url = html.Url.createObjectUrlFromBlob(blob);

    html.window.open(url, "_blank");
    html.Url.revokeObjectUrl(url);

    ///Ford Priniting
    // final anchor =
    // html.document.createElement('a') as html.AnchorElement
    //   ..href = url
    //   ..style.display = 'none'
    //   ..download = 'some_name.pdf';
    // html.document.body?.children.add(anchor);
    // anchor.click();
    // html.document.body?.children.remove(anchor);
    // html.Url.revokeObjectUrl(url);


    // Directory documentDirectory = await getApplicationDocumentsDirectory();
    //
    // String documentPath = documentDirectory.path;
    //
    // String fileName = DateFormat('hh:mm:ss').format(DateTime.now()) +
    //     '_Administrative Leaves Report.pdf';
    //
    // File file = File("$documentPath/$fileName");
    //
    // file.writeAsBytesSync(await certificatePdf.save());
    //
    // await OpenFile.open(file.path);
    //
    // _certificate = file;
    // _fileName = fileName;
  }






  detail(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Request for the services?'),
        content: Text('Are you sure you want to request for the services'),
        actions: [
          TextButton(onPressed: (){}, child: Text('Request')),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Cancel')),
        ],
      );
    });
  }
  total(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Request for the services?'),
        content: Text('Are you sure you want to request for the services'),
        actions: [
          TextButton(onPressed: (){}, child: Text('Request')),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Cancel')),
        ],
      );
    });
  }
  without(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Request for the services?'),
        content: Text('Are you sure you want to request for the services'),
        actions: [
          TextButton(onPressed: (){}, child: Text('Request')),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Cancel')),
        ],
      );
    });
  }
  Widget Services(){
    return ListView(
      children: [
        Card(
          color: Color.fromARGB(250, 250, 250, 250),
          margin: EdgeInsets.all(8),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF1B57A7)),
              color:Color.fromARGB(255, 250, 250, 250),
              borderRadius: BorderRadius.circular(12),
            ),
            child:ListTile(
              title: Text('Certificate with detail salary'),
              trailing: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF1B57A7)),
                ),
                child: Text('Request'),
                onPressed: detail,
              ),
            ),
          ),
        ),

        Card(
          color: Color.fromARGB(250, 250, 250, 250),
          margin: EdgeInsets.all(8),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF1B57A7)),
              color:Color.fromARGB(255, 250, 250, 250),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text('Certificate with total salary'),
              trailing: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF1B57A7)),
                ),
                child: Text('Request'),
                onPressed: total,
              ),
            ),
          )
        ),

        Card(
          color: Color.fromARGB(250, 250, 250, 250),
          margin: EdgeInsets.all(8),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF1B57A7)),
              color:Color.fromARGB(255, 250, 250, 250),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
            title: Text('Certificate without salary'),
            trailing: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF1B57A7)),
              ),
              child: Text('Request'),
              onPressed: without,
            ),
          ),),
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:DefaultTabController(length: 2,child:Scaffold(

        // extendBodyBehindAppBar: true,

      body: Column(
        children: [
          TabBar(
            labelColor: Color(0xFF0D3974),
            tabs: [
              Tab(text: 'Services',),
              Tab(text: 'Request',),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Services(),
                Request(),
              ],
            ),
          ),
        ],
      ),)
      ),
      );
  }
}
