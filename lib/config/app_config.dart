import 'dart:developer';

import 'package:chuyendecoso/common/bloc/send_file_bloc.dart';
import 'package:chuyendecoso/config/app_di.dart';
import 'package:chuyendecoso/features/handled_get_file/bloc/handled_get_file_bloc.dart';
import 'package:chuyendecoso/features/notify/bloc/notify_bloc.dart';
import 'package:chuyendecoso/features/overview/bloc/overview_bloc.dart';
import 'package:chuyendecoso/features/tools/bloc/scanning_app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlocProviderEnv {
  static List<BlocProvider> provides = [
    BlocProvider<NotifyBloc>(
      create: (context) => NotifyBloc(),
    ),
    BlocProvider<ScanningAppCubit>(
      create: (context) => ScanningAppCubit(),
    ),
    BlocProvider<OverviewBloc>(
      create: (context) => OverviewBloc(),
    ),
    BlocProvider<HandledGetFileBloc>(
      create: (context) => HandledGetFileBloc(),
    ),
    BlocProvider<SendFileBloc>(
      create: (context) => SendFileBloc(),
    ),
  ];
}

class SharedPreferencesTokenLogin {
  static Future<bool> logined() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool('logined') == true) {
      return true;
    } else
      return false;
  }

  static void saveToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('logined', true);
  }

  static void unsaveToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('logined', false);
    log('Logout');
  }
}
