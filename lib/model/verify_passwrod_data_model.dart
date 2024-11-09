import 'package:collection/collection.dart';

class VerifyPasswrodDataModel {
  bool? Isbool;
  int? status;
  String? message;
  List<dynamic>? result;

  VerifyPasswrodDataModel({
    this.Isbool,
    this.status,
    this.message,
    this.result,
  });

  factory VerifyPasswrodDataModel.fromJson(Map<String, dynamic> json) {
    return VerifyPasswrodDataModel(
      Isbool: json['bool'] as bool?,
      status: json['status'] as int?,
      message: json['message'] as String?,
      result: json['result'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'bool': bool,
        'status': status,
        'message': message,
        'result': result,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VerifyPasswrodDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      Isbool.hashCode ^ status.hashCode ^ message.hashCode ^ result.hashCode;
}
