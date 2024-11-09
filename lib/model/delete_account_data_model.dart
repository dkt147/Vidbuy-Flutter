import 'package:collection/collection.dart';

class DeleteAccountDataModel {
  String? message;

  DeleteAccountDataModel({this.message});

  factory DeleteAccountDataModel.fromJson(Map<String, dynamic> json) {
    return DeleteAccountDataModel(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DeleteAccountDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => message.hashCode;
}
