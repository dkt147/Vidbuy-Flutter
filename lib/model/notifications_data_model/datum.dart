import 'package:collection/collection.dart';

class NotificationDatum {
  int? id;
  int? userId;
  String? title;
  String? body;
  String? notifiable;
  String? data;
  dynamic readAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  NotificationDatum({
    this.id,
    this.userId,
    this.title,
    this.body,
    this.notifiable,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  factory NotificationDatum.fromJson(Map<String, dynamic> json) =>
      NotificationDatum(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        title: json['title'] as String?,
        body: json['body'] as String?,
        notifiable: json['notifiable'] as String?,
        data: json['data'] as String?,
        readAt: json['read_at'] as dynamic,
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
        'title': title,
        'body': body,
        'notifiable': notifiable,
        'data': data,
        'read_at': readAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! NotificationDatum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      title.hashCode ^
      body.hashCode ^
      notifiable.hashCode ^
      data.hashCode ^
      readAt.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
