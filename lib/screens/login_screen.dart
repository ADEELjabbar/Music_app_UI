// import 'dart:_http';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_app/screens/home_sc.dart';
import 'package:music_app/screens/main_home.dart';
import 'package:music_app/screens/signup_screen.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../widgets/exception.dart';

class Login_Screen extends StatefulWidget {
  static const RouteName = "/login";

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final email = FocusNode();
  final name = FocusNode();
  final password = FocusNode();
  final confirmPass = FocusNode();
  final _form = GlobalKey<FormState>();
  var isLoading = false;
  GoogleSignIn gSn = GoogleSignIn();

  Map<String, String> userData = {
    "email": "",
    "password": "",
  };

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      isLoading = false;
    });
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              backgroundColor: Colors.blueGrey,
              title: Text('An error occured'),
              content: Text(message),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Okay'))
              ],
            ));
  }

  Future<void> saved() async {
    final vali = _form.currentState!.validate();
    if (vali) {
      _form.currentState!.save();
      try {
        await Provider.of<Auth_Provider>(context, listen: false)
            .Login(userData["email"]!, userData["password"]!)
            .then((response) {
          setState(() {
            isLoading = true;
          });
        });
      } on HttpException catch (error) {
        var errorMessage = "Login failed";
        if (error.toString().contains("EMAIL_NOT_FOUND")) {
          errorMessage = 'Could not find a user with this email!';
        } else if (error.toString().contains("INVALID_PASSWORD")) {
          errorMessage = 'Invalid password!';
        } else if (error.toString().contains("INVALID_EMAIL")) {
          errorMessage = 'INVALID_EMAIL!';
        } else {
          return null;
        }
        _showErrorDialog(errorMessage);
      } catch (error) {
        var errorMessage = 'Login Failed!';
        _showErrorDialog(errorMessage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
    final hei = MediaQuery.of(context).size.height;
    late double h = hei / 4;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: wid,
        height: hei,
        color:
// Colors.white,
            Color.fromRGBO(31, 31, 31, 1),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 220,
                  height: 200,
                  child: Image.asset(
                    "assets/headphones.png",
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text("Login",
                    style: TextStyle(
                        color: Color.fromRGBO(236, 197, 0, 1),
                        fontSize: 37,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 12),
                        child:
                        // Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(24),
                        //     boxShadow: [
                        //       BoxShadow(
                        //           color: Colors.grey,
                        //           blurRadius: 5,
                        //           spreadRadius: 0.5),
                        //     ],
                        //   ),
                        //   child:
                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            spreadRadius: 0.5),
                      ],
                    ),

                    child: TextFormField(
                              focusNode: email,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                // errorBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.all(Radius.circular(24)
                                //   )
                                // ),
                                hintText: "email/contact",
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),

                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  // borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(password);
                              },
                              validator: (obj) {
                                if (obj!.length == 0 ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(obj!)) {
                                  return "not valid";
                                } else if (obj.startsWith("0")) {
                                  return "email not valid";
                                } else if (obj.startsWith("1")) {
                                  return "email not valid";
                                } else if (obj.startsWith("2")) {
                                  return "email not valid";
                                } else if (obj.startsWith("3")) {
                                  return "email not valid";
                                } else if (obj.startsWith("4")) {
                                  return "email not valid";
                                } else if (obj.startsWith("5")) {
                                  return "email not valid";
                                } else if (obj.startsWith("6")) {
                                  return "email not valid";
                                } else if (obj.startsWith("7")) {
                                  return "email not valid";
                                } else if (obj.startsWith("8")) {
                                  return "email not valid";
                                } else if (obj.startsWith("9")) {
                                  return "email not valid";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                userData["email"] = value!;
                              },
                            ),
                  ),
                        ),
                      // ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  spreadRadius: 0.5),
                            ],
                          ),
                          child: TextFormField(
                            focusNode: password,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                // borderSide: BorderSide(color: Colors.white),
                              ),
                              hintText: "password",
                            ),
                            // onFieldSubmitted:(_){
                            //   FocusScope.of(context).requestFocus(confirmPass);
                            // },

                            validator: (obj) {
                              if (obj!.length < 8) {
                                return "enter more";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              userData["password"] = value!;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await saved();
                  if (isLoading) {
                    Navigator.pushNamed(context, Main_Home.RouteName);
                  }
                },
                child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      width: 370,
                      height: 50,
                      child: Center(
                          child: Text("Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Text("Remember Password", style: TextStyle(color: Colors.yellow,)),
                    Text("Forgot Password?",
                        style: TextStyle(
                          color: Colors.yellow,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 58.0),
                child: Container(
                  width: 370,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/google.png",
                        width: 30,
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await gSn.signIn();
                          await Navigator.pushNamed(
                              context, Main_Home.RouteName);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Continue with google",
                            style:
                                TextStyle(color: Colors.yellow, fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account ? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Signup_Screen.RouteName);
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(color: Colors.yellow, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
