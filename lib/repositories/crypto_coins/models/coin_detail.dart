import 'package:equatable/equatable.dart';

class CoinDetail extends Equatable {
  final String coinName;
  final double priceInUSD;
  final String imageUrl;
  final double high24Hour;
  final double low24Hour;

  const CoinDetail({
    required this.coinName,
    required this.priceInUSD,
    required this.imageUrl,
    required this.high24Hour,
    required this.low24Hour,
  });

  @override
  List<Object> get props => [high24Hour, low24Hour];
}
