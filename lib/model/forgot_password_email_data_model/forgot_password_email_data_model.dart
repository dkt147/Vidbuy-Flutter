import 'package:collection/collection.dart';

import 'result.dart';

class ForgotPasswordEmailDataModel {
  bool? Isbool;
  int? status;
  String? message;
  Result? result;

  ForgotPasswordEmailDataModel({
    this.Isbool,
    this.status,
    this.message,
    this.result,
  });

  factory ForgotPasswordEmailDataModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordEmailDataModel(
      Isbool: json['bool'] as bool?,
      status: json['status'] as int?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'bool': Isbool,
        'status': status,
        'message': message,
        'result': result?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ForgotPasswordEmailDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      Isbool.hashCode ^ status.hashCode ^ message.hashCode ^ result.hashCode;
}
