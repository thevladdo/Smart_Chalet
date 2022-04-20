import 'umbrella.dart';

class Reservation {
  String id;
  String userId;
  DateTime date;
  List<Umbrella> umbrellas;
  //= List<Umbrella>.empty(growable: true)

  Reservation({
    required this.id,
    required this.userId,
    required this.date,
    required this.umbrellas,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json["id"],
      userId: json["userId"],
      date: json["date"],
      umbrellas: json["umbrellas"],
    );
  }

  String get getId => id;

  set setId(String id) => this.id = id;

  get getUserId => userId;

  set setUserId(userId) => this.userId = userId;

  get getDate => date;

  set setDate(date) => this.date = date;

  get getUmbrellas => umbrellas;

  set setUmbrellas(umbrellas) => this.umbrellas = umbrellas;
}
