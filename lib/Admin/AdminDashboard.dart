import 'package:flutter/material.dart';
import 'package:project1_v1/Database/Lists.dart';
import 'package:project1_v1/UserTypePage.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List<Widget> pharmacies = [];
  List<Widget> deliveries = [
    IconButton(destination: Container(), height: 100, width: 100)
  ];


  void fillDeliveries(){
    deliveries.clear();
    deliveries
        .add(IconButton(destination: Container(), height: 100, width: 100));
    for (int i = 0; i < Database.deliveries.length; i++) {
      deliveries.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ImageButton(
            image: Database.deliveries.elementAt(i).imagePath,
            text: Database.deliveries.elementAt(i).name,
            destination: Container(),
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
        .add(IconButton(destination: Container(), height: 100, width: 100));
    for (int i = 0; i < Database.pharmacies.length; i++) {
      pharmacies.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ImageButton(
            image: Database.pharmacies.elementAt(i).imagePath,
            text: Database.pharmacies.elementAt(i).name,
            destination: Container(),
            height: 100,
            width: 100,
          ),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    fillDeliveries();
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
                        widgetList: deliveries,
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

class IconButton extends StatefulWidget {
  IconButton(
      {required this.destination, required this.height, required this.width});

  final Widget destination;
  final double height, width;

  @override
  _IconButtonState createState() => _IconButtonState();
}

class _IconButtonState extends State<IconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SafeArea(child: widget.destination);
        }));
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
