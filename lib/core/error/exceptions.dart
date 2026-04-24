class ServerException implements Exception {
  final String message;

  ServerException({required this.message});

  @override
  String toString() => 'ServerException(message: "$message")';
}

class CacheException implements Exception {
  final String message;

  CacheException({required this.message});

  @override
  String toString() => 'CacheException(message: "$message")';
}

class InvalidInputException implements Exception {
  final String message;

  InvalidInputException({required this.message});

  @override
  String toString() => 'InvalidInputException(message: "$message")';
}

class UnexpectedException implements Exception {
  final String message;

  UnexpectedException({required this.message});

  @override
  String toString() => 'UnexpectedException(message: "$message")';
}

class NetworkException implements Exception {
  final String message;

  NetworkException({required this.message});

  @override
  String toString() => 'NetworkException(message: "$message")';
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException({required this.message});

  @override
  String toString() => 'NotFoundException(message: "$message")';
}
