import 'package:chuyendecoso/features/register/component/button.dart';
import 'package:chuyendecoso/features/register/component/register_button.dart';
import 'package:flutter/material.dart';

class InputScreenRegister extends StatelessWidget {
  InputScreenRegister({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController authPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: EmailInput(email: email),
        ),
        Expanded(
          child: PasswordInput(password: password),
        ),
        Expanded(
          child: AuthPasswordInput(authPassword: authPassword),
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
              child: RegisterButton(
                email: email,
                password: password,
                authPassword: authPassword,
              ),
            ),
          ),
        )
      ],
    );
  }
}
