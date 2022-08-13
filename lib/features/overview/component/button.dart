import 'package:chuyendecoso/common/image_constant.dart';
import 'package:flutter/cupertino.dart';

BottomNavigationBarItem HomeButton() {
  return BottomNavigationBarItem(
    icon: SizedBox(
      child: Image.asset(
        ImageConstant.home,
        fit: BoxFit.fill,
      ),
      height: 30,
      width: 30,
    ),
    label: 'Home',
  );
}

BottomNavigationBarItem ToolsButton() {
  return BottomNavigationBarItem(
    icon: SizedBox(
      child: Image.asset(
        ImageConstant.tools,
        fit: BoxFit.fill,
      ),
      height: 30,
      width: 30,
    ),
    label: 'Tools',
  );
}

BottomNavigationBarItem MeButton() {
  return BottomNavigationBarItem(
    icon: SizedBox(
      child: Image.asset(
        ImageConstant.tools,
        fit: BoxFit.fill,
      ),
      height: 30,
      width: 30,
    ),
    label: 'Me',
  );
}
