import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ScanningButtonWidget extends StatelessWidget {
  ScanningButtonWidget({Key? key}) : super(key: key);
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        width: 120,
        child: ElevatedButton(
          onPressed: () async {
            result = await FilePicker.platform.pickFiles(
              allowMultiple: false,
              withReadStream: true,
            );
            if (result == null) return;
            final file = result!.files.first;
          },
          child: Text('Scanning'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
        ),
      ),
    );
  }
}
