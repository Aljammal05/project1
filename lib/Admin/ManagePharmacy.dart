import 'package:flutter/material.dart';

class ManagePharmacy extends StatefulWidget {
  @override
  _ManagePharmacyState createState() => _ManagePharmacyState();
}

class _ManagePharmacyState extends State<ManagePharmacy> {
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
          child: Text("Manage Pharmacy"),
        ),
      ),
      body: Center(
        child: Text("Manage Pharmacy"),
      ),
      //todo here you can implement whatever you want
    );
  }
}
