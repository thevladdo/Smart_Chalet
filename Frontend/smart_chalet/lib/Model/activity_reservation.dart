class ActivityReservation {
  String id;
  String userId;
  DateTime date;
  String activityName;
  int capacity;

  ActivityReservation(
    this.activityName,
    this.capacity,
    this.date,
    this.id,
    this.userId,
  );

  String get getId => id;

  set setId(String id) => this.id = id;

  get getUserId => userId;

  set setUserId(userId) => this.userId = userId;

  get getDate => date;

  set setDate(date) => this.date = date;

  get getActivityName => activityName;

  set setActivityName(activityName) => this.activityName = activityName;

  get getCapacity => capacity;

  set setCapacity(capacity) => this.capacity = capacity;
}
