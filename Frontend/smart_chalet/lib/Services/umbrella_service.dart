import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'package:smart_chalet/Model/umbrella.dart';
import 'Exception/backend_exception.dart';

class UmbrellaService {
  String baseUrl = FlutterConfig.get('API_URL');
  Future<List<Umbrella>> getInfo() async {
    var apiUrl = FlutterConfig.get('UMBRELLA_URL');
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    //In res there is a json object and we need to decode it
    try {
      if (res.statusCode == 200) {
        //we put decoded object in a list
        List<dynamic> list = json.decode(res.body);
        //return the list converted to map where "e" is one of the "objects" returned by json
        return list.map((e) => Umbrella.fromJson(e)).toList();
      } else {
        throw (BackendException(json.decode(res.body)["message"]));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw (BackendException(json.decode(res.body)["message"]));
    }
  }
}
