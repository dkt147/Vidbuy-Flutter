import 'package:collection/collection.dart';

import 'result.dart';

class CreateUserOrderDataModel {
  final bool boolValue; // Renamed to avoid conflict with Dart's 'bool' keyword
  final dynamic result; // Can be a user object or an empty list
  final String message;

  CreateUserOrderDataModel({
    required this.boolValue,
    this.result,
    required this.message,
  });

  factory CreateUserOrderDataModel.fromJson(Map<String, dynamic> json) {
    return CreateUserOrderDataModel(
      boolValue: json['bool'],
      result: json['result'], // Can be a List or Map, handled in subclasses
      message: json['message'],
    );
  }
}
