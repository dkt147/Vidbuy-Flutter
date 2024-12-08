import 'package:collection/collection.dart';

import 'code_result.dart';

class Result {
  CodeResult? codeResult;

  Result({this.codeResult});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        codeResult: json['result'] == null
            ? null
            : CodeResult.fromJson(json['result'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'result': codeResult?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => codeResult.hashCode;
}
