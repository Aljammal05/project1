import 'package:flutter/material.dart';

class AddDriver extends StatefulWidget {
  @override
  _AddDriverState createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff99cc73),
        foregroundColor: Colors.black,
        actions: [
          Container(
            width: 60,
          )
        ],
        title: Center(
          child: Text("Add Delivery"),
        ),
      ),
      body: Center(
        child: Text("Add Delivery"),
      ),
      //todo here you can implement whatever you want
    );
  }
}
