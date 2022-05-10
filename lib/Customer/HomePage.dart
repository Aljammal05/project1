import 'package:flutter/material.dart';
import 'package:project1_v1/Customer/ConsultationPage.dart';
import 'package:project1_v1/Customer/PharmacyViewPage.dart';
import 'package:project1_v1/UserTypePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ImageButton> pharmacies = [];
  @override

  Widget build(BuildContext context) {
    pharmacies.clear();
    for (int i = 1; i <= 9; i++) {
      pharmacies.add(ImageButton(
        image: "image/pharmacy$i.jpeg",
        text: 'pharmacy$i',
        destination: PharmacyViewPage(),
        height: MediaQuery.of(context).size.width / 2.6,
        width: MediaQuery.of(context).size.width / 2.6,
        function: (){},
      ));
    }
    pharmacies.shuffle();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('image/background.jpeg'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Color(0xaa3CB371),
                          Color(0xaa32CD32)
                        ], // red to yellow
                        tileMode: TileMode.repeated,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text("Available Pharmacies",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: pharmacies.sublist(
                                    0, (pharmacies.length / 2).ceil()),
                              ),
                              Column(
                                children: pharmacies.sublist(
                                    (pharmacies.length / 2).round(),
                                    pharmacies.length),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ImageButton(
                text: "",
                destination: ConsultationPage(),
                image: "image/istesharah.jpeg",
                height: 70,
                width: 230,
                function: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
