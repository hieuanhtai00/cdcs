import 'package:chuyendecoso/common/bloc/send_file_bloc.dart';
import 'package:chuyendecoso/features/handled_get_file/bloc/handled_get_file_bloc.dart';
import 'package:chuyendecoso/features/handled_get_file/component/list_file.dart';
import 'package:chuyendecoso/features/handled_get_file/component/list_file_malware.dart';
import 'package:chuyendecoso/features/handled_get_file/component/send_file_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HandledGetFile extends StatefulWidget {
  const HandledGetFile({Key? key}) : super(key: key);

  @override
  State<HandledGetFile> createState() => _HandledGetFileState();
}

class _HandledGetFileState extends State<HandledGetFile> {
  bool loading = false;

  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              height: 40,
              width: 120,
              child: ElevatedButton(
                onPressed: () async {
                  context.read<SendFileBloc>().emit(SendFileInitial());
                  await context.read<HandledGetFileBloc>().pickedFile();
                },
                child: const Center(child: Text('Scanning')),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<HandledGetFileBloc, HandledGetFileState>(
            builder: (context, state) {
              if (state is GetFileDone) {
                return ListFile(
                  result: state.result,
                  checked: state.checked,
                );
              }
              if (state is GetFileMalware) {
                return ListFileMalware(
                  listname: state.fileNameMalware,
                  result: state.result,
                );
              }
              return Container();
            },
          ),
          flex: 2,
        ),
        Expanded(
          child: BlocBuilder<HandledGetFileBloc, HandledGetFileState>(
            builder: (context, state) {
              if (state is GetFileDone) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Center(
                    child: SizedBox(
                      height: 40,
                      width: 120,
                      child: SendFileButton(result: state.result),
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
