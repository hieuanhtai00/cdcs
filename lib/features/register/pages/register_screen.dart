import 'package:chuyendecoso/features/register/component/banner.dart';
import 'package:chuyendecoso/features/register/component/input.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: BannerRegister(),
            flex: 2,
          ),
          Expanded(
            child: InputScreenRegister(),
            flex: 4,
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/login',
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
