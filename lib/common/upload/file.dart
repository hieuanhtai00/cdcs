import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

class MetaDefender {
  String url;
  String apikey;
  MetaDefender({required this.url, required this.apikey});
  // return response, target is abspath in storage
  Future<bool> scan_file(String target) async {
    var header = {
      "apikey": apikey,
      "content-type": "application/octet-stream",
    };
    var file = await File(target).readAsBytes();
    var response = await http.post(Uri.parse(url), headers: header, body: file);
    var data = jsonDecode(response.body);

    if (__check_response_data(data)) {
      return __request_file_scan_report(data["data_id"].toString());
    }
    return false;
  }

  bool __check_response_data(Map<dynamic, dynamic> data) {
    if (data[0] == "Not Found") {
      return false;
    }
    if (data["success"] == false) {
      return false;
    }
    return true;
  }

  // return dictionary
  Future<bool> __request_file_scan_report(String data_id) async {
    var header = {
      'apikey': apikey,
    };
    var response = await http.get(Uri.parse(url + data_id), headers: header);

    var data = jsonDecode(response.body);

    while (__check_done(data) == false) {
      return __request_file_scan_report(data_id);
    }
    return __parse_scan_report(data);
  }

  bool __check_done(response) {
    if (response["scan_results"]["progress_percentage"] == 100) {
      return true;
    } else
      return false;
  }

  bool __parse_scan_report(data) {
    Map<dynamic, dynamic> scan_result = {};
    Map<dynamic, dynamic> scan_details = {};
    print(data);
    var target = data["file_info"]["display_name"];

    int a = int.parse(data["scan_results"]["total_detected_avs"].toString());
    log(a.toString());
    return a > 0;
  }
}
