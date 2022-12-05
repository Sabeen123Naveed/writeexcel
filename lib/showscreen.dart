import 'package:flutter/material.dart';
class Show extends StatefulWidget {
  const Show({Key? key}) : super(key: key);

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    return
        ListView.builder
          (
            itemCount: list.length,
            itemBuilder: (_,int index){
              return Text("${list[index]} "
              );
            }

    );
  }
}

