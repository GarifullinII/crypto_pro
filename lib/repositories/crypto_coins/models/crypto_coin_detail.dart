import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_detail.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetail extends Equatable {

  @HiveField(0)
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @HiveField(1)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  @HiveField(2)
  @JsonKey(
    name: 'LASTUPDATE',
    toJson: _dateTimeToJson,
    fromJson: _dateTimeFromJson,
  )
  final DateTime lastUpdate;

  @HiveField(3)
  @JsonKey(name: 'HIGH24HOUR')
  final double high24Hour;

  @HiveField(4)
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hour;

  const CryptoCoinDetail({
    required this.priceInUSD,
    required this.imageUrl,
    required this.lastUpdate,
    required this.high24Hour,
    required this.low24Hour,
  });

  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);
  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;
  static DateTime _dateTimeFromJson(int milliseconds) =>
      DateTime.fromMillisecondsSinceEpoch(milliseconds);

  @override
  List<Object> get props => [
        priceInUSD,
        imageUrl,
        lastUpdate,
        high24Hour,
        low24Hour,
      ];
}
