import 'package:chuyendecoso/common/image_constant.dart';
import 'package:chuyendecoso/features/login/pages/login_screen.dart';
import 'package:chuyendecoso/features/splash/component/animation_logo.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  void requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                ImageConstant.logo,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
            Text(
              '#1 in the world',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: AnimationLogoWidget(),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 50,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 58.0),
              child: Text(
                'Agree to the Privacy Policy and Terms of Service',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
