import 'package:flutter/material.dart';

class BannerLogin extends StatelessWidget {
  BannerLogin({Key? key}) : super(key: key);
  String label = 'Login';
  String content = 'Login now to scanning app in your device';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 35,
                ),
                onTap: () {
                  if (Navigator.canPop(context)) Navigator.pop(context);
                },
              ),
            ),
          ),
          flex: 2,
        ),
        Expanded(
          child: ListTile(
            title: Text(
              label,
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              content,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          flex: 3,
        ),
      ],
    );
  }
}
