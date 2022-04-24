class Review {
  String id;
  String userId;
  int evaluation;

  Review(
    this.evaluation,
    this.id,
    this.userId,
  );

  String get getId => id;

  set setId(String id) => this.id = id;

  get getUserId => userId;

  set setUserId(userId) => this.userId = userId;

  get getEvaluation => evaluation;

  set setEvaluation(evaluation) => this.evaluation = evaluation;
}
