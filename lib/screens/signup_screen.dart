import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/providers/auth_provider.dart';
import 'package:music_app/screens/home_sc.dart';
import 'package:music_app/screens/login_screen.dart';
import 'package:music_app/screens/main_home.dart';
import 'package:music_app/widgets/exception.dart';
import 'package:provider/provider.dart';

class Signup_Screen extends StatefulWidget {
  static const RouteName = "/signup";

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  final email = FocusNode();
  final name = FocusNode();
  final password = FocusNode();
  final confirmPass = FocusNode();
  final _form = GlobalKey<FormState>();
  bool isIcon = false;
  bool passVisible = true;
  var isLoading = false;
  TextEditingController _Pass = TextEditingController();

  Map<String, String> userData = {
    "name": "",
    "email": "",
    "password": "",
  };

  @override
  void didChangeDependencies() {
    setState(() {
      isLoading = false;
    });
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPass.dispose();

    // TODO: implement dispose
    super.dispose();
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
            .SignUp(userData["email"]!, userData["password"]!)
            .then((response) {
          setState(() {
            isLoading = true;
          });
        });
      } on HttpException catch (error) {
        var errorMessage = "authentication problem";
        if (error.toString().contains("EMAIL_EXISTS")) {
          errorMessage = 'This email already in use';
        } else if (error.toString().contains("INVALID_EMAIL")) {
          errorMessage = 'This is not a valid email';
        } else if (error.toString().contains("WEAK_PASSWORD")) {
          errorMessage = 'This password is too weak!';
        } else if (error.toString().contains("INVALID_PASSWORD  ")) {
          errorMessage = 'Invalid password!';
        }
        _showErrorDialog(errorMessage);
      } catch (error) {
        throw error;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authObj = Provider.of<Auth_Provider>(context, listen: false)
        .SignUp(userData["email"]!, userData["password"]!);
    final wid = MediaQuery.of(context).size.width;
    final hei = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 31, 31, 1),
      // resizeToAvoidBottomInset: false,
      body: Container(
        width: wid,
        height: hei,
        color:
// Colors.white,
            Color.fromRGBO(31, 31, 31, 1),

        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              // mainAxisAlignment:MainAxisAlignment.center,
              //yeh comment kiya hai,
              // crossAxisAlignment: CrossAxisAlignment.center,

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
                  child: Text("Signup",
                      style: TextStyle(
                          color: Color.fromRGBO(236, 197, 0, 1),
                          fontSize: 37,
                          fontWeight: FontWeight.bold)),
                ),
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 25),
                          child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    spreadRadius: 0.5
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(24),

                              ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,

                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),
                                        // borderSide: BorderSide(color: Colors.white),
                                      ),
                                      // border: InputBorder.none,
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),
                                        // borderSide: BorderSide(color: Colors.white),
                                      ) ,
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),

                                      ),

                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),
                                        // borderSide: BorderSide(color: Colors.white),
                                      ),

                                      // labelText: "name",
                                      hintText: "Name",
// errorBorder: OutlineInputBorder(

                                      // borderRadius: BorderRadius.all(Radius.circular(24)),
// borderSide: BorderSide(color: Colors.white)
// ),
                                    ),
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context).requestFocus(email);
                                    },
                                    validator: (value) {
                                      if (value!.length == 0) {
                                        return "please enter name";
                                      }
                                    },
                                    onSaved: (value) {
                                      userData["name"] = value!;
                                    },
                                  ),
                                ),

                          ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                  blurRadius: 5,
                                  spreadRadius: 0.5
                              ),
                            ],
                            borderRadius: BorderRadius.circular(24),

                          ),
                              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),
                              //   color: Colors.white,
                              // ),
                                child: TextFormField(

                                  focusNode: email,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,

                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),
                                        // borderSide:
                                            // BorderSide(color: Colors.white)
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      // borderSide: BorderSide(color: Colors.white),
                                    ) ,
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),

                                    ),

                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),
                                        // borderSide:
                                            // BorderSide(color: Colors.white)
                                        ),

                                    // errorBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.all(Radius.circular(20)),
                                    //   borderSide: BorderSide(color: Colors.blue)
                                    // ),
// borderSide: BorderSide(color: Colors.white )
                                    hintText: "email/contact",
                                  ),

                                  // label: Text("email/contact"),
                                  // hintText: "email/contact",

                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(password);
                                  },

                                  validator: (obj) {
                                    if (
                                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(obj!)) {
                                      return "not valid";
                                    } else if(obj.length==0){
                                      return "enter email";
                                    }
                                    else if (obj.startsWith("0")) {
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



                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 25),

                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                      blurRadius: 5,
                                      spreadRadius: 0.5
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(24),

                              ),
                              child: TextFormField(
                                focusNode: password,
                                obscureText: passVisible,
                                controller: _Pass,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isIcon = !isIcon;
                                          passVisible = isIcon ? false : true;
                                        });
                                      },
                                      child: Icon(isIcon
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    // borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    // borderSide: BorderSide(color: Colors.white),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),

                                  ),

                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    // borderSide: BorderSide(color: Colors.white),
                                  ) ,

                                  hintText: "password",
                                ),
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(confirmPass);
                                },
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

// yeh umcomment krna hai


                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 25,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                  blurRadius: 5,
                                  spreadRadius: 0.5
                              ),
                            ],
                            borderRadius: BorderRadius.circular(24),

                          ),
                              child: TextFormField(
                                focusNode: confirmPass,
                                obscureText: passVisible,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isIcon = !isIcon;
                                          passVisible = isIcon ? false : true;
                                        });
                                      },
                                      child: Icon(isIcon
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    // borderSide: BorderSide(color: Colors.white),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),

                                  ),

                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    // borderSide: BorderSide(color: Colors.white),
                                  ) ,

                                  // enabledBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(
                                  //     color: Colors.redAccent,
                                  //     width: 5,
                                  //   ),
                                  // ),
                                  // ),
                                  // errorBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(24),

                                  // ),
                                  // border: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(24),

                                  // ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      // borderSide:
                                          // BorderSide(color: Colors.white)
                                      ),
                                  // focusedBorder: UnderlineInputBorder(
                                  //   borderSide: BorderSide(color: Colors.blue, width: 7
                                  //   ),
                                  // ),
                                  hintText: "re-enter Password",
// errorBorder: OutlineInputBorder(
//   borderRadius: BorderRadius.circular(24),
// )
                                ),
                                validator: (obj) {
                                  if (obj!.length < 8) {
                                    return "enter more";
                                  } else if (obj != _Pass.text) {
                                    return "correct password";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),

                       // yeh sy upper wala uncomment krna hai

                       // Padding(
                       //   padding: const EdgeInsets.only( left: 20.0, right: 20.0, top: 25),
                       //       child: Container(
                       //         decoration: BoxDecoration(
                       //           boxShadow: [
                       //              BoxShadow(
                       //                color: Colors.grey,
                       //               blurRadius: 8,
                       //             ),
                       //           ],
                       //           borderRadius: BorderRadius.circular(24),
                       //
                       //         ),
                       //         child: TextFormField(
                       //          focusNode: confirmPass,
                       //          obscureText: passVisible,
                       //          decoration: InputDecoration(
                       //            fillColor: Colors.white,
                       //            filled: true,
                       //            suffixIcon: GestureDetector(
                       //                onTap: () {
                       //                  setState(() {
                       //                    isIcon = !isIcon;
                       //                    passVisible = isIcon ? false : true;
                       //                  });
                       //                },
                       //                child: Icon(isIcon
                       //                    ? Icons.visibility_off
                       //                    : Icons.visibility)),
                       //            focusedBorder: OutlineInputBorder(
                       //              borderRadius: BorderRadius.circular(24),
                       //              borderSide: BorderSide(color: Colors.white),
                       //            ),
                       //            focusedErrorBorder: OutlineInputBorder(
                       //              borderRadius: BorderRadius.circular(24),
                       //              borderSide: BorderSide(color: Colors.white),
                       //            ) ,
                                  // enabledBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(
                                  //     color: Colors.redAccent,
                                  //     width: 5,
                                  //   ),
                                  // ),
                                  // ),
                                  // errorBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(24),
                                  //
                                  // ),
                                  // border: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(24),

                                  // ),
                                  // enabledBorder: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(24),
                                  //     borderSide:
                                  //     BorderSide(color: Colors.white)),
                                  // focusedBorder: UnderlineInputBorder(
                                  //   borderSide: BorderSide(color: Colors.blue, width: 7
                                  //   ),
                                  // ),
                                  // hintText: "re-enter Password",
// errorBorder: OutlineInputBorder(
//   borderRadius: BorderRadius.circular(24),
// )
//                                 ),
//                                 validator: (obj) {
//                                   if (obj!.length < 8) {
//                                     return "enter more";
//                                   } else if (obj != _Pass.text) {
//                                     return "correct password";
//                                   } else {
//                                     return null;
//                                   }
//                                 },
//                       ),
//                              ),
//                            ),

//             Padding(
//               padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25),
//               child: Material(
//                 // color: Colors.yellow,
//                 shadowColor: Colors.grey,
//                 elevation: 10,
//                 borderRadius: BorderRadius.circular(24),
//                 child: Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: TextFormField(
//                     focusNode: confirmPass,
//                     obscureText: passVisible,
//                     decoration: InputDecoration(
//                       fillColor: Colors.blue,
//                       filled: true,
//                       suffixIcon: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isIcon = !isIcon;
//                               passVisible = isIcon ? false : true;
//                             });
//                           },
//                           child: Icon(isIcon
//                               ? Icons.visibility_off
//                               : Icons.visibility)),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(24),
//                         borderSide: BorderSide(color: Colors.white),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(24),
//
//                       ),
//
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(24),
//                         borderSide: BorderSide(color: Colors.white),
//                       ) ,
//
//                       // enabledBorder: OutlineInputBorder(
//                       //   borderSide: BorderSide(
//                       //     color: Colors.redAccent,
//                       //     width: 5,
//                       //   ),
//                       // ),
//                       // ),
//                       // errorBorder: OutlineInputBorder(
//                       //   borderRadius: BorderRadius.circular(24),
//
//                       // ),
//                       // border: OutlineInputBorder(
//                       //   borderRadius: BorderRadius.circular(24),
//
//                       // ),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(24),
//                           borderSide:
//                           BorderSide(color: Colors.white)),
//                       // focusedBorder: UnderlineInputBorder(
//                       //   borderSide: BorderSide(color: Colors.blue, width: 7
//                       //   ),
//                       // ),
//                       hintText: "re-enter Password",
// // errorBorder: OutlineInputBorder(
// //   borderRadius: BorderRadius.circular(24),
// // )
//                     ),
//                     validator: (obj) {
//                       if (obj!.length < 8) {
//                         return "enter more";
//                       } else if (obj != _Pass.text) {
//                         return "correct password";
//                       } else {
//                         return null;
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ),



                    ],
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
                      padding: const EdgeInsets.only(top: 35.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        width: 370,
                        height: 50,
                        child: Center(
                            child: Text("submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      )),
                ),
                Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.only(bottom: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Do you have already an account ? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Login_Screen.RouteName);
                        },
                        child: Text(
                          "login",
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

        // ),
        // ),
      ),
    );
  }
}
