import 'package:flutter/material.dart';
import 'package:project1_v1/Pharmacy/AddItem.dart';
import 'package:project1_v1/Pharmacy/ViewItem.dart';
import 'package:project1_v1/Templates/Templates.dart';

class PharmacyDashboard extends StatefulWidget {
  const PharmacyDashboard({Key? key}) : super(key: key);

  @override
  _PharmacyDashboardState createState() => _PharmacyDashboardState();
}

class _PharmacyDashboardState extends State<PharmacyDashboard> {
  List<Widget> column1 = [];
  List<Widget> column2 = [];
  List<Widget> column3 = [];

  void fillColumns() {
    column1.clear();
    column2.clear();
    column3.clear();
    for (int i = 1; i <= 12; i++) {
      switch (i % 3) {
        case 0:
          column1.add(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageButton(
                image: "image/item$i.jpeg",
                text: "",
                destination: ViewItem(),
                height: 100,
                width: 100,
              ),
            ),
          );
          break;
        case 1:
          column2.add(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageButton(
                image: "image/item$i.jpeg",
                text: "",
                destination: ViewItem(),
                height: 100,
                width: 100,
              ),
            ),
          );
          break;
        case 2:
          column3.add(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageButton(
                image: "image/item$i.jpeg",
                text: "",
                destination: ViewItem(),
                height: 100,
                width: 100,
              ),
            ),
          );
          break;
      }
    }
  }

  Widget build(BuildContext context) {
    fillColumns();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xff99cc73),
        title: Center(
          child: Text(
            "Pharmacy",
            style: TextStyle(fontSize: 35),
          ),
        ),
        actions: [
          Container(
            width: 60,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('image/background.jpeg'),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Aster Orange Pharmacy",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(children: column1),
                          Column(children: column2),
                          Column(children: column3)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xff99cc73),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SafeArea(child: AddItem());
              },
            ),
          );
        },
      ),
    );
  }
}

