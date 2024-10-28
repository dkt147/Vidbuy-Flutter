import 'package:collection/collection.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_review_data_model/category_data.dart';

import 'category.dart';

class Category {
  int? id;
  int? userId;
  int? categoryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  CategoryData? category;

  Category({
    this.id,
    this.userId,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        categoryId: json['category_id'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        category: json['category'] == null
            ? null
            : CategoryData.fromJson(json['category'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'category_id': categoryId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'category': category?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Category) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      categoryId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      category.hashCode;
}
