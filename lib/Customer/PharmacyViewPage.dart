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
      body: Center(child: Text("Pharmacy")),
    );
  }
}