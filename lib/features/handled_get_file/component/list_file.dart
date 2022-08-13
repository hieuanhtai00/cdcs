import 'package:chuyendecoso/features/handled_get_file/bloc/handled_get_file_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListFile extends StatelessWidget {
  ListFile({Key? key, required this.result, required this.checked})
      : super(key: key);
  FilePickerResult result;
  List<bool> checked;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _BuildItem(file: result.files[index], index: index);
      },
      itemCount: result.count,
      physics: BouncingScrollPhysics(),
    );
  }
}

class _BuildItem extends StatefulWidget {
  _BuildItem({Key? key, required this.file, required this.index})
      : super(key: key);
  PlatformFile file;
  int index;
  @override
  State<_BuildItem> createState() => __BuildItemState();
}

class __BuildItemState extends State<_BuildItem> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: Text(
              (widget.index + 1).toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(widget.file.name),
          flex: 4,
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              context.read<HandledGetFileBloc>().openFile(
                    widget.file,
                  );
            },
            icon: Icon(Icons.visibility),
          ),
        ),
      ],
    );
  }
}
