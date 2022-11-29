import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/widgets/exception.dart';
class Auth_Provider extends ChangeNotifier{
 Future<void> SignUp(String email, String pass) async {
   try {
     final response = await http.post(Uri.parse(
         "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyC2X3V2V7ygmELnE2khysmqqQQfi7JW6xU"
     ),
       body: json.encode({
         "email": email,
         "password": pass,
         "returnSecureToken": true,
       }),

     );
     print(json.decode(response.body));
   final res=json.decode(response.body);
   if(res["error"]!=null){
     throw HttpException(res["error"]["message"]);
   }
   }catch(error){
     throw error;
   }
 }
  Future<void> Login(String email, String pass) async {
    try {
      final response = await http.post(Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyC2X3V2V7ygmELnE2khysmqqQQfi7JW6xU"),
          body: json.encode({
            "email": email,
            "password": pass,
            "returnSecureToken": true,
          })
      );
      print(json.decode(response.body));
      final res=json.decode(response.body);
      if(res['error'] != null){
        throw HttpException(res['error']['message']);
      }
    }catch(error){
      throw error;
    }
  }
 }