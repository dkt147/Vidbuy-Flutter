import 'package:collection/collection.dart';

class ForgotPasswordOtpDataModel {
  bool? Isbool;
  int? status;
  String? message;
  List<dynamic>? result;

  ForgotPasswordOtpDataModel({
    this.Isbool,
    this.status,
    this.message,
    this.result,
  });

  factory ForgotPasswordOtpDataModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordOtpDataModel(
      Isbool: json['bool'] as bool?,
      status: json['status'] as int?,
      message: json['message'] as String?,
      result: json['result'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'bool': Isbool,
        'status': status,
        'message': message,
        'result': result,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ForgotPasswordOtpDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      Isbool.hashCode ^ status.hashCode ^ message.hashCode ^ result.hashCode;
}
