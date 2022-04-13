import 'dart:convert';

const aMail = "sudo@gmail.com";
const aPsw = "Password@12";

class BasicAuthConfig {
  static final BasicAuthConfig _singleton = BasicAuthConfig._internal();
  String? _token;

  factory BasicAuthConfig() {
    return _singleton;
  }

  BasicAuthConfig._internal();

  bool setAuthCredential(String token) {
    _token = token;
    return true;
  }

  String getAuthCredential() {
    return _token!;
  }

  bool deleteAuthCredential() {
    _token = null;
    return true;
  }

  Map<String, String> getBaseHeader() {
    return {"content-type": "application/json", "accept": "application/json"};
  }

  Map<String, String> getUserHeader() {
    return {
      "content-type": "application/json",
      "accept": "application/json",
      "authorization": "Bearer $_token"
    };
  }

  Map<String, String> getSudoHeader() {
    var credentials = base64.encode(utf8.encode("$aMail:$aPsw"));
    return {
      "content-type": "application/json",
      "accept": "application/json",
      "authorization": "Basic $credentials"
    };
  }
}
