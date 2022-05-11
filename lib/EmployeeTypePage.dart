import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1_v1/Models/UserModel.dart';
import 'package:project1_v1/SignInPage.dart';
import 'package:project1_v1/UserTypePage.dart';

class EmployeeTypePage extends StatefulWidget {
  @override
  _EmployeeTypePageState createState() => _EmployeeTypePageState();
}

class _EmployeeTypePageState extends State<EmployeeTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 62,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('image/background.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Employee",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Text(
                        "please choose employee type ",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageButton(
                            image: "image/delivery.png",
                            text: "Delivery",
                            destination: SignInPage(),
                            height: MediaQuery.of(context).size.width / 2.8,
                            width: MediaQuery.of(context).size.width / 2.8,

                          ),
                          ImageButton(
                            image: "image/pharmacy.png",
                            text: "Pharmacy",
                            destination: SignInPage(),
                            height: MediaQuery.of(context).size.width / 2.8,
                            width: MediaQuery.of(context).size.width / 2.8,

                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "contact us",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Icon(Icons.email),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "drugcenter33@gmail.com",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Icon(Icons.phone_android),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "0790223736",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
