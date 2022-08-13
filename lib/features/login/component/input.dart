import 'package:chuyendecoso/features/login/component/button.dart';
import 'package:chuyendecoso/features/login/component/login_button.dart';
import 'package:flutter/material.dart';

class InputScreenLogin extends StatelessWidget {
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: EmailInput(
            emailLogin: emailLogin,
          ),
        ),
        Expanded(
          child: PasswordInput(
            passwordLogin: passwordLogin,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 27.0),
            child: Container(
              constraints: BoxConstraints(
                  minWidth: double.infinity, minHeight: double.infinity),
              margin: const EdgeInsets.fromLTRB(15, 5, 15, 8),
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.all(Radius.circular(18)),
                border: Border.all(
                  width: 1.5,
                  color: Colors.black,
                ),
              ),
              child: LoginButton(
                username: emailLogin,
                password: passwordLogin,
              ),
            ),
          ),
        )
      ],
    );
  }
}
