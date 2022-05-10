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
  int _selectedtap=0;
  List<Widget> dashboard=[
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color(0xff3CB371),
                            Color(0xff32CD32)
                          ], // red to yellow
                          tileMode: TileMode.repeated,
                        )),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Align(
                            child: GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                            ),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        Expanded(
                          flex: 15,
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 60.0),
                                child: Text(
                                  'Drug Center',
                                  style: TextStyle(color: Colors.white, fontSize: 28),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: dashboard.elementAt(_selectedtap),
                )
              ],
      ),
      bottomNavigationBar: BottomNavigationBar(

        onTap: (index) {
          setState(() {
            _selectedtap = index;
          });
        },
        currentIndex: _selectedtap,
        fixedColor:Color(0xff32CD32),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 45,),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,size: 45,),
              label: 'Search',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded,size: 45,),
              label: 'Cart',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,size: 45,),
              label: 'Profile',
              backgroundColor: Colors.white),
        ],
      ),
    );
  }
}