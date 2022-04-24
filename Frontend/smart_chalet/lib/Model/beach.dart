class Beach {
  int id;
  int qtyLounger;

  Beach(
    this.id,
    this.qtyLounger,
  );

  int get getId => id;

  set setId(int id) => this.id = id;

  get getQtyLounger => qtyLounger;

  set setQtyLounger(qtyLounger) => this.qtyLounger = qtyLounger;
}
