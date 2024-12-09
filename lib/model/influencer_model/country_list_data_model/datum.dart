import 'package:collection/collection.dart';

class CountryDatum {
  int? id;
  String? name;
  String? iso3;
  String? numericCode;
  String? iso2;
  String? phonecode;
  String? capital;
  String? currency;
  String? currencyName;
  String? currencySymbol;
  String? tld;
  String? native;
  String? region;
  int? regionId;
  String? subregion;
  int? subregionId;
  String? nationality;
  String? timezones;
  String? translations;
  String? latitude;
  String? longitude;
  String? emoji;
  String? emojiU;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? flag;
  String? wikiDataId;

  CountryDatum({
    this.id,
    this.name,
    this.iso3,
    this.numericCode,
    this.iso2,
    this.phonecode,
    this.capital,
    this.currency,
    this.currencyName,
    this.currencySymbol,
    this.tld,
    this.native,
    this.region,
    this.regionId,
    this.subregion,
    this.subregionId,
    this.nationality,
    this.timezones,
    this.translations,
    this.latitude,
    this.longitude,
    this.emoji,
    this.emojiU,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.flag,
    this.wikiDataId,
  });

  factory CountryDatum.fromJson(Map<String, dynamic> json) => CountryDatum(
        id: json['id'] as int?,
        name: json['name'] as String?,
        iso3: json['iso3'] as String?,
        numericCode: json['numeric_code'] as String?,
        iso2: json['iso2'] as String?,
        phonecode: json['phonecode'] as String?,
        capital: json['capital'] as String?,
        currency: json['currency'] as String?,
        currencyName: json['currency_name'] as String?,
        currencySymbol: json['currency_symbol'] as String?,
        tld: json['tld'] as String?,
        native: json['native'] as String?,
        region: json['region'] as String?,
        regionId: json['region_id'] as int?,
        subregion: json['subregion'] as String?,
        subregionId: json['subregion_id'] as int?,
        nationality: json['nationality'] as String?,
        timezones: json['timezones'] as String?,
        translations: json['translations'] as String?,
        latitude: json['latitude'] as String?,
        longitude: json['longitude'] as String?,
        emoji: json['emoji'] as String?,
        emojiU: json['emojiU'] as String?,
        status: json['status'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        flag: json['flag'] as int?,
        wikiDataId: json['wikiDataId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'iso3': iso3,
        'numeric_code': numericCode,
        'iso2': iso2,
        'phonecode': phonecode,
        'capital': capital,
        'currency': currency,
        'currency_name': currencyName,
        'currency_symbol': currencySymbol,
        'tld': tld,
        'native': native,
        'region': region,
        'region_id': regionId,
        'subregion': subregion,
        'subregion_id': subregionId,
        'nationality': nationality,
        'timezones': timezones,
        'translations': translations,
        'latitude': latitude,
        'longitude': longitude,
        'emoji': emoji,
        'emojiU': emojiU,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'flag': flag,
        'wikiDataId': wikiDataId,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CountryDatum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      iso3.hashCode ^
      numericCode.hashCode ^
      iso2.hashCode ^
      phonecode.hashCode ^
      capital.hashCode ^
      currency.hashCode ^
      currencyName.hashCode ^
      currencySymbol.hashCode ^
      tld.hashCode ^
      native.hashCode ^
      region.hashCode ^
      regionId.hashCode ^
      subregion.hashCode ^
      subregionId.hashCode ^
      nationality.hashCode ^
      timezones.hashCode ^
      translations.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      emoji.hashCode ^
      emojiU.hashCode ^
      status.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      flag.hashCode ^
      wikiDataId.hashCode;
}
