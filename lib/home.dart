
import 'dart:io';
import 'package:flutter/src/rendering/box.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class MyHomePage1 extends StatelessWidget {
  static const routeName = 'Upload Updated File';

//  static var file;

  void _pickFile() async {
    // opens storage to pick files and the picked file or files
    // are assigned into result and if no file is chosen result is null.
    // you can also toggle "allowMultiple" true or false depending on your need


    final result = await FilePicker.getFile(
      allowedExtensions: ['xlsx'],
      type:FileType.custom

    );
    //final result1 = await FilePicker.getDirectoryPath()

    // if no file is picked
    if (result == null)
      return;

    // we get the file from result object
    final file = result.absolute;

    _openFile(file);


  }
  List<String> list = [];


  void _openFile(file) {
    //OpenFile.open(file.path);
    //  OpenFile.open(file.path);


    // List<String> list = [];
    var bytes = (file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    for (var table in excel.tables.keys) {
      for (List row in excel.tables[table]!.rows) {


        row.forEach((element) => print("${element}"));



        list.add(row.toString());
        // OpenFile.open(file.list.add(row.toString()));




      }
    }
    //  print("................................${list}");
  //  getListFromExcel(file);
  }




    /*Future<List<MyData>> getListFromExcel(File file) async {
      Excel excelFile = Excel.decodeBytes(await file.readAsBytes());
      if (excelFile.sheets.isEmpty) {
        throw ArgumentError("Excel file has no sheets");
      }
      Sheet excelSheet = excelFile.sheets.values.first;
      return excelSheet.rows.map<MyData>((List<Data?> row) {
        if (row[0] == null || row[1] == null || row[2] == null) {
          throw ArgumentError("Excel file contains empty cells");
        }
        else {
          return
            MyData(row[0]!.value.toString(), row[1]!.value.toString(),
                row[2]!.value.toString());

        }

      }

      ).toList();

    }*/




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: Column(
          children: [
            Center(
              child: MaterialButton(
                onPressed: () {
                  _pickFile();
                },
                child: Text(
                  'Pick and open file',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
            ),
             Container(
               height: 80,
               child: ListView.builder
                 (
                   itemCount: list.length,
                 itemBuilder: (context, index) {
                   return Card(
                     margin: const EdgeInsets.all(3),
                     color: index == 0 ? Colors.green : Colors.white,
                     child: ListTile(
                       leading: Text(list[index][0].toString()),
                       title: Text(list[index][1].toString()),
                       trailing: Text(list[index][2].toString()),
                     ),
                   );
                 },

               ),
             )

          ],
        ),
      ),
    );

  }

}

/*class MyData {
  MyData(this.Id, this.Name,this.Age);
  final String Id;
  final String Name;
  final String Age;
}*/

