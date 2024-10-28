import 'package:collection/collection.dart';

class CategoryData {
  int? id;
  String? name;
  String? image;
  String? tagLine;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryData({
    this.id,
    this.name,
    this.image,
    this.tagLine,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        tagLine: json['tag_line'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'tag_line': tagLine,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CategoryData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      tagLine.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
