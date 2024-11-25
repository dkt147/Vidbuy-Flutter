import 'package:collection/collection.dart';

class Video {
  int? id;
  int? userId;
  int? requestVideoId;
  String? video;
  dynamic slug;
  String? status;
  dynamic reason;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? hideInProfile;
  String? fullUrl;

  Video({
    this.id,
    this.userId,
    this.requestVideoId,
    this.video,
    this.slug,
    this.status,
    this.reason,
    this.createdAt,
    this.updatedAt,
    this.hideInProfile,
    this.fullUrl,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        requestVideoId: json['request_video_id'] as int?,
        video: json['video'] as String?,
        slug: json['slug'] as dynamic,
        status: json['status'] as String?,
        reason: json['reason'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        hideInProfile: json['hide_in_profile'] as int?,
        fullUrl: json['full_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'request_video_id': requestVideoId,
        'video': video,
        'slug': slug,
        'status': status,
        'reason': reason,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'hide_in_profile': hideInProfile,
        'full_url': fullUrl,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Video) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      requestVideoId.hashCode ^
      video.hashCode ^
      slug.hashCode ^
      status.hashCode ^
      reason.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      hideInProfile.hashCode ^
      fullUrl.hashCode;
}
