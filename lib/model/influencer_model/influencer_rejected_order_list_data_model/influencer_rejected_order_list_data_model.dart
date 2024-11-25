import 'package:collection/collection.dart';

import 'result.dart';

class InfluencerRejectedOrderListDataModel {
  bool? Isbool;
  Result? result;
  String? message;

  InfluencerRejectedOrderListDataModel({
    this.Isbool,
    this.result,
    this.message,
  });

  factory InfluencerRejectedOrderListDataModel.fromJson(
      Map<String, dynamic> json) {
    return InfluencerRejectedOrderListDataModel(
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
    if (other is! InfluencerRejectedOrderListDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => Isbool.hashCode ^ result.hashCode ^ message.hashCode;
}
