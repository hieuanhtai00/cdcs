import 'dart:math';
import 'package:chuyendecoso/common/image_constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class AnimationLogoWidget extends StatelessWidget {
  const AnimationLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          ImageConstant.antivirus,
        ),
        Padding(
          padding: const EdgeInsets.all(48.0),
          child: AnimationLogo(),
        ),
      ],
    );
  }
}

class AnimationLogo extends StatefulWidget {
  AnimationLogo({Key? key}) : super(key: key);

  @override
  State<AnimationLogo> createState() => _AnimationLogoState();
}

class _AnimationLogoState extends State<AnimationLogo>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = Tween(begin: 0.0, end: pi * 2).animate(animationController);
    //animationController.forward();
    animation
      ..addListener(() {
        setState(() {
          print(animation.value);
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.repeat();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0,
      child: Image.asset(
        ImageConstant.logohvkttm,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
