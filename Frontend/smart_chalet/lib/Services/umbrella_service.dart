import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:smart_chalet/Model/umbrella.dart';

class UmbrellaService {
  String baseUrl = "http://localhost:8080/smartchalet";
  Future<List<Umbrella>> getInfo() async {
    var apiUrl = '/beach/public/status';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    //In res there is a json object and we need to decode it
    try {
      if (res.statusCode == 200) {
        //we put decoded object in a list
        List<dynamic> list = json.decode(res.body);
        //return the list converted to map where "e" is one of the "objects" returned by json
        return list.map((e) => Umbrella.fromJson(e)).toList();
      } else {
        return <Umbrella>[];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return <Umbrella>[];
    }
  }
}
