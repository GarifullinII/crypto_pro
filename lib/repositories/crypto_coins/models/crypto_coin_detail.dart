import 'crypto_coin.dart';

class CryptoCoinDetail extends CryptoCoin {
  final DateTime lastUpdate;
  final double high24Hour;
  final double low24Hour;

  const CryptoCoinDetail({
    required super.name,
    required super.priceInUSD,
    required super.imageUrl,
    required this.lastUpdate,
    required this.high24Hour,
    required this.low24Hour,
  });

  @override
  List<Object> get props => super.props
    ..addAll([
      lastUpdate,
      high24Hour,
      low24Hour,
    ]);
}
