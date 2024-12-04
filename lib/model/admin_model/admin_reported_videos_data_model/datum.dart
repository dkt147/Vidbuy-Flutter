import 'package:collection/collection.dart';

import 'influencer_request_video.dart';
import 'influenzer.dart';
import 'user.dart';

class Datum {
  int? id;
  int? reportedVideoId;
  String? status;
  int? userId;
  int? influenzerId;
  dynamic reason;
  DateTime? createdAt;
  DateTime? updatedAt;
  InfluencerRequestVideo? influencerRequestVideo;
  String? fullUrl;
  User? user;
  Influenzer? influenzer;

  Datum({
    this.id,
    this.reportedVideoId,
    this.status,
    this.userId,
    this.influenzerId,
    this.reason,
    this.createdAt,
    this.updatedAt,
    this.influencerRequestVideo,
    this.fullUrl,
    this.user,
    this.influenzer,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        reportedVideoId: json['reported_video_id'] as int?,
        status: json['status'] as String?,
        userId: json['user_id'] as int?,
        influenzerId: json['influenzer_id'] as int?,
        reason: json['reason'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        influencerRequestVideo: json['influencer_request_video'] == null
            ? null
            : InfluencerRequestVideo.fromJson(
                json['influencer_request_video'] as Map<String, dynamic>),
        fullUrl: json['full_url'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        influenzer: json['influenzer'] == null
            ? null
            : Influenzer.fromJson(json['influenzer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'reported_video_id': reportedVideoId,
        'status': status,
        'user_id': userId,
        'influenzer_id': influenzerId,
        'reason': reason,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'influencer_request_video': influencerRequestVideo?.toJson(),
        'full_url': fullUrl,
        'user': user?.toJson(),
        'influenzer': influenzer?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Datum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      reportedVideoId.hashCode ^
      status.hashCode ^
      userId.hashCode ^
      influenzerId.hashCode ^
      reason.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      influencerRequestVideo.hashCode ^
      fullUrl.hashCode ^
      user.hashCode ^
      influenzer.hashCode;
}
