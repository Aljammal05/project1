import 'package:flutter/material.dart';
import 'package:project1_v1/Admin/AddDriver.dart';
import 'package:project1_v1/Admin/AddPharmacy.dart';
import 'package:project1_v1/Admin/ManageDrivers.dart';
import 'package:project1_v1/Admin/ManagePharmacy.dart';
import 'package:project1_v1/Database/Lists.dart';
import 'package:project1_v1/Templates/Templates.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {

  List<Widget> pharmacies = [];
  List<Widget> drivers = [];

  void fillDrivers(){
    drivers.clear();
    drivers
        .add(AddButton(destination: AddDriver(), height: 100, width: 100));
    for (int i = 0; i < Database.drivers.length; i++) {
      drivers.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ImageButton(
            image: Database.drivers.elementAt(i).imagePath,
            text: Database.drivers.elementAt(i).name,
            destination: ManageDrivers(),
            height: 100,
            width: 100,
          ),
        ),
      );
    }
  }

  void fillPharmacies(){
    pharmacies.clear();
    pharmacies
        .add(AddButton(destination: AddPharmacy(), height: 100, width: 100));
    for (int i = 0; i < Database.pharmacies.length; i++) {
      pharmacies.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ImageButton(
            image: Database.pharmacies.elementAt(i).imagePath,
            text: Database.pharmacies.elementAt(i).name,
            destination: ManagePharmacy(),
            height: 100,
            width: 100,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    fillDrivers();
    fillPharmacies();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xff99cc73),
        title: Center(
          child: Text(
            "Admin",
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 50,),
                      ManagementBar(
                        widgetList: pharmacies,
                        title: ' Pharmacy Management',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ManagementBar(
                        widgetList: drivers,
                        title: ' Delivery Management',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ManagementBar extends StatelessWidget {
  const ManagementBar({Key? key, required this.widgetList, required this.title})
      : super(key: key);

  final List<Widget> widgetList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 15,
          child: Divider(
            color: Colors.black,
            thickness: 2,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgetList,
            ),
          ),
        ),
      ],
    );
  }
}


class AddButton extends StatefulWidget {
  AddButton(
      {required this.destination, required this.height, required this.width});

  final Widget destination;
  final double height, width;

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SafeArea(child: widget.destination);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              border: Border.all(),
              color: Color(0x55ffffff),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Icon(
              Icons.add,
              size: 40,
              color: Color(0xff99cc73),
            ),
          ),
        ),
      ),
    );
  }
}

