class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() => 'ServerException: $message';
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);

  @override
  String toString() => 'CacheException: $message';
}

class InvalidInputException implements Exception {
  final String message;

  InvalidInputException(this.message);

  @override
  String toString() => 'InvalidInputException: $message';
}

class UnexpectedException implements Exception {
  final String message;

  UnexpectedException(this.message);

  @override
  String toString() => 'UnexpectedException: $message';
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException(this.message);

  @override
  String toString() => 'NotFoundException: $message';
}
