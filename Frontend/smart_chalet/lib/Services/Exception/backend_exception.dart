class BackendException implements Exception {
  String? message;
  BackendException(this.message);

  @override
  String toString() => message!;
}
