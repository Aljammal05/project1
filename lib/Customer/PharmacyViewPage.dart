import 'package:flutter/material.dart';

class PharmacyViewPage extends StatefulWidget {
  const PharmacyViewPage({Key? key}) : super(key: key);

  @override
  _PharmacyViewPageState createState() => _PharmacyViewPageState();
}

class _PharmacyViewPageState extends State<PharmacyViewPage> {
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
          child: Text("Pharmacy"),
        ),
      ),
      body: Center(
        child: Text("Pharmacy"),
      ),
      //todo here you can implement whatever you want
    );
  }
}
