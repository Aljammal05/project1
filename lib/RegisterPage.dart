import 'package:flutter/material.dart';
import 'package:project1_v1/Services/Auth_Services.dart';
import 'package:project1_v1/SignInPage.dart';
import 'package:project1_v1/Templates/Templates.dart';
import 'Dialogs/Dialogs.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _regName = '',
      _regEmail = '',
      _regPassword = '',
      _regPhoneNO = '',
      _regLocation = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 62,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: 450,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 36.0),
                            child: BuildTextField(
                                Icons.person, 'FullName', false, (val) {
                              _regName = val;
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: BuildTextField(Icons.email, 'Email', false,
                                (val) {
                              _regEmail = val;
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: BuildTextField(
                              Icons.lock,
                              'Password',
                              true,
                              (val) {
                                _regPassword = val;
                              },
                              showText: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: BuildTextField(
                                Icons.phone, 'Phone number', false, (val) {
                              _regPhoneNO = val;
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: BuildTextField(
                                Icons.location_on, 'Location', false, (val) {
                              _regLocation = val;
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    if (_regEmail.isEmpty ||
                        _regPassword.isEmpty ||
                        _regName.isEmpty ||
                        _regPhoneNO.isEmpty ||
                        _regLocation.isEmpty) {
                      showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => ErrorDialog(
                                title: 'Sorry',
                                text:
                                    'All of fields are required,\nplease fill all of them.',
                              ));
                    } else if (_regPassword.length < 8) {
                      showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => ErrorDialog(
                                title: 'Invalid Password',
                                text:
                                    'Please make sure your password \ncontain 8 digits or more',
                              ));
                    } else
                      try {
                        setState(() async {
                          showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => WaitingDialog());
                          bool isValid = await auth_service.signUp(
                              _regName,
                              _regEmail,
                              _regPassword,
                              _regPhoneNO,
                              _regLocation,
                              context);
                          if (isValid) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          } else {
                            print('something wrong');
                          }
                        });
                      } catch (e) {
                        print(e);
                      }
                  },
                  child: LinearColorBottom('REGISTER'),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SafeArea(child: SignInPage())));
                    },
                    child: FooterText(
                      'Already a member ? ',
                      'Login',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
