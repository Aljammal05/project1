import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1_v1/EmployeeTypePage.dart';
import 'package:project1_v1/SignInPage.dart';


class UserTypePage extends StatefulWidget {
  @override
  _UserTypePageState createState() => _UserTypePageState();
}
class _UserTypePageState extends State<UserTypePage> {
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
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        "Whoever has health has hope",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "and who has hope has everything",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageButton(
                      image: "image/customer.jpeg",
                      text: "customer",
                      destination: SignInPage(),
                      height: MediaQuery.of(context).size.width / 2.8,
                      width: MediaQuery.of(context).size.width / 2.8,
                    ),
                    ImageButton(
                      image: "image/employee.jpeg",
                      text: "employee",
                      destination: EmployeeTypePage(),
                      height: MediaQuery.of(context).size.width / 2.8,
                      width: MediaQuery.of(context).size.width / 2.8,
                    )
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

class ImageButton extends StatefulWidget {
  ImageButton(
      {required this.image,
      required this.text,
      required this.destination,
      required this.height,
      required this.width} );
  final String image, text;
  final Widget destination;
  final double height, width;

  @override
  _ImageButtonState createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SafeArea(child: widget.destination);
        }));
      },
      child: Column(
        children: [
          Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
                border: Border.all(),
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.white.withOpacity(0.85), BlendMode.dstATop),
                ),
                color: Color(0x99ffffff),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          widget.text.isNotEmpty?Text(
            widget.text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ):Container()
        ],
      ),
    );
  }
}
