import 'package:flutter/material.dart';

class AddPharmacy extends StatefulWidget {
  @override
  _AddPharmacyState createState() => _AddPharmacyState();
}

class _AddPharmacyState extends State<AddPharmacy> {
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
          child: Text("Add Pharmacy"),
        ),
      ),
      body: Center(
        child: Text("Add Pharmacy"),
      ),
      //todo here you can implement whatever you want
    );
  }
}
