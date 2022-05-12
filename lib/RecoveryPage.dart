import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1_v1/Templates/Templates.dart';
import 'Dialogs/Dialogs.dart';

class RecoveryPage extends StatefulWidget {
  @override
  _RecoveryPageState createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "Reset Password",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Please enter your email to receive the reset password link : ",
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: BuildTextField(
                      Icons.email,
                      'Email',
                      false,
                      (val) {
                        _email = val;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_email.isEmpty) {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => ErrorDialog(
                            title: 'Sorry',
                            text:
                                'All of fields are required,\nplease fill all of them.',
                          ),
                        );
                      } else {
                        FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
                        Navigator.pop(context);
                      }
                    },
                    child: LinearColorBottom(
                      'SEND',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
