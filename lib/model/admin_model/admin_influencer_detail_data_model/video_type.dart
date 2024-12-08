import 'package:collection/collection.dart';

class VideoType {
  String? videoTypeName;
  String? price;

  VideoType({this.videoTypeName, this.price});

  factory VideoType.fromJson(Map<String, dynamic> json) => VideoType(
        videoTypeName: json['video_type_name'] as String?,
        price: json['price'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'video_type_name': videoTypeName,
        'price': price,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VideoType) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => videoTypeName.hashCode ^ price.hashCode;
}
