part of 'scanning_app_cubit.dart';

@immutable
abstract class ScanningAppState {}

class ScanningAppInitial extends ScanningAppState {}

class ScanningAppSuccess extends ScanningAppState {
  ScanningAppSuccess();
}

class ScanningAppFailed extends ScanningAppState {}
