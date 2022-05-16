import 'package:flutter/material.dart';
import 'package:project1_v1/Admin/AdminDashboard.dart';
import 'package:project1_v1/Customer/CustomerDashboard.dart';
import 'package:project1_v1/Database/Lists.dart';
import 'package:project1_v1/Delivery/DeliveryDashboard.dart';
import 'package:project1_v1/Models/UserModel.dart';
import 'package:project1_v1/Pharmacy/PharmacyDashboard.dart';
import 'package:project1_v1/RecoveryPage.dart';
import 'package:project1_v1/Services/AuthServices.dart';
import 'package:project1_v1/Templates/Templates.dart';
import 'Dialogs/Dialogs.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email = '', _password = '';
  bool _isChecked = false;

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
                        "Login",
                        style: TextStyle(color: Colors.black, fontSize: 40),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: BuildTextField(
                      Icons.lock,
                      'Password',
                      true,
                      (val) {
                        _password = val;
                      },
                      showText: false,
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: _isChecked,
                        fillColor: MaterialStateProperty.resolveWith(
                            (s) => Color(0xff99cc73)),
                        onChanged: (bool? value) {
                          setState(
                            () {
                              _isChecked = value!;
                            },
                          );
                        },
                      ),
                      Text(
                        'Keep me logged in',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        setState(
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SafeArea(child: RecoveryPage());
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'Forgot password ?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_email.isEmpty || _password.isEmpty) {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => ErrorDialog(
                            action: (){Navigator.pop(context);},
                            title: 'Sorry',
                            text:
                                'All of fields are required,\nplease fill all of them.',
                          ),
                        );
                      } else {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => WaitingDialog(),
                        );
                        bool isValid =
                            await AuthService.signIn(_email, _password);

                        if (isValid) {
                          UserType? type;
                          Database.users.forEach(
                            (user) {
                              if (user.email.toLowerCase() ==
                                  _email.toLowerCase()) type = user.type!;
                            },
                          );
                          print(type.toString());
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SafeArea(
                                  child: type == UserType.ADMIN
                                      ? AdminDashboard()
                                      : type == UserType.DELIVERY
                                          ? DeliveryDashboard()
                                          : type == UserType.PHARMACY
                                              ? PharmacyDashboard()
                                              : CustomerDashboard(),
                                );
                              },
                            ),
                          );
                        } else {
                          Navigator.pop(context);
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => ErrorDialog(
                              action: (){Navigator.pop(context);},
                              title: 'Wrong Input',
                              text:
                                  'This email or password is wrong.\nPlease try again.',
                            ),
                          );
                        }
                      }
                    },
                    child: LinearColorBottom(
                      'LOGIN',
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
