import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class RequestAndResposeToServer extends StatelessWidget {
  RequestAndResposeToServer({required this.platformFile});
  PlatformFile platformFile;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Text(
              platformFile.name,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Request'),
          ),
        ],
      ),
    );
  }
}
