import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:smart_chalet/Model/reservation.dart';
import 'package:smart_chalet/Services/basic_auth.dart';
import 'Exception/backend_exception.dart';

class ReservationService {
  String baseUrl = "http://localhost:8080/smartchalet";
  Future<List<Reservation>> getReservationInfo() async {
    String reservationId = 'd860bdba-e449-4571-b957-12f3eddbde86';
    var apiUrl = '/reserve/get/' + reservationId;
    http.Response res = await http.get(
      Uri.parse(baseUrl + apiUrl),
      headers: BasicAuthConfig().getUserHeader(),
    );
    //In res there is a json object and we need to decode it
    try {
      if (res.statusCode == 200) {
        //we put decoded object in a list
        Map<String, dynamic> map = json.decode(res.body);
        List<Reservation> reservations = [];

        map.forEach((key, value) {
          reservations.add(Reservation.fromJson(value));
        });
        return reservations;
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
