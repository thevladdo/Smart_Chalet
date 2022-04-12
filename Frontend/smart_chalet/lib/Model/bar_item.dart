class BarItem {
  String id;
  int integerPrice;
  int decimalPrice;
  int disponibility;
  String name;

  BarItem(
    this.decimalPrice,
    this.disponibility,
    this.id,
    this.integerPrice,
    this.name,
  );

  String get getId => id;

  set setId(String id) => this.id = id;

  get getIntegerPrice => integerPrice;

  set setIntegerPrice(integerPrice) => this.integerPrice = integerPrice;

  get getDecimalPrice => decimalPrice;

  set setDecimalPrice(decimalPrice) => this.decimalPrice = decimalPrice;

  get getDisponibility => disponibility;

  set setDisponibility(disponibility) => this.disponibility = disponibility;

  get getName => name;

  set setName(name) => this.name = name;
}
