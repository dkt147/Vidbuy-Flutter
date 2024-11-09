import 'package:collection/collection.dart';

import 'result.dart';

class UserCompletedOrderListDataModel {
  bool? Isbool;
  Result? result;
  String? message;

  UserCompletedOrderListDataModel({this.Isbool, this.result, this.message});

  factory UserCompletedOrderListDataModel.fromJson(Map<String, dynamic> json) {
    return UserCompletedOrderListDataModel(
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
    if (other is! UserCompletedOrderListDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => Isbool.hashCode ^ result.hashCode ^ message.hashCode;
}
