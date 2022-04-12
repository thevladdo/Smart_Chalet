class BarOrder {
  String orderId;
  String userMail;
  String umbrellaId;
  DateTime date;
  Map<String, int> orderDetails;

  BarOrder(
    this.date,
    this.orderDetails,
    this.orderId,
    this.umbrellaId,
    this.userMail,
  );

  String get getOrderId => orderId;

  set setOrderId(String orderId) => this.orderId = orderId;

  get getUserMail => userMail;

  set setUserMail(userMail) => this.userMail = userMail;

  get getUmbrellaId => umbrellaId;

  set setUmbrellaId(umbrellaId) => this.umbrellaId = umbrellaId;

  get getDate => date;

  set setDate(date) => this.date = date;

  get getOrderDetails => orderDetails;

  set setOrderDetails(orderDetails) => this.orderDetails = orderDetails;
}
