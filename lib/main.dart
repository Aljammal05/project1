import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project1_v1/WelcomePage.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: SafeArea(child:
      WelcomePage()
      ),
    );
  }
}