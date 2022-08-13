part of 'handled_get_file_bloc.dart';

abstract class HandledGetFileState {}

class GetFileDone extends HandledGetFileState {
  FilePickerResult result;
  List<bool> checked;
  GetFileDone({required this.result, required this.checked});
}

class GetFileNotDone extends HandledGetFileState {}

class Responsed extends HandledGetFileState {
  Responsed({required this.result});
  FilePickerResult result;
}

class GetFileMalware extends HandledGetFileState {
  FilePickerResult result;
  List<String> fileNameMalware;
  GetFileMalware({required this.fileNameMalware, required this.result});
}
