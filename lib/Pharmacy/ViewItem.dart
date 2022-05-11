import 'package:flutter/material.dart';

class ViewItem extends StatefulWidget {

  @override
  _ViewItemState createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff99cc73),
        foregroundColor: Colors.black,
        actions: [Container(width: 60,)],
        title: Center(child: Text("View Item")),
      ),
      body: Center(child: Text("View Item")),
      //todo here you can implement whatever you want
    );
  }
}