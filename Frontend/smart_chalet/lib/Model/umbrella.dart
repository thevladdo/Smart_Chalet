class Umbrella {
  String id;
  int y;
  int x;
  int qtyLounger;
  bool disponibility;

  Umbrella(
    this.id,
    this.y,
    this.x,
    this.qtyLounger,
    this.disponibility,
  );

  Umbrella.complete(
    this.id,
    this.y,
    this.x,
    this.qtyLounger,
    this.disponibility,
  );

  String get getId => id;

  set setId(String id) => this.id = id;

  get getY => y;

  set setY(y) => this.y = y;

  get getX => x;

  set setX(x) => this.x = x;

  get getQtyLounger => qtyLounger;

  set setQtyLounger(qtyLounger) => this.qtyLounger = qtyLounger;

  get getDisponibility => disponibility;

  set setDisponibility(disponibility) => this.disponibility = disponibility;
}
