class BaseErrorEntity {
  BaseErrorEntity({
    required this.success,
    this.stackTrace,
    required this.message,
  });
  final bool success;
  String? stackTrace;
  final String message;
}
