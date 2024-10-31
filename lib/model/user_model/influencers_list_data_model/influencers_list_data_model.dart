import 'package:collection/collection.dart';

import 'result.dart';

class InfluencersListDataModel {
  bool? Isbool;
  int? status;
  String? message;
  Result? result;

  InfluencersListDataModel({
    this.Isbool,
    this.status,
    this.message,
    this.result,
  });

  factory InfluencersListDataModel.fromJson(Map<String, dynamic> json) {
    return InfluencersListDataModel(
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
    if (other is! InfluencersListDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      Isbool.hashCode ^ status.hashCode ^ message.hashCode ^ result.hashCode;
}
