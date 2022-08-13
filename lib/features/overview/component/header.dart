import 'package:chuyendecoso/common/image_constant.dart';
import 'package:chuyendecoso/features/logout/pages/logout_screen.dart';
import 'package:flutter/material.dart';

class HeaderOverview extends StatelessWidget {
  const HeaderOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      child: Stack(
        children: [
          Align(
            child: Image.asset(
              ImageConstant.logo2,
              fit: BoxFit.fill,
            ),
            alignment: Alignment.centerLeft,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Align(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LogoutScreen();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.logout_sharp),
              ),
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      ),
    );
  }
}
