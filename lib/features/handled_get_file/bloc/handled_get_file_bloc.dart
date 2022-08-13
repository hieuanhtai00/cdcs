import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'handled_get_file_event.dart';
part 'handled_get_file_state.dart';

class HandledGetFileBloc
    extends Bloc<HandledGetFileEvent, HandledGetFileState> {
  HandledGetFileBloc() : super(GetFileNotDone());
  FilePickerResult? result;
  List<PlatformFile> choosed = [];
  List<bool> checked = [];
  bool sending = false;

  Future<void> pickedFile() async {
    result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      withReadStream: true,
    );
    if (result == null) {
      emit(GetFileNotDone());
      log('Unpicked File');
    } else {
      checked.clear();
      choosed.clear();
      for (var i = 0; i < result!.count; i++) {
        checked.add(false);
      }
      log('Length result : ' + result!.count.toString());
      log('Picked File');
      emit(
        GetFileDone(
          result: result!,
          checked: checked,
        ),
      );
    }
  }

  Future<void> deleteFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void openFile(PlatformFile file) async {
    OpenFile.open(file.path!);
  }

  void addFileSended(PlatformFile file) {
    choosed.add(file);
  }

  void scanned(List<String> filenamemalware) async {
    emit(GetFileMalware(fileNameMalware: filenamemalware, result: result!));
  }

  void check(int index, bool b) {
    checked[index] = b;
  }
}
