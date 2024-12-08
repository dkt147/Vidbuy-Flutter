import 'package:collection/collection.dart';

import 'result.dart';

class AdminInfluencerDetailDataModel {
  bool? Isbool;
  Result? result;
  String? message;

  AdminInfluencerDetailDataModel({this.Isbool, this.result, this.message});

  factory AdminInfluencerDetailDataModel.fromJson(Map<String, dynamic> json) {
    return AdminInfluencerDetailDataModel(
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
    if (other is! AdminInfluencerDetailDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => Isbool.hashCode ^ result.hashCode ^ message.hashCode;
}
