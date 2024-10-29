import 'package:collection/collection.dart';

import 'result.dart';

class TrendingInfluencersDataModel {
  bool? Isbool;
  Result? result;
  String? message;

  TrendingInfluencersDataModel({this.Isbool, this.result, this.message});

  factory TrendingInfluencersDataModel.fromJson(Map<String, dynamic> json) {
    return TrendingInfluencersDataModel(
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
    if (other is! TrendingInfluencersDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => Isbool.hashCode ^ result.hashCode ^ message.hashCode;
}
