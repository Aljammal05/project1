import 'package:flutter/material.dart';
import 'package:project1_v1/Database/Lists.dart';
import 'package:project1_v1/Models/Order.dart';

class DeliveryDashboard extends StatefulWidget {
  const DeliveryDashboard({Key? key}) : super(key: key);

  @override
  _DeliveryDashboardState createState() => _DeliveryDashboardState();
}

class _DeliveryDashboardState extends State<DeliveryDashboard> {
  List<Widget> orders = [];

  void fillOrders() {
    orders.clear();
    Database.orders.forEach((order) {
      orders.add(OrderContainer(order));
    });
  }

  @override
  Widget build(BuildContext context) {
    fillOrders();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xff99cc73),
        title: Center(
          child: Text(
            "Customer Orders",
            style: TextStyle(fontSize: 30),
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
                    children: orders,
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

class OrderContainer extends StatelessWidget {
  OrderContainer(this.order);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 320,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "customer : ${order.customer!.name} , ${order.customer!.location} , ${order.customer!.phoneNO}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "from : ${order.pharmacy!.name} , ${order.pharmacy!.location} , ${order.pharmacy!.phoneNO}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                " ${order.items.length} piece        Total = ${order.calculateTotal()}",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
