import 'package:collection/collection.dart';

import 'face_identity.dart';
import 'user.dart';

class Result {
  User? user;
  FaceIdentity? faceIdentity;

  Result({this.user, this.faceIdentity});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        faceIdentity: json['face_identity'] == null
            ? null
            : FaceIdentity.fromJson(
                json['face_identity'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'face_identity': faceIdentity?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => user.hashCode ^ faceIdentity.hashCode;
}
