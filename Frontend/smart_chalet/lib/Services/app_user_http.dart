import 'dart:convert';

import 'package:http/http.dart';
import 'package:smart_chalet/Model/app_user.dart';

class HttpService {
  final String userUrl = "http://localhost:8080/smartchalet/user";

  Future<List<AppUser>> getUser() async {
    Response res = await get(Uri.parse(userUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<AppUser> users =
          body.map((dynamic item) => AppUser.fromJson(item)).toList();
      return users;
    } else {
      throw "Can't get User";
    }
  }
}
