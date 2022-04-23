import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:smart_chalet/Model/reservation.dart';
import 'package:smart_chalet/Services/basic_auth.dart';
import 'Exception/backend_exception.dart';

class ReservationService {
  String baseUrl = "http://localhost:8080/smartchalet";
  Future<Reservation> getReservationInfo() async {
    String reservationId = 'dd4d6e9d-329f-440e-94e6-3df042f21302';
    var apiUrl = '/reserve/get/' + reservationId;
    http.Response res = await http.get(
      Uri.parse(baseUrl + apiUrl),
      headers: BasicAuthConfig().getUserHeader(),
    );
    //In res there is a json object and we need to decode it
    try {
      if (res.statusCode == 200) {
        Map<String, dynamic> decodedMap = Map.castFrom(json.decode(res.body));
        Reservation reservation = Reservation.fromJson(decodedMap);
        return reservation; //TODO Return reservation not map
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
