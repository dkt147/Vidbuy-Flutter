import 'package:collection/collection.dart';

import 'result.dart';

class UserOrderDetailDataModel {
  bool? Isbool;
  List<Result>? result;
  String? message;

  UserOrderDetailDataModel({this.Isbool, this.result, this.message});

  factory UserOrderDetailDataModel.fromJson(Map<String, dynamic> json) {
    return UserOrderDetailDataModel(
      Isbool: json['bool'] as bool?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'bool': Isbool,
        'result': result?.map((e) => e.toJson()).toList(),
        'message': message,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserOrderDetailDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => Isbool.hashCode ^ result.hashCode ^ message.hashCode;
}
