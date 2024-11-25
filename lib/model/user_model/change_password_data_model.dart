import 'package:collection/collection.dart';

class ChangePasswordDataModel {
  String? message;

  ChangePasswordDataModel({this.message});

  factory ChangePasswordDataModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordDataModel(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ChangePasswordDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => message.hashCode;
}
