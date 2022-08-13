import 'package:chuyendecoso/config/app_config.dart';
import 'package:chuyendecoso/features/logout/component/logout_button_sure.dart';
import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'LOGOUT - MAYBE SURE',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (Route<dynamic> route) => false,
                );
                SharedPreferencesTokenLogin.unsaveToken();
              },
              child: Text(
                'SURE',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
