import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:calidad_aire/model/aire.dart';

class AireService {
  static Future<String> setData({required List<String> data}) async {
    try {
      var client = http.Client();
      final uri = Uri.parse('http://34.231.87.66:8080/userdata');
      final response = await client.post(uri,
          body: {'data': '${data[0]};${data[1]};${data[2]}'},
          headers: {'Accept': '*/*'});

      return response.body;
    } catch (e) {
      log(e.toString());
    }
    return 'e';
  }

  /* static Future<void> getAire(String place) async {
    try {
      var client = http.Client();

      final uri = Uri.parse('http://34.231.87.66:8080/userdata');
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        log(response.toString());
        //return Aire.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Can not get");
      }
    } catch (e) {
      print(e);
    }
  } */
}
