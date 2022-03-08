class HttpException implements Exception {
  const HttpException(
    this.message,
    this.prefix,
  );

  final String message;
  final String prefix;

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends HttpException {
  FetchDataException([message]) : super(message, "Invalid Request: ");
}

class BadRequestException extends HttpException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends HttpException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

