import 'package:flutter/material.dart';
import 'package:project1_v1/Customer/ConsultationPage.dart';
import 'package:project1_v1/Customer/PharmacyViewPage.dart';
import 'package:project1_v1/Database/Lists.dart';
import 'package:project1_v1/Templates/Templates.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ImageButton> pharmacies = [];

  void fillPharmacies(BuildContext context) {
    pharmacies.clear();
    for (int i = 0; i < Database.pharmacies.length; i++) {
      pharmacies.add(
        ImageButton(
          image: Database.pharmacies.elementAt(i).imagePath,
          text: Database.pharmacies.elementAt(i).name,
          destination: PharmacyViewPage(),
          height: MediaQuery.of(context).size.width / 2.6,
          width: MediaQuery.of(context).size.width / 2.6,
        ),
      );
    }
    pharmacies.shuffle();
  }

  Widget build(BuildContext context) {
    fillPharmacies(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('image/background.jpeg'), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              "image/homepage.png",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: pharmacies.sublist(
                            0, (pharmacies.length / 2).ceil()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: pharmacies.sublist(
                            (pharmacies.length / 2).round(), pharmacies.length),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ImageButton(
              text: "",
              destination: ConsultationPage(),
              image: "image/istesharah.jpeg",
              height: 70,
              width: 230,
            ),
          ),
        ],
      ),
    );
  }
}
