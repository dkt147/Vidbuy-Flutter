import 'package:collection/collection.dart';

class Result {
  int? id;
  String? title;
  String? description;
  String? price;
  String? image;
  int? like;
  DateTime? createdAt;
  DateTime? updatedAt;

  Result({
    this.id,
    this.title,
    this.description,
    this.price,
    this.image,
    this.like,
    this.createdAt,
    this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        price: json['price'] as String?,
        image: json['image'] as String?,
        like: json['like'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'image': image,
        'like': like,
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
      title.hashCode ^
      description.hashCode ^
      price.hashCode ^
      image.hashCode ^
      like.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
