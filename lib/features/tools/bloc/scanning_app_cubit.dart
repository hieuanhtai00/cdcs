import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
part 'scanning_app_state.dart';

class ScanningAppCubit extends Cubit<ScanningAppState> {
  ScanningAppCubit() : super(ScanningAppInitial());
  void uploadApp(File fileApp) async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST", Uri.parse("<url>"));
    //add text fields
    request.fields["text_field"] = 'fields';
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("file_field", fileApp.path);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
  }

  void changeApp(PlatformFile file) {
    emit(ScanningAppSuccess());
  }
}
