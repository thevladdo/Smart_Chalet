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
      id: json['id'],
      userId: json['userId'],
      date: DateTime.tryParse(json['date'])!,
      umbrellas: (json['umbrellas'] as List<dynamic>)
          .cast()
          .map((item) => Umbrella.fromJson(item))
          .toList(),
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

  @override
  String toString() {
    String uToPrint = getUmbrellas[0].toString();
    String reservation =
        "\n ID: $id \n USER ID: ($userId) \n DATE: $date \n UMBRELLAS: $uToPrint \n";
    return reservation;
  }
}
