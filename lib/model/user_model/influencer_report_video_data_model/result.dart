import 'package:collection/collection.dart';

class Result {
  int? reportedVideoId;
  String? status;
  int? userId;
  int? influenzerId;
  dynamic reason;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Result({
    this.reportedVideoId,
    this.status,
    this.userId,
    this.influenzerId,
    this.reason,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        reportedVideoId: json['reported_video_id'] as int?,
        status: json['status'] as String?,
        userId: json['user_id'] as int?,
        influenzerId: json['influenzer_id'] as int?,
        reason: json['reason'] as dynamic,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'reported_video_id': reportedVideoId,
        'status': status,
        'user_id': userId,
        'influenzer_id': influenzerId,
        'reason': reason,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
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
      reportedVideoId.hashCode ^
      status.hashCode ^
      userId.hashCode ^
      influenzerId.hashCode ^
      reason.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode ^
      id.hashCode;
}
