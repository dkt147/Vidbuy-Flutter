import 'package:collection/collection.dart';

import 'reviewer.dart';

class Review {
  int? id;
  String? message;
  String? rating;
  DateTime? createdAt;
  DateTime? updatedAt;
  Reviewer? reviewer;

  Review({
    this.id,
    this.message,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.reviewer,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json['id'] as int?,
        message: json['message'] as String?,
        rating: json['rating'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        reviewer: json['reviewer'] == null
            ? null
            : Reviewer.fromJson(json['reviewer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'message': message,
        'rating': rating,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'reviewer': reviewer?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Review) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      message.hashCode ^
      rating.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      reviewer.hashCode;
}
