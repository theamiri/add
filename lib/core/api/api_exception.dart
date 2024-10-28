class ApiException implements Exception {
  final int? statusCode;
  final Map<String, dynamic>? error;

  ApiException(
    this.statusCode,
    this.error,
  );

  @override
  String toString() {
    return 'ApiException: (status_code: $statusCode, error: $error)';
  }
}
