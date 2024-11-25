import 'package:collection/collection.dart';

class User {
  int? id;
  int? roleId;
  String? name;
  String? username;
  dynamic countryId;
  dynamic countryName;
  String? email;
  dynamic emailVerifiedAt;
  String? image;
  String? video;
  dynamic priceRange;
  dynamic firebaseToken;
  String? status;
  dynamic avgRating;
  int? reviewCount;
  dynamic socketId;
  int? isProfileCompleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.roleId,
    this.name,
    this.username,
    this.countryId,
    this.countryName,
    this.email,
    this.emailVerifiedAt,
    this.image,
    this.video,
    this.priceRange,
    this.firebaseToken,
    this.status,
    this.avgRating,
    this.reviewCount,
    this.socketId,
    this.isProfileCompleted,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        roleId: json['role_id'] as int?,
        name: json['name'] as String?,
        username: json['username'] as String?,
        countryId: json['country_id'] as dynamic,
        countryName: json['country_name'] as dynamic,
        email: json['email'] as String?,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        image: json['image'] as String?,
        video: json['video'] as String?,
        priceRange: json['price_range'] as dynamic,
        firebaseToken: json['firebase_token'] as dynamic,
        status: json['status'] as String?,
        avgRating: json['avg_rating'] as dynamic,
        reviewCount: json['review_count'] as int?,
        socketId: json['socket_id'] as dynamic,
        isProfileCompleted: json['is_profile_completed'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'role_id': roleId,
        'name': name,
        'username': username,
        'country_id': countryId,
        'country_name': countryName,
        'email': email,
        'email_verified_at': emailVerifiedAt,
        'image': image,
        'video': video,
        'price_range': priceRange,
        'firebase_token': firebaseToken,
        'status': status,
        'avg_rating': avgRating,
        'review_count': reviewCount,
        'socket_id': socketId,
        'is_profile_completed': isProfileCompleted,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      roleId.hashCode ^
      name.hashCode ^
      username.hashCode ^
      countryId.hashCode ^
      countryName.hashCode ^
      email.hashCode ^
      emailVerifiedAt.hashCode ^
      image.hashCode ^
      video.hashCode ^
      priceRange.hashCode ^
      firebaseToken.hashCode ^
      status.hashCode ^
      avgRating.hashCode ^
      reviewCount.hashCode ^
      socketId.hashCode ^
      isProfileCompleted.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
