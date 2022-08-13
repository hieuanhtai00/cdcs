import 'package:chuyendecoso/config/app_config.dart';
import 'package:chuyendecoso/config/app_di.dart';
import 'package:chuyendecoso/features/login/pages/login_screen.dart';
import 'package:chuyendecoso/features/logout/pages/logout_screen.dart';
import 'package:chuyendecoso/features/notify/pages/notify_screen.dart';
import 'package:chuyendecoso/features/overview/pages/overview_screen.dart';
import 'package:chuyendecoso/features/register/pages/register_screen.dart';
import 'package:chuyendecoso/features/splash/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool logined = await SharedPreferencesTokenLogin.logined();
  runApp(MyApp(
    logined: logined,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.logined}) : super(key: key);
  bool logined;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviderEnv.provides,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: logined ? '/overview' : '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/logout': (context) => LogoutScreen(),
          '/splash': (context) => SplashScreen(),
          '/overview': (context) => OverviewScreen(),
          '/notify': (context) => NotifyScreen(),
          '/register': (context) => RegisterScreen(),
        },
        theme: ThemeData(
          fontFamily: 'Comfortaa',
          scaffoldBackgroundColor: Color.fromARGB(255, 89, 184, 144),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
