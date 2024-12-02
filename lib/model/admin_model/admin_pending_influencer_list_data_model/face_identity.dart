import 'package:collection/collection.dart';

class FaceIdentity {
  int? id;
  int? userId;
  String? link;
  String? slug;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? video;

  FaceIdentity({
    this.id,
    this.userId,
    this.link,
    this.slug,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.video
  });

  factory FaceIdentity.fromJson(Map<String, dynamic> json) => FaceIdentity(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        link: json['link'] as String?,
        slug: json['slug'] as String?,
        status: json['status'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
            video: json['video'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'link': link,
        'slug': slug,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'video': link,

      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FaceIdentity) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      link.hashCode ^
      slug.hashCode ^
      status.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      video.hashCode;

}
