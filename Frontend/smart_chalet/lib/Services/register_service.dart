import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:smart_chalet/Model/app_user.dart';
import 'package:smart_chalet/Services/basic_auth.dart';
import '../Model/auth_credential.dart';
import 'Exception/backend_exception.dart';

///Return token as Bearer String
class RegisterService {
  String baseUrl = "http://localhost:8080/smartchalet";
  var apiUrl = '/auth/public/addCredential';

  Future<AppUser>? register(String name, String surname, String mail,
      String password, Role role) async {
    http.Response res = await http.post(Uri.parse(baseUrl + apiUrl),
        body: jsonEncode({
          'mail': mail,
          'password': password,
          'role': roleToString(Role.CLIENT),
        }),
        headers: BasicAuthConfig().getBaseHeader());

    try {
      if (res.statusCode == 200) {
        String apiUserUrl = '/user/public/add';
        http.Response resUser = await http.post(
          Uri.parse(baseUrl + apiUserUrl),
          body: jsonEncode(
            {
              'name': name,
              'surname': surname,
              'mail': mail,
              'password': password,
              'role': roleToString(Role.CLIENT),
            },
          ),
          headers: BasicAuthConfig().getBaseHeader(),
        );
        if (resUser.statusCode == 200) {
          String token = res.body;
          if (kDebugMode) {
            print(token);
          }
          BasicAuthConfig().setAuthCredential(token);

          Map<String, dynamic> myMap =
              Map<String, dynamic>.from(json.decode(resUser.body));

          return AppUser.fromJson(myMap);

          // List<dynamic> list = json.decode(resUser.body);
          // //return the list converted to map where "e" is one of the "objects" returned by json
          // return list.map((e) => AppUser.fromJson(e)).toList();
        } else {
          throw (BackendException(json.decode(res.body)["message"]));
        }
      } else {
        throw (BackendException(json.decode(res.body)["message"]));
      }
    } catch (e) {
      if (kDebugMode) print(e);
      throw (BackendException(json.decode(res.body)["message"]));
    }
  }
}

String roleToString(Role role) {
  String stringRoles;
  stringRoles = (role.toString().substring(role.toString().indexOf('.') + 1));
  return stringRoles;
}
