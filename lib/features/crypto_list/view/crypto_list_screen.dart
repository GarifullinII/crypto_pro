import 'package:crypto_pro/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_pro/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CryptoPro',
          style: theme.textTheme.bodyMedium,
        ),
      ),
      body: (_cryptoCoinList == null) ? const Center(child: CircularProgressIndicator()) :
      ListView.separated(
        separatorBuilder: (context, i) => const Divider(),
        itemCount: _cryptoCoinList!.length,
        itemBuilder: (context, i) {
          final coin = _cryptoCoinList![i];
          return CryptoCoinTile(coin: coin);
        },
      ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}