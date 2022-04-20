import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:smart_chalet/Services/basic_auth.dart';
import '../Model/auth_credential.dart';
import 'Exception/backend_exception.dart';

///Return token as Bearer String
class RegisterService {
  String baseUrl = "http://localhost:8080/smartchalet";
  var apiUrl = '/auth/public/addCredential';

  Future<String> register(String name, String surname, String mail,
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
        http.Response resUser = await http.post(
          Uri.parse(baseUrl + "/user/public/add"),
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
          BasicAuthConfig().setAuthCredential(token);
          return token;
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
