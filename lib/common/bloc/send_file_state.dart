part of 'send_file_bloc.dart';

@immutable
abstract class SendFileState {}

class SendFileInitial extends SendFileState {}

class SendFileDoing extends SendFileState {}

class SendFileDone extends SendFileState {
  List<String> fileName;
  SendFileDone({required this.fileName});
}
