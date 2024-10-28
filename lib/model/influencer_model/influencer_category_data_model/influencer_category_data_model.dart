import 'package:collection/collection.dart';

import 'result.dart';

class InfluencerCategoryDataModel {
  bool? boool;
  int? status;
  String? message;
  Result? result;

  InfluencerCategoryDataModel({
    this.boool,
    this.status,
    this.message,
    this.result,
  });

  factory InfluencerCategoryDataModel.fromJson(Map<String, dynamic> json) {
    return InfluencerCategoryDataModel(
      boool: json['bool'] as bool?,
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
    if (other is! InfluencerCategoryDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      boool.hashCode ^ status.hashCode ^ message.hashCode ^ result.hashCode;
}
