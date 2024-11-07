import 'package:collection/collection.dart';

import 'user.dart';
import 'video_type.dart';

class Datum {
  int? id;
  int? userId;
  int? influencerId;
  String? videoFor;
  int? videoTypeId;
  String? from;
  String? to;
  String? description;
  String? requiredDays;
  String? deliveryCharges;
  String? serviceCharges;
  String? totalPrice;
  String? status;
  dynamic paymentStatus;
  dynamic reason;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  VideoType? videoType;

  Datum({
    this.id,
    this.userId,
    this.influencerId,
    this.videoFor,
    this.videoTypeId,
    this.from,
    this.to,
    this.description,
    this.requiredDays,
    this.deliveryCharges,
    this.serviceCharges,
    this.totalPrice,
    this.status,
    this.paymentStatus,
    this.reason,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.videoType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        influencerId: json['influencer_id'] as int?,
        videoFor: json['video_for'] as String?,
        videoTypeId: json['video_type_id'] as int?,
        from: json['from'] as String?,
        to: json['to'] as String?,
        description: json['description'] as String?,
        requiredDays: json['required_days'] as String?,
        deliveryCharges: json['delivery_charges'] as String?,
        serviceCharges: json['service_charges'] as String?,
        totalPrice: json['total_price'] as String?,
        status: json['status'] as String?,
        paymentStatus: json['payment_status'] as dynamic,
        reason: json['reason'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        videoType: json['video_type'] == null
            ? null
            : VideoType.fromJson(json['video_type'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'influencer_id': influencerId,
        'video_for': videoFor,
        'video_type_id': videoTypeId,
        'from': from,
        'to': to,
        'description': description,
        'required_days': requiredDays,
        'delivery_charges': deliveryCharges,
        'service_charges': serviceCharges,
        'total_price': totalPrice,
        'status': status,
        'payment_status': paymentStatus,
        'reason': reason,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
        'video_type': videoType?.toJson(),
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
      userId.hashCode ^
      influencerId.hashCode ^
      videoFor.hashCode ^
      videoTypeId.hashCode ^
      from.hashCode ^
      to.hashCode ^
      description.hashCode ^
      requiredDays.hashCode ^
      deliveryCharges.hashCode ^
      serviceCharges.hashCode ^
      totalPrice.hashCode ^
      status.hashCode ^
      paymentStatus.hashCode ^
      reason.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      user.hashCode ^
      videoType.hashCode;
}
