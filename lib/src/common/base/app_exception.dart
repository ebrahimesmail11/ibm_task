enum ExceptionType {
  network,
  business,
  cache,
}

class AppException implements Exception {
  ExceptionType? type;
  String message;
  bool status;
  dynamic response;
  dynamic jsonResponse;

  // Constructor to initialize all properties
  AppException(
    this.type, {
    this.message = '',
    this.status = false,
    this.response,
    this.jsonResponse,
  });

  // Factory method for network exception
  factory AppException.networkException(
      String title, bool status, dynamic response) {
    return AppException(
      ExceptionType.network,
      message: title,
      status: status,
      response: response,
    );
  }

  // Factory method for business exception
  factory AppException.businessException(
      bool status, dynamic response, dynamic jsonResponse) {
    return AppException(
      ExceptionType.business,
      status: status,
      response: response,
      jsonResponse: jsonResponse,
    );
  }

  // Factory method for cache exception
  factory AppException.cacheException(
      String title, bool status, dynamic response) {
    return AppException(
      ExceptionType.cache,
      message: title,
      status: status,
      response: response,
    );
  }

  @override
  String toString() {
    return 'AppException(type: $type, message: $message, status: $status, response: $response, jsonResponse: $jsonResponse)';
  }
}
