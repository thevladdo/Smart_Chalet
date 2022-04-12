class Activity {
  String name;
  String description;
  int duration;
  int freeSpots;

  Activity(
    this.name,
    this.description,
    this.duration,
    this.freeSpots,
  );

  String get getName => name;

  set setName(String name) => this.name = name;

  get getDescription => description;

  set setDescription(description) => this.description = description;

  get getDuration => duration;

  set setDuration(duration) => this.duration = duration;

  get getFreeSpots => freeSpots;

  set setFreeSpots(freeSpots) => this.freeSpots = freeSpots;
}
