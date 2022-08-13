import 'package:chuyendecoso/common/image_constant.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(58.0),
          child: Image.asset(ImageConstant.antivirus),
        ),
      ),
    );
  }
}
