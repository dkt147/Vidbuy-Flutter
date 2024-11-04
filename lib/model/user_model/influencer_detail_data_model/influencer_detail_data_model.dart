import 'package:collection/collection.dart';

import 'result.dart';

class InfluencerDetailDataModel {
  bool? Isbool;
  Result? result;
  String? message;

  InfluencerDetailDataModel({this.Isbool, this.result, this.message});

  factory InfluencerDetailDataModel.fromJson(Map<String, dynamic> json) {
    return InfluencerDetailDataModel(
      Isbool: json['bool'] as bool?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'bool': bool,
        'result': result?.toJson(),
        'message': message,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! InfluencerDetailDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => Isbool.hashCode ^ result.hashCode ^ message.hashCode;
}
