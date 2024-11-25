import 'package:collection/collection.dart';

import 'result.dart';

class InfluencerSignUpVideoDataModel {
  bool? Isbool;
  Result? result;
  String? message;

  InfluencerSignUpVideoDataModel({this.Isbool, this.result, this.message});

  factory InfluencerSignUpVideoDataModel.fromJson(Map<String, dynamic> json) {
    return InfluencerSignUpVideoDataModel(
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
    if (other is! InfluencerSignUpVideoDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => Isbool.hashCode ^ result.hashCode ^ message.hashCode;
}
