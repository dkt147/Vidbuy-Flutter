import 'package:collection/collection.dart';

import 'request_video.dart';

class Datum {
  int? id;
  String? requestVideoId;
  String? status;
  String? date;
  String? expiryAt;
  String? orderId;
  String? currentStaus;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? totalPrice;
  RequestVideo? requestVideo;

  Datum({
    this.id,
    this.requestVideoId,
    this.status,
    this.date,
    this.expiryAt,
    this.orderId,
    this.currentStaus,
    this.createdAt,
    this.updatedAt,
    this.totalPrice,
    this.requestVideo,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        requestVideoId: json['request_video_id'] as String?,
        status: json['status'] as String?,
        date: json['date'] as String?,
        expiryAt: json['expiry_at'] as String?,
        orderId: json['order_id'] as String?,
        currentStaus: json['current_staus'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        totalPrice: json['total_price'] as int?,
        requestVideo: json['request_video'] == null
            ? null
            : RequestVideo.fromJson(
                json['request_video'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'request_video_id': requestVideoId,
        'status': status,
        'date': date,
        'expiry_at': expiryAt,
        'order_id': orderId,
        'current_staus': currentStaus,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'total_price': totalPrice,
        'request_video': requestVideo?.toJson(),
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
      requestVideoId.hashCode ^
      status.hashCode ^
      date.hashCode ^
      expiryAt.hashCode ^
      orderId.hashCode ^
      currentStaus.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      totalPrice.hashCode ^
      requestVideo.hashCode;
}
