import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1_v1/Customer/CustomerDashboard.dart';
import 'package:project1_v1/RegisterPage.dart';
import 'package:project1_v1/Services/Auth_Services.dart';
import 'package:project1_v1/Templates/Templates.dart';
import 'package:project1_v1/UserTypePage.dart';
import 'Dialogs/Dialogs.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _auth = FirebaseAuth.instance;
  String _email = '', _password = '';
  bool isChecked = false;

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
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: BuildTextField(Icons.email, 'Email', false, (val) {
                      _email = val;
                    })),
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
                      value: isChecked,
                      fillColor: MaterialStateProperty.resolveWith((s)=>Color(0xff32CD32)),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                        'Keep me logged in',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SafeArea(
                                  child: Container() /*RecoveryPage()*/);
                            },
                          ),
                        );
                      });
                    },
                    child: Text(
                      'Forgot password ?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 140,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_email.isEmpty || _password.isEmpty) {
                      showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => ErrorDialog(
                                title: 'Sorry',
                                text:
                                    'All of fields are required,\nplease fill all of them.',
                              ));
                    } else {
                      showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => WaitingDialog());
                      bool isValid = await auth_service.signIn(_email, _password);
                      String currentuserid;

                      if (isValid) {
                        currentuserid = await _auth.currentUser!.uid;
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return SafeArea(
                                child: CustomerDashboard() //todo
                              );
                            }));
                      } else {
                        Navigator.pop(context);
                        showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => ErrorDialog(
                                  title: 'Wrong Input',
                                  text:
                                      'This email or password is wrong.\nPlease try again.',
                                ));
                      }
                    }
                  },
                  child: LinearColorBottom(
                    'LOGIN',
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SafeArea(child: RegisterPage());
                        }));
                      },
                      child: UserTypePage.type==UserType.CUSTOMER ? FooterText(
                        'Don\'t have an account ? ',
                        'Register',
                      ):Container(height: 18,),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
