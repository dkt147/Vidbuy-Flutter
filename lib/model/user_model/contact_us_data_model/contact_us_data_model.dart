import 'package:collection/collection.dart';

import 'result.dart';

class ContactUsDataModel {
  bool? Isbool;
  dynamic result;
  String? message;

  ContactUsDataModel({this.Isbool, this.result, this.message});

  factory ContactUsDataModel.fromJson(Map<String, dynamic> json) {
    return ContactUsDataModel(
      Isbool: json['bool'] as bool?,
      result: json['result'],
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
    if (other is! ContactUsDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => Isbool.hashCode ^ result.hashCode ^ message.hashCode;
}
