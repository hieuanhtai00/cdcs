import 'package:chuyendecoso/features/login/component/banner.dart';
import 'package:chuyendecoso/features/login/component/input.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: BannerLogin(),
          ),
          Expanded(
            flex: 3,
            child: InputScreenLogin(),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Haven\'t an account? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Comfortaa',
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'Register',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/register',
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
