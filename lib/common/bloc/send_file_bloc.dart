import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chuyendecoso/common/upload/api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:open_file/open_file.dart';

part 'send_file_event.dart';
part 'send_file_state.dart';

class SendFileBloc extends Bloc<SendFileEvent, SendFileState> {
  SendFileBloc() : super(SendFileInitial()) {
    on<SendFile>((event, emit) => SendFileDoing());
  }

  Future<void> uploadFile(FilePickerResult result) async {
    emit(SendFileDoing());
    int count = result.count;
    int counter = 0;
    List<String> fileNameMalware = [];
    result.files.forEach((element) {
      String? path = element.path;

      // Send file to server
      UploadFileApi.uploadFile(path!, counter).then((value) {
        ++counter;
        if (value == true) {
          fileNameMalware.add(element.name);
        }

        if (counter == count) {
          emit(SendFileDone(fileName: fileNameMalware));
        }
      });
    });
  }
}
