import 'dart:io';

import 'package:chuyendecoso/features/handled_get_file/pages/handled_get_file.dart';
import 'package:chuyendecoso/features/tools/bloc/scanning_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class Tools extends StatefulWidget {
  @override
  State<Tools> createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  void requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 25),
          color: Colors.white,
          child: const Align(
            alignment: Alignment.topCenter,
            child: Text('Phát triển bởi: KMA'),
          ),
        ),
        Expanded(
          child: Container(
            margin:
                const EdgeInsets.only(top: 5, left: 20, bottom: 60, right: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(15),
            ),
            child: HandledGetFile(),
          ),
        ),
      ],
    );
  }
}
