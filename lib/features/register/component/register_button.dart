import 'dart:developer';

import 'package:chuyendecoso/config/app_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  RegisterButton(
      {Key? key,
      required this.email,
      required this.password,
      required this.authPassword})
      : super(key: key);
  TextEditingController email, password, authPassword;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (password.text != authPassword.text) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'password retype not valid',
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
        try {
          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text,
            password: password.text,
          );
          SharedPreferencesTokenLogin.saveToken();
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/overview',
            (route) => false,
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            log('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            log('The account already exists for that email.');
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
        } catch (e) {
          log(e.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                e.toString(),
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
        'Register',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
      ),
    );
  }
}
