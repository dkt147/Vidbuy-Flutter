import 'package:collection/collection.dart';

import 'result.dart';

class NotificationUpdateDataModel {
  bool? Isbool;
  int? status;
  String? message;
  Result? result;

  NotificationUpdateDataModel({
    this.Isbool,
    this.status,
    this.message,
    this.result,
  });

  factory NotificationUpdateDataModel.fromJson(Map<String, dynamic> json) {
    return NotificationUpdateDataModel(
      Isbool: json['bool'] as bool?,
      status: json['status'] as int?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'bool': bool,
        'status': status,
        'message': message,
        'result': result?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! NotificationUpdateDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      Isbool.hashCode ^ status.hashCode ^ message.hashCode ^ result.hashCode;
}
