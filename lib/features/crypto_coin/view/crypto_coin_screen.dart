import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../repositories/crypto_coins/crypto_coins_repository.dart';
import '../../../repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({
    super.key,
  });

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoin? coin;

  @override
  void didChangeDependencies() {
    final arg = ModalRoute.of(context)?.settings.arguments;
    assert(
      arg != null && arg is CryptoCoin,
      'Необходимо передать данные типа String',
    );
    coin = arg as CryptoCoin;

    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          coin!.name,
          style: theme.textTheme.bodyMedium,
        ),
      ),
      // TODO: DELETE LATER
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final dio = Dio();
          final cryptoRepo = CryptoCoinsRepository(dio: dio);
          cryptoRepo.getCoinDetails('BTC');
        },
        child: const Text('+'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            '${coin?.imageUrl}',
            height: 32,
            width: 32,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(coin!.name),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text('${((coin!.priceInUSD*10000).round()/10000).toString()} \$'),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hight 24 Hour:'),
                  Text('Low 24 Hour:'),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Column(
                  children: [
                    Text('200100\$'),
                    Text('200500\$'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
