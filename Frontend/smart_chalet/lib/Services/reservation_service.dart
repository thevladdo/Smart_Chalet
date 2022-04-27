import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'package:smart_chalet/Model/reservation.dart';
import 'package:smart_chalet/Services/basic_auth.dart';
import 'package:smart_chalet/Utilities/account_details.dart';
import 'Exception/backend_exception.dart';

class ReservationService {
  String baseUrl = FlutterConfig.get('API_URL');
  Future<Reservation> getReservationInfo() async {
    String userId = GlobUser.mail;
    String apiUrl = FlutterConfig.get('RESERVATION_URL');
    String callUrl = '$apiUrl$userId';
    http.Response res = await http.get(
      Uri.parse(baseUrl + callUrl),
      headers: BasicAuthConfig().getUserHeader(),
    );
    //In res there is a json object and we need to decode it
    try {
      if (res.statusCode == 200) {
        Map<String, dynamic> decodedMap = Map.castFrom(json.decode(res.body));
        Reservation reservation = Reservation.fromJson(decodedMap);
        return reservation;
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
