class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class ValidationException implements Exception {
  final List<String> message;
  ValidationException(this.message);
}
