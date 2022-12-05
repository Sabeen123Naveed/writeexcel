
import 'package:flutter/material.dart';
import 'excel.dart';
import 'home.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MyHomePage.routeName: (context) => MyHomePage(),
        MyHomePage1.routeName: (context) => MyHomePage1(),
     //   DataScreen.routeName: (context) => DataScreen(),

      },





      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Page Tranaction")),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(animationTypeList[index]);
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.cyan,
                      child: Text("${index + 1}"),
                    ),
                    title: Text(animationTypeList[index].toString()),
                  ),
                ),
              );
            },
            itemCount: animationTypeList.length,
          ),
        ),
      ),
    );
  }
}
var animationTypeList = [
  MyHomePage.routeName,
  MyHomePage1.routeName,
 // DataScreen.routeName,

];





