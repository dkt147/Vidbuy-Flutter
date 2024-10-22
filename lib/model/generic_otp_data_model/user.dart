class UserModel {
  final int id;
  final int roleId;
  final String name;
  final String username;
  final int countryId;
  final String countryName;
  final String email;
  final String? emailVerifiedAt;
  final String? image;
  final String? priceRange;
  final String? firebaseToken;
  final String status;
  final double? avgRating;
  final int reviewCount;
  final String? socketId;
  final String createdAt;
  final String updatedAt;
  final bool boolField;

  UserModel({
    required this.id,
    required this.roleId,
    required this.name,
    required this.username,
    required this.countryId,
    required this.countryName,
    required this.email,
    this.emailVerifiedAt,
    this.image,
    this.priceRange,
    this.firebaseToken,
    required this.status,
    this.avgRating,
    required this.reviewCount,
    this.socketId,
    required this.createdAt,
    required this.updatedAt,
    required this.boolField,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      roleId: json['role_id'],
      name: json['name'],
      username: json['username'],
      countryId: json['country_id'],
      countryName: json['country_name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      image: json['image'],
      priceRange: json['price_range'],
      firebaseToken: json['firebase_token'],
      status: json['status'],
      avgRating:
          json['avg_rating'] != null ? json['avg_rating'].toDouble() : null,
      reviewCount: json['review_count'],
      socketId: json['socket_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      boolField: json['bool'],
    );
  }

  toJson() {}
}
