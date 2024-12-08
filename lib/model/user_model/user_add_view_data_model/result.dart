import 'package:collection/collection.dart';

class Result {
  int? userId;
  int? influencerId;
  DateTime? viewTime;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Result({
    this.userId,
    this.influencerId,
    this.viewTime,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        userId: json['user_id'] as int?,
        influencerId: json['influencer_id'] as int?,
        viewTime: json['view_time'] == null
            ? null
            : DateTime.parse(json['view_time'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'influencer_id': influencerId,
        'view_time': viewTime?.toIso8601String(),
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
      userId.hashCode ^
      influencerId.hashCode ^
      viewTime.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode ^
      id.hashCode;
}
