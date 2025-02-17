class ClientError implements Exception {
  final String message;
  ClientError(this.message);

  @override
  String toString() => 'ClientError: $message';
}

class ServerError implements Exception {
  final String message;
  ServerError(this.message);

  @override
  String toString() => 'ServerError: $message';
}

class NetworkError implements Exception {
  final String message;
  NetworkError(this.message);

  @override
  String toString() => 'NetworkError: $message';
}
