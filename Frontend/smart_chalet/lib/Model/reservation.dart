import 'umbrella.dart';

class Reservation {
  String id;
  String userId;
  DateTime date;
  List<Umbrella> umbrellas;
  //= List<Umbrella>.empty(growable: true)

  Reservation(
    this.id,
    this.userId,
    this.date,
    this.umbrellas,
  );

  String get getId => id;

  set setId(String id) => this.id = id;

  get getUserId => userId;

  set setUserId(userId) => this.userId = userId;

  get getDate => date;

  set setDate(date) => this.date = date;

  get getUmbrellas => umbrellas;

  set setUmbrellas(umbrellas) => this.umbrellas = umbrellas;
}
