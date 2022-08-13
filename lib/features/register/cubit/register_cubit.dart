import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void login(BuildContext context) {}
}
