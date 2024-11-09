import 'package:collection/collection.dart';

import 'influencer_request_video.dart';
import 'user.dart';
import 'video_type.dart';

class RequestVideo {
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
  dynamic serviceCharges;
  String? totalPrice;
  String? status;
  String? orderId;
  dynamic paymentStatus;
  dynamic reason;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? expiresAt;
  User? user;
  VideoType? videoType;
  List<InfluencerRequestVideo>? influencerRequestVideos;

  RequestVideo({
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
    this.orderId,
    this.paymentStatus,
    this.reason,
    this.createdAt,
    this.updatedAt,
    this.expiresAt,
    this.user,
    this.videoType,
    this.influencerRequestVideos,
  });

  factory RequestVideo.fromJson(Map<String, dynamic> json) => RequestVideo(
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
        serviceCharges: json['service_charges'] as dynamic,
        totalPrice: json['total_price'] as String?,
        status: json['status'] as String?,
        orderId: json['order_id'] as String?,
        paymentStatus: json['payment_status'] as dynamic,
        reason: json['reason'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        expiresAt: json['expires_at'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        videoType: json['video_type'] == null
            ? null
            : VideoType.fromJson(json['video_type'] as Map<String, dynamic>),
        influencerRequestVideos:
            (json['influencer_request_videos'] as List<dynamic>?)
                ?.map((e) =>
                    InfluencerRequestVideo.fromJson(e as Map<String, dynamic>))
                .toList(),
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
        'order_id': orderId,
        'payment_status': paymentStatus,
        'reason': reason,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'expires_at': expiresAt,
        'user': user?.toJson(),
        'video_type': videoType?.toJson(),
        'influencer_request_videos':
            influencerRequestVideos?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RequestVideo) return false;
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
      orderId.hashCode ^
      paymentStatus.hashCode ^
      reason.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      expiresAt.hashCode ^
      user.hashCode ^
      videoType.hashCode ^
      influencerRequestVideos.hashCode;
}
