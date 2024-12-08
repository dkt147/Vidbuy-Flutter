import 'package:collection/collection.dart';

class Influencer {
  int? id;
  int? userId;
  dynamic languageId;
  int? pushNotification;
  int? emailNotification;
  int? priceRangeId;
  String? priceRange;
  DateTime? createdAt;
  DateTime? updatedAt;

  Influencer({
    this.id,
    this.userId,
    this.languageId,
    this.pushNotification,
    this.emailNotification,
    this.priceRangeId,
    this.priceRange,
    this.createdAt,
    this.updatedAt,
  });

  factory Influencer.fromJson(Map<String, dynamic> json) => Influencer(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        languageId: json['language_id'] as dynamic,
        pushNotification: json['push_notification'] as int?,
        emailNotification: json['email_notification'] as int?,
        priceRangeId: json['price_range_id'] as int?,
        priceRange: json['price_range'] as String?,
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
        'price_range_id': priceRangeId,
        'price_range': priceRange,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Influencer) return false;
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
      priceRangeId.hashCode ^
      priceRange.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
