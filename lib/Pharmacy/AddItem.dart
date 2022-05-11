import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff99cc73),
        foregroundColor: Colors.black,
        actions: [Container(width: 60,)],
        title: Center(child: Text("Add Item")),
      ),
      body: Center(child: Text("Add Item")),
      //todo here you can implement whatever you want
    );
  }
}