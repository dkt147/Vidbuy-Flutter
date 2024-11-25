import 'package:collection/collection.dart';

class InfluencerRequestVideo {
  int? id;
  int? userId;
  int? requestVideoId;
  String? video;
  dynamic slug;
  String? status;
  String? reason;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? videoUrl;

  InfluencerRequestVideo({
    this.id,
    this.userId,
    this.requestVideoId,
    this.video,
    this.slug,
    this.status,
    this.reason,
    this.createdAt,
    this.updatedAt,
    this.videoUrl,
  });

  factory InfluencerRequestVideo.fromJson(Map<String, dynamic> json) {
    return InfluencerRequestVideo(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      requestVideoId: json['request_video_id'] as int?,
      video: json['video'] as String?,
      slug: json['slug'] as dynamic,
      status: json['status'] as String?,
      reason: json['reason'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      videoUrl: json['video_url'] as String?,
    );
  }

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
        'video_url': videoUrl,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! InfluencerRequestVideo) return false;
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
      videoUrl.hashCode;
}
