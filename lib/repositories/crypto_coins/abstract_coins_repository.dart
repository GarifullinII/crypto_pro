import 'crypto_coins.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CoinDetail> getCoinDetails(String coinName);
}