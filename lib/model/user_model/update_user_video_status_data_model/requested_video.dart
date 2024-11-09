import 'package:collection/collection.dart';

class RequestedVideo {
  int? userId;
  String? requestVideoId;
  String? video;
  String? status;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  RequestedVideo({
    this.userId,
    this.requestVideoId,
    this.video,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory RequestedVideo.fromJson(Map<String, dynamic> json) {
    return RequestedVideo(
      userId: json['user_id'] as int?,
      requestVideoId: json['request_video_id'] as String?,
      video: json['video'] as String?,
      status: json['status'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'request_video_id': requestVideoId,
        'video': video,
        'status': status,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RequestedVideo) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      userId.hashCode ^
      requestVideoId.hashCode ^
      video.hashCode ^
      status.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode ^
      id.hashCode;
}
