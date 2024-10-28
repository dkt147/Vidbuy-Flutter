import 'package:collection/collection.dart';

class Result {
  int? id;
  int? userId;
  int? videoTypeId;
  String? videoTypeName;
  String? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  Result({
    this.id,
    this.userId,
    this.videoTypeId,
    this.videoTypeName,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        videoTypeId: json['video_type_id'] as int?,
        videoTypeName: json['video_type_name'] as String?,
        price: json['price'] as String?,
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
        'video_type_id': videoTypeId,
        'video_type_name': videoTypeName,
        'price': price,
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
      videoTypeId.hashCode ^
      videoTypeName.hashCode ^
      price.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
