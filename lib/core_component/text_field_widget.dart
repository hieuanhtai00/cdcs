import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({
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
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
            child: widget.hide ? Icon(Icons.visibility_off) : Container(),
          ),
        )
      ],
    );
  }
}
