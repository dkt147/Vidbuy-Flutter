import 'package:collection/collection.dart';

import 'result.dart';

class UserReviewDataModel {
  bool? Isbool;
  dynamic result;
  String? message;

  UserReviewDataModel({this.Isbool, this.result, this.message});

  factory UserReviewDataModel.fromJson(Map<String, dynamic> json) {
    return UserReviewDataModel(
      Isbool: json['bool'] as bool?,
      result: json['result'],
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'bool': Isbool,
        'result': result?.toJson(),
        'message': message,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserReviewDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => Isbool.hashCode ^ result.hashCode ^ message.hashCode;
}
