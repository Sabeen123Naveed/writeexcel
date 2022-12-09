import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';


class MyHomePage extends StatefulWidget {
  static const routeName = 'Create excel file';
  MyHomePage({Key? key, }) : super(key: key);


 // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: EdgeInsets.all(10),
            child: IconButton(
                icon: Icon(Icons.drive_folder_upload),
                onPressed: () async {

                }

            ),
          ),
        ],
      ),


      body: Center(
        child:
        ElevatedButton(child: Text('Create Excel  '), onPressed: createExcel),


      ),


    );
  }


  Future<void> createExcel() async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText('Id');
    sheet.getRangeByName('A2').setText('1');
    sheet.getRangeByName('A3').setText('2');
    sheet.getRangeByName('A4').setText('3');
    sheet.getRangeByName('B1').setText('Name');
    sheet.getRangeByName('B2').setText('Sabeen');
    sheet.getRangeByName('B3').setText('Naveed');
    sheet.getRangeByName('B4').setText('Amna');
    sheet.getRangeByName('C1').setText('Age');
    sheet.getRangeByName('C2').setText('67');
    sheet.getRangeByName('C3').setText('45');
    sheet.getRangeByName('C4').setText('23');
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    if (kIsWeb) {
      AnchorElement(
          href:
          'data:application/octet-stream;charset=utf-16le;base64,${base64
              .encode(bytes)}')
        ..setAttribute('download', 'Output.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName =
      Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);

    }
  }
}



