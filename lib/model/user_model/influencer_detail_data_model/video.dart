import 'package:collection/collection.dart';

class Video {
  int? id;
  int? userId;
  int? requestVideoId;
  dynamic link;
  dynamic slug;
  String? status;
  dynamic reason;
  int? hideInProfile;
  String? video;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fullUrl;

  Video({
    this.id,
    this.userId,
    this.requestVideoId,
    this.link,
    this.slug,
    this.status,
    this.reason,
    this.hideInProfile,
    this.video,
    this.createdAt,
    this.updatedAt,
    this.fullUrl,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        requestVideoId: json['request_video_id'] as int?,
        link: json['link'] as dynamic,
        slug: json['slug'] as dynamic,
        status: json['status'] as String?,
        reason: json['reason'] as dynamic,
        hideInProfile: json['hide_in_profile'] as int?,
        video: json['video'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        fullUrl: json['full_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'request_video_id': requestVideoId,
        'link': link,
        'slug': slug,
        'status': status,
        'reason': reason,
        'hide_in_profile': hideInProfile,
        'video': video,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
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
      link.hashCode ^
      slug.hashCode ^
      status.hashCode ^
      reason.hashCode ^
      hideInProfile.hashCode ^
      video.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      fullUrl.hashCode;
}
