import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  InputTextField({
    Key? key,
    required this.label,
    required this.hide,
    required this.child,
    required this.icon,
  }) : super(key: key);
  String label;
  bool hide;
  Widget child;
  Icon icon;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Align(
              child: Text(
                widget.label,
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
            margin: const EdgeInsets.fromLTRB(15, 5, 15, 8),
            padding: const EdgeInsets.all(1),
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
                      child: widget.icon,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: widget.child,
                    flex: 5,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      child: widget.hide
                          ? Icon(Icons.visibility_off)
                          : Container(),
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
