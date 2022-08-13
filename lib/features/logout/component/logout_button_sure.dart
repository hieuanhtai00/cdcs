import 'package:chuyendecoso/config/app_config.dart';
import 'package:flutter/material.dart';

class LogoutButtonSure extends StatelessWidget {
  LogoutButtonSure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        SharedPreferencesTokenLogin.unsaveToken();
      },
      child: Text(
        'SURE',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
      ),
    );
  }
}
