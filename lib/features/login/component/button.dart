import 'package:chuyendecoso/core_component/input_textfield.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  EmailInput({Key? key, required this.emailLogin}) : super(key: key);
  TextEditingController emailLogin;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: const Align(
              child: Text(
                'Email',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 5, 15, 8),
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      child: Icon(Icons.email),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      obscureText: false,
                      obscuringCharacter: '•',
                      style: TextStyle(fontSize: 20),
                      controller: emailLogin,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    flex: 5,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      child: Container(),
                    ),
                  )
                ],
              ),
            ),
          ),
          flex: 3,
        ),
      ],
    );
  }
}

class PasswordInput extends StatefulWidget {
  PasswordInput({Key? key, required this.passwordLogin}) : super(key: key);
  TextEditingController passwordLogin;
  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obSecure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: const Align(
              child: Text(
                'Password',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 5, 15, 8),
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      child: Icon(Icons.password),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      obscureText: obSecure,
                      obscuringCharacter: '•',
                      style: TextStyle(fontSize: 20),
                      controller: widget.passwordLogin,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    flex: 5,
                  ),
                  Expanded(
                    child: Container(
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              obSecure = !obSecure;
                            });
                          },
                          icon: obSecure
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off)),
                    ),
                  )
                ],
              ),
            ),
          ),
          flex: 3,
        ),
      ],
    );
  }
}
