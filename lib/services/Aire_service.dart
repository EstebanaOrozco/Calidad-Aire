import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:calidad_aire/model/aire.dart';

class AireService {
  Future<Aire> getAire(String place) async {
    try {
      final queryParameters = {
        //'key': 'fa513f3a3836416f93e142221221108',
        'q': place,
      };
      final uri =
          Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Aire.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Can not get");
      }
    } catch (e) {
      rethrow;
    }
  }
}
