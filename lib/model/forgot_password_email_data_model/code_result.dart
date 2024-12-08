import 'package:collection/collection.dart';

class CodeResult {
  int? code;
  int? userId;

  CodeResult({this.code, this.userId});

  factory CodeResult.fromJson(Map<String, dynamic> json) => CodeResult(
        code: json['code'] as int?,
        userId: json['user_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'user_id': userId,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CodeResult) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => code.hashCode ^ userId.hashCode;
}
