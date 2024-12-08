import 'package:collection/collection.dart';

class Result {
  int? id;
  int? userId;
  dynamic languageId;
  int? pushNotification;
  int? emailNotification;
  DateTime? createdAt;
  DateTime? updatedAt;

  Result({
    this.id,
    this.userId,
    this.languageId,
    this.pushNotification,
    this.emailNotification,
    this.createdAt,
    this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        languageId: json['language_id'] as dynamic,
        pushNotification: json['push_notification'] as int?,
        emailNotification: json['email_notification'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'language_id': languageId,
        'push_notification': pushNotification,
        'email_notification': emailNotification,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      languageId.hashCode ^
      pushNotification.hashCode ^
      emailNotification.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
