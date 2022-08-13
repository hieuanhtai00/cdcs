import 'package:chuyendecoso/features/notify/bloc/notify_bloc.dart';
import 'package:chuyendecoso/features/tools/bloc/scanning_app_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class Injection {
  static void provides() {
    getIt.registerSingleton<NotifyBloc>(NotifyBloc());
    getIt.registerSingleton<ScanningAppCubit>(ScanningAppCubit());
  }
}
