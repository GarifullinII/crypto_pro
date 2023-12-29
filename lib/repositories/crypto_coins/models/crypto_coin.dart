import 'package:crypto_pro/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  final String name;
  final CryptoCoinDetail detail;

  const CryptoCoin({
    required this.name,
    required this.detail,
  });

  @override
  List<Object> get props => [name, detail];
}
