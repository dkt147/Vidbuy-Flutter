import 'package:collection/collection.dart';

class Result {
  int? userId;
  int? influencerId;
  int? videoTypeId;
  String? videoFor;
  String? description;
  String? from;
  String? to;
  String? requiredDays;
  int? deliveryCharges;
  dynamic serviceCharges;
  int? totalPrice;
  String? orderId;
  DateTime? expiresAt;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Result({
    this.userId,
    this.influencerId,
    this.videoTypeId,
    this.videoFor,
    this.description,
    this.from,
    this.to,
    this.requiredDays,
    this.deliveryCharges,
    this.serviceCharges,
    this.totalPrice,
    this.orderId,
    this.expiresAt,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        userId: json['user_id'] as int?,
        influencerId: json['influencer_id'] as int?,
        videoTypeId: json['video_type_id'] as int?,
        videoFor: json['video_for'] as String?,
        description: json['description'] as String?,
        from: json['from'] as String?,
        to: json['to'] as String?,
        requiredDays: json['required_days'] as String?,
        deliveryCharges: json['delivery_charges'] as int?,
        serviceCharges: json['service_charges'] as dynamic,
        totalPrice: json['total_price'] as int?,
        orderId: json['order_id'] as String?,
        expiresAt: json['expires_at'] == null
            ? null
            : DateTime.parse(json['expires_at'] as String),
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
        'video_type_id': videoTypeId,
        'video_for': videoFor,
        'description': description,
        'from': from,
        'to': to,
        'required_days': requiredDays,
        'delivery_charges': deliveryCharges,
        'service_charges': serviceCharges,
        'total_price': totalPrice,
        'order_id': orderId,
        'expires_at': expiresAt?.toIso8601String(),
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
      videoTypeId.hashCode ^
      videoFor.hashCode ^
      description.hashCode ^
      from.hashCode ^
      to.hashCode ^
      requiredDays.hashCode ^
      deliveryCharges.hashCode ^
      serviceCharges.hashCode ^
      totalPrice.hashCode ^
      orderId.hashCode ^
      expiresAt.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode ^
      id.hashCode;
}
