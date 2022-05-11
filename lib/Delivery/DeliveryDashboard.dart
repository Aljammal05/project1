import 'package:flutter/material.dart';

class DeliveryDashboard extends StatefulWidget {
  const DeliveryDashboard({Key? key}) : super(key: key);

  @override
  _DeliveryDashboardState createState() => _DeliveryDashboardState();
}

class _DeliveryDashboardState extends State<DeliveryDashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xff99cc73),
        title: Center(
          child: Text(
            "Delivery",
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
