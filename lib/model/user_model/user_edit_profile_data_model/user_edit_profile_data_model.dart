import 'package:collection/collection.dart';

import 'result.dart';

class UserEditProfileDataModel {
  bool? Isbool;
  int? status;
  String? message;
  dynamic result;

  UserEditProfileDataModel({
    this.Isbool,
    this.status,
    this.message,
    this.result,
  });

  factory UserEditProfileDataModel.fromJson(Map<String, dynamic> json) {
    return UserEditProfileDataModel(
        Isbool: json['bool'] as bool?,
        status: json['status'] as int?,
        message: json['message'] as String?,
        result: json['result']);
  }

  Map<String, dynamic> toJson() => {
        'bool': Isbool,
        'status': status,
        'message': message,
        'result': result?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserEditProfileDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      Isbool.hashCode ^ status.hashCode ^ message.hashCode ^ result.hashCode;
}
