import 'package:flutter/material.dart';

class AcceptButton extends StatelessWidget {
  AcceptButton({Key? key, required this.title, required this.action})
      : super(key: key);
  VoidCallback? action;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 8),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
    );
  }
}
