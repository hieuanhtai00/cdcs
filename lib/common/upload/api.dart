import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:chuyendecoso/common/upload/file.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;

String apikey = "5fc14ca04eb743b1f235a1486ef68725";
String url = "https://api.metadefender.com/v4/file/";

class UploadFileApi {
  static Future<bool> uploadFile(String filePath) async {
    try {
      MetaDefender metaDefender = MetaDefender(apikey: apikey, url: url);
      var malware = await metaDefender.scan_file(filePath);
      log('Malware : ' + malware.toString());
      return malware;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}
