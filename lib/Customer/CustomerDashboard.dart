import 'package:flutter/material.dart';
import 'package:project1_v1/Customer/CartPage.dart';
import 'package:project1_v1/Customer/HomePage.dart';
import 'package:project1_v1/Customer/ProfilePage.dart';
import 'package:project1_v1/Customer/SearchPage.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({Key? key}) : super(key: key);

  @override
  _CustomerDashboardState createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  int _selectedTap = 0;
  List<Widget> dashboard = [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xff99cc73),
        title: Center(
          child: Text(
            "Drug Center",
            style: TextStyle(fontSize: 35),
          ),
        ),
        actions: [
          Container(
            width: 60,
          )
        ],
      ),
      body: dashboard.elementAt(_selectedTap),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(
            () {
              _selectedTap = index;
            },
          );
        },
        currentIndex: _selectedTap,
        fixedColor: Color(0xff99cc73),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 45,
              ),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 45,
              ),
              label: 'Search',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_rounded,
                size: 45,
              ),
              label: 'Cart',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 45,
              ),
              label: 'Profile',
              backgroundColor: Colors.white),
        ],
      ),
    );
  }
}
