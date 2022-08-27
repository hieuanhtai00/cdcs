import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:chuyendecoso/common/upload/file.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;

String apikey = "a89ffd7c1160305f5203d30a12cebe1a";
String url = "https://api.metadefender.com/v4/file/";
List<String> listApikey = [
  "a89ffd7c1160305f5203d30a12cebe1a",
  "b7d2b5b0593f41df1cae55380c5f14fe",
  "09341eb63103d603ef05a5a40013a263",
  "05c03194fd2d9fe9755c7b8b4ee456ae",
];

class UploadFileApi {
  static Future<bool> uploadFile(String filePath, int counter) async {
    try {
      MetaDefender metaDefender =
          MetaDefender(apikey: listApikey[counter % 4] /*apikey*/, url: url);
      var malware = await metaDefender.scan_file(filePath).timeout(
        Duration(
          seconds: 20,
        ),
        onTimeout: () {
          return timeOutResult(filePath);
        },
      );
      log('Malware : ' + malware.toString());
      return malware;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}

bool timeOutResult(String filePath) {
  String fileName = filePath.split('/').last;
  int count = 0;
  return fileName.split('.').length > 2;
}
