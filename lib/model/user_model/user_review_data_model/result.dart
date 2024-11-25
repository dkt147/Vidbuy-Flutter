import 'package:collection/collection.dart';

class Result {
  int? userId;
  int? influencerId;
  String? message;
  int? rating;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Result({
    this.userId,
    this.influencerId,
    this.message,
    this.rating,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        userId: json['user_id'] as int?,
        influencerId: json['influencer_id'] as int?,
        message: json['message'] as String?,
        rating: json['rating'] as int?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'influencer_id': influencerId,
        'message': message,
        'rating': rating,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
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
      userId.hashCode ^
      influencerId.hashCode ^
      message.hashCode ^
      rating.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode ^
      id.hashCode;
}
