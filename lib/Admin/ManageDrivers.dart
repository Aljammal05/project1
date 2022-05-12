import 'package:flutter/material.dart';

class ManageDrivers extends StatefulWidget {
  @override
  _ManageDriversState createState() => _ManageDriversState();
}

class _ManageDriversState extends State<ManageDrivers> {
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
          child: Text("Manage Delivery"),
        ),
      ),
      body: Center(
        child: Text("Manage Delivery"),
      ),
      //todo here you can implement whatever you want
    );
  }
}
