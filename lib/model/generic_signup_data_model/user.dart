// class User {
//   final String name; // Maps to "name"
//   final String username; // Maps to "username"
//   final String email; // Maps to "email"
//   final int countryId; // Maps to "country_id"
//   final String countryName; // Maps to "country_name"
//   final int roleId; // Maps to "role_id"
//   final String status; // Maps to "status"
//   final String? image; // Maps to "image" (nullable)
//   final DateTime updatedAt; // Maps to "updated_at"
//   final DateTime createdAt; // Maps to "created_at"
//   final int id; // Maps to "id"
//   final bool isBool; // Maps to "bool"

//   User({
//     required this.name,
//     required this.username,
//     required this.email,
//     required this.countryId,
//     required this.countryName,
//     required this.roleId,
//     required this.status,
//     this.image,
//     required this.updatedAt,
//     required this.createdAt,
//     required this.id,
//     required this.isBool,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       name: json['name'] ?? '',
//       username: json['username'] ?? '',
//       email: json['email'] ?? '',
//       countryId: json['country_id'] ?? 0,
//       countryName: json['country_name'] ?? '',
//       roleId: json['role_id'] ?? 0,
//       status: json['status'] ?? '',
//       image: json['image'], // This can be null
//       updatedAt: DateTime.parse(json['updated_at']),
//       createdAt: DateTime.parse(json['created_at']),
//       id: json['id'] ?? 0,
//       isBool: json['bool'] ?? false,
//     );
//   }
// }

class User {
  final String name;
  final String username;
  final String email;
  final int countryId;
  final String countryName;
  final int roleId;
  final String status;
  final String? image;
  final String updatedAt;
  final String createdAt;
  final int id;
  final bool boolValue; // Renamed to avoid conflict with Dart's 'bool' keyword

  User({
    required this.name,
    required this.username,
    required this.email,
    required this.countryId,
    required this.countryName,
    required this.roleId,
    required this.status,
    required this.image,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.boolValue,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      username: json['username'],
      email: json['email'],
      countryId: json['country_id'],
      countryName: json['country_name'],
      roleId: json['role_id'],
      status: json['status'],
      image: json['image'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
      boolValue: json['bool'],
    );
  }
}