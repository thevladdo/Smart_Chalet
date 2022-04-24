class Umbrella {
  String id;
  int y;
  int x;
  int qtyLounger;
  bool disponibility;

  Umbrella({
    required this.id,
    required this.y,
    required this.x,
    required this.qtyLounger,
    required this.disponibility,
  });

  factory Umbrella.fromJson(Map<String, dynamic> json) {
    return Umbrella(
        id: json["id"],
        y: json["y"],
        x: json["x"],
        qtyLounger: json["qtyLounger"],
        disponibility: json["disponibility"]);
  }

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

  @override
  String toString() {
    String umbrella =
        "\n ID: $id \n POSITION: ($x,$y) \n LAUNGERS: $qtyLounger \n DISPONIBILITY: $disponibility \n";
    return umbrella;
  }
}
