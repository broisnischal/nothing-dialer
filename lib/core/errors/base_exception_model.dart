import 'package:nothing_dialer/core/errors/base_exception.dart';

class BaseExceptionModel extends BaseErrorEntity {
  BaseExceptionModel({required super.success, required super.message});

  factory BaseExceptionModel.fromJson(Map<String, dynamic> json) {
    return BaseExceptionModel(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}
