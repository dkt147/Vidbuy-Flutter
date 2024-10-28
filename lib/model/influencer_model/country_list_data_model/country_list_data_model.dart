import 'package:collection/collection.dart';

import 'result.dart';

class CountryListDataModel {
  bool? Isbool;
  int? status;
  String? message;
  Result? result;

  CountryListDataModel({this.Isbool, this.status, this.message, this.result});

  factory CountryListDataModel.fromJson(Map<String, dynamic> json) {
    return CountryListDataModel(
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
    if (other is! CountryListDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      Isbool.hashCode ^ status.hashCode ^ message.hashCode ^ result.hashCode;
}
