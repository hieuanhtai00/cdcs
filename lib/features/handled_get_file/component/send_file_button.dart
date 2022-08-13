import 'package:chuyendecoso/common/bloc/send_file_bloc.dart';
import 'package:chuyendecoso/features/handled_get_file/bloc/handled_get_file_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendFileButton extends StatelessWidget {
  SendFileButton({required this.result});
  FilePickerResult result;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // context.read<HandledGetFileBloc>().sendFile();
        context.read<SendFileBloc>().emit(SendFileDoing());
        context.read<SendFileBloc>().uploadFile(result);
      },
      child: Center(
        child: BlocBuilder<SendFileBloc, SendFileState>(
          builder: (context, state) {
            if (state is SendFileInitial) {
              return Text('SEND');
            }
            if (state is SendFileDone) {
              context.read<HandledGetFileBloc>().scanned(state.fileName);
              return Icon(
                Icons.check_box,
                color: Colors.white,
              );
            }
            if (state is SendFileDoing) {
              return CircularProgressIndicator(
                color: Colors.white,
              );
            }
            return Icon(
              Icons.error,
              color: Colors.white,
            );
          },
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green),
      ),
    );
  }
}
