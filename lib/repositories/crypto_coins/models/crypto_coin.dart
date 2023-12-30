import 'package:crypto_pro/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'crypto_coin.g.dart';

@HiveType(typeId: 2)
class CryptoCoin extends Equatable {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final CryptoCoinDetail detail;

  const CryptoCoin({
    required this.name,
    required this.detail,
  });

  @override
  List<Object> get props => [name, detail];
}
