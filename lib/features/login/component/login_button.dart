import 'dart:developer';

import 'package:chuyendecoso/config/app_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton({Key? key, required this.password, required this.username})
      : super(key: key);
  TextEditingController username, password;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        try {
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: username.text,
            password: password.text,
          );
          log('Login done');
          Navigator.pushReplacementNamed(context, '/overview');
          SharedPreferencesTokenLogin.saveToken();
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            log('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            log('Wrong password provided for that user.');
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                e.code,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                ),
              ),
              backgroundColor: Colors.white,
            ),
          );
        }
      },
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
      ),
    );
  }
}
