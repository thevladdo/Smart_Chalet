import 'package:smart_chalet/Model/umbrella.dart';

class Qr {
  int umbrellaId;
  Umbrella umbrella;

  Qr(
    this.umbrella,
    this.umbrellaId,
  );

  int get getUmbrellaId => umbrellaId;

  set setUmbrellaId(int umbrellaId) => this.umbrellaId = umbrellaId;

  get getUmbrella => umbrella;

  set setUmbrella(umbrella) => this.umbrella = umbrella;
}
