import 'package:flutter/material.dart';
import 'package:project1_v1/Services/AuthServices.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 400,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            BuildTextField(
                              Icons.person,
                              'FullName',
                              false,
                              (val) {
                                _regName = val;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: BuildTextField(
                                Icons.email,
                                'Email',
                                false,
                                (val) {
                                  _regEmail = val;
                                },
                              ),
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
                                Icons.location_on,
                                'Location',
                                false,
                                (val) {
                                  _regLocation = val;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 20, right: 20),
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
                              action: () {Navigator.pop(context);},
                              title: 'Sorry',
                              text:
                                  'All of fields are required,\nplease fill all of them.',
                            ),
                          );
                        } else if (_regPassword.length < 8) {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => ErrorDialog(
                              action: () {Navigator.pop(context);},
                              title: 'Invalid Password',
                              text:
                                  'Please make sure your password \ncontain 8 digits or more',
                            ),
                          );
                        } else
                          try {
                            setState(
                              () async {
                                showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => WaitingDialog());
                                bool isValid = await AuthService.signUp(
                                    _regName,
                                    _regEmail,
                                    _regPassword,
                                    _regPhoneNO,
                                    _regLocation,
                                    context);
                                if (isValid) {
                                  Navigator.pop(context);
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => ErrorDialog(
                                      title: "SUCCESS",
                                      text: "Your account has been\n"
                                          "created successfully.",
                                      buttonTitle: "OK THANKS",
                                      action: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SafeArea(child: SignInPage()),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  print('something wrong');
                                }
                              },
                            );
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
                                  SafeArea(child: SignInPage()),
                            ),
                          );
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
        ),
      ),
    );
  }
}
